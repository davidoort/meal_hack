import pip._vendor.requests as requests
from pip._vendor.requests.auth import HTTPBasicAuth
from models.recipe import Recipe, Ingredient
from pprint import pprint
from tools.db import init_db
from datetime import date

YOUR_KEY = "SR030s2y74bNUt5F1JS8ZRmiunpHwCLq"
AUTH = HTTPBasicAuth(YOUR_KEY, "")
BASE_URL = "https://co2.eaternity.ch"

def create_kitchen(name, kitchen_id, location):
    url = f"{BASE_URL}/api/kitchens/{kitchen_id}"    
    body = {
        "kitchen": {
            "name": name,
            "location": location
        }
    }    
    response = requests.put(url, json=body, auth=AUTH)
    if response.status_code not in [200, 201, 202]:
        print(f"ERROR: Failed PUTting kitchen {kitchen_id} with status {response.status_code}: '{response.text}'")
    else:
        print(f"SUCCESS: PUT kitchen {kitchen_id}")
        return response.json()
    
def put_recipe(recipe: Recipe, kitchen_id, wordlist):
    recipe_id = recipe.slug
    url = f"{BASE_URL}/api/kitchens/{kitchen_id}/recipes/{recipe_id}"    

    ingredients = []
    for ingredient in recipe.ingredients:
        for word in ingredient.text.split(" "):
            lowercase = word.lower()
            lowercase = lowercase.strip()
            if lowercase in wordlist:
                ingredients.append({
                    "id": f"{recipe.slug}-{word}",
                    "names": [{"language": f"{recipe.language}", "value": f"{word}"}],
                    "amount": ingredient.quantity,
                    "unit": "gram",
                })
                continue
        
    body = {
        "recipe": {
            "titles": [
                {
                    "language": f"{recipe.language}",
                    "value": f"{recipe.title}"
                }
            ],
            "date": f"{date.today()}",
            "location": "Schweiz",
            "servings": 1,
            "ingredients": ingredients 
        }
    }    

    response = requests.put(url, json=body, auth=AUTH)
    if response.status_code not in [200, 201, 202]:
        print(f"ERROR: Failed PUTting recipe {recipe_id} with status {response.status_code}: '{response.text}'")
    else:
        print(f"SUCCESS: PUT recipe {recipe_id}")
    
    return response

def readWordlist(path:str):
    wordlist = []
    f = open(path, "r")
    for word in f:
        lowercase = word.lower()
        lowercase = lowercase.strip()
        wordlist.append(lowercase)

    return wordlist


if __name__ == '__main__':
    kitchen_id = "meal_hacks"
    create_kitchen("Migros Kitchen", kitchen_id, "Switzerland")

    init_db()

    wordlist = readWordlist('resources/eaternity_ingredient_database.txt')
    
    recipes = Recipe.objects
    for recipe in recipes:
        response = put_recipe(recipe, kitchen_id, wordlist)
        if response.status_code == 200:
            r = requests.get(f"{BASE_URL}/api/kitchens/{kitchen_id}/recipes/{recipe.slug}?indicators=true", auth=AUTH)
            endresult = r.json()

            rating_translation = {'A': 5, 'B': 4, 'C': 3, 'D': 2, 'E': 1}
            eco_score = rating_translation[endresult['recipe']['rating']]
            nutri_score = rating_translation[endresult['recipe']['indicators']['vita-score']['vita-score-rating']]

            print(f"{recipe.title} -> eco rating : {eco_score}, nutri score: {nutri_score}")
            pprint(endresult)
            
            recipe.update(set__eco_score=eco_score)
            recipe.update(set__nutri_score=nutri_score)
        else:
            print("Failed to submit to the eaternity api")
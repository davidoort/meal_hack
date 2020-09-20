from models.recipe import Recipe, recipeFromMigros
from models.product import Product, productFromMigros
import pip._vendor.requests as requests
from pip._vendor.requests.auth import HTTPBasicAuth
import json
from pprint import pprint
import mongoengine as me
from mongoengine.errors import NotUniqueError
from tools.db import init_db


def scrape_recipe(recipe_name:str, num_recipes: int = 1) -> set:
    queryUrl = f'https://hackzurich-api.migros.ch/hack/recipe/recipes_de/_search?q={recipe_name}'
    response = requests.get(queryUrl, auth=HTTPBasicAuth('hackzurich2020', 'uhSyJ08KexKn4ZFS'))

    ingredient_ids = set()
    if response.status_code == 200:
        data = response.json()
        hits = data["hits"]["hits"]
        for hit in hits : 
            migrosSource = hit["_source"]
            parsedRecipe = recipeFromMigros(migrosSource)
            for ingredient in parsedRecipe.ingredients:
                ingredient_ids.add(ingredient.migros_id)

            try:
                parsedRecipe.save()
                print(f"Saved {parsedRecipe.title}")
            except NotUniqueError:
                pass

    return ingredient_ids

        
def downloadProductInfo(productSet: set, num_products:int = 2) -> set:
    product_ids = set()
    for ingredient_id in productSet:
        queryUrl = f"https://hackzurich-api.migros.ch/products?recipe_ingredient={ingredient_id}&limit={num_products}"
        response = requests.get(queryUrl, auth=HTTPBasicAuth('hackzurich2020', 'uhSyJ08KexKn4ZFS'))
        if (response.status_code != 200): 
            continue

        data = response.json()
        for product in data["products"]:
            parsedProduct = productFromMigros(product, ingredient_id)
            product_ids.add(parsedProduct.migros_id)
            try:
                parsedProduct.save()
            except NotUniqueError:
                pass

    return product_ids

def downloadLogisticsInfo(product_ids):
    def queryUrl(product_id):
        return f"https://hackzurich-api.migros.ch/hack/logistic/orders?articleID={product_id}"
        
    for product_id in product_ids:
        response = requests.get(queryUrl(product_id), auth=HTTPBasicAuth('hackzurich2020', 'uhSyJ08KexKn4ZFS'))
        if (response.status_code != 200):
           continue
       
        data = response.json()
        pprint(data)

if __name__ == "__main__":
    # Connect to database and reset the recipe collection
    init_db()

    # Scrape a boatload of recepies
    meals = ['spaghetti', 'pizza', 'sushi', 'chili con carne', 'tacos', 'curry', 'fondue', 'dahl', 'dim sum']
    ingredient_ids = set()
    for meal in meals:
        possible_ingredients = scrape_recipe(meal, num_recipes=2)
        ingredient_ids = ingredient_ids.union(possible_ingredients)

    exit()
    print(f"{len(ingredient_ids)} ingredients found")

    # Get the products
    product_ids = downloadProductInfo(ingredient_ids, num_products=5) 
    print(f"{len(product_ids)} products found")
    print("Done scraping data")
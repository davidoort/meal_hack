from models.recipe import Recipe, recipeFromMigros
from models.product import Product, productFromMigros
import pip._vendor.requests as requests
from pip._vendor.requests.auth import HTTPBasicAuth
import json
from pprint import pprint
import mongoengine as me
from mongoengine.errors import NotUniqueError
from tools.db import init_db


def scrape_recipe(recipe_name:str):
    queryUrl = f'https://hackzurich-api.migros.ch/hack/recipe/recipes_fr/_search?q={recipe_name}'
    response = requests.get(queryUrl, auth=HTTPBasicAuth('hackzurich2020', 'uhSyJ08KexKn4ZFS'))
    if response.status_code == 200:
        data = response.json()
        hits = data["hits"]["hits"]
        print(f'{len(hits)} recipes found for {recipe_name}')
        productSet = set()
        for hit in hits : 
            migrosSource = hit["_source"]
            parsedRecipe = recipeFromMigros(migrosSource)
            try:
                parsedRecipe.save()
                print(parsedRecipe.title)
            except NotUniqueError:
                pass

            for ingredient in parsedRecipe.ingredients:
                productSet.add(ingredient.migros_id)

        print(f'{len(productSet)} possible products')
        for ingredient_id in productSet:
            queryUrl = f"https://hackzurich-api.migros.ch/products?recipe_ingredient={ingredient_id}"
            response = requests.get(queryUrl, auth=HTTPBasicAuth('hackzurich2020', 'uhSyJ08KexKn4ZFS'))
            if (response.status_code != 200): 
                continue

            data = response.json()
            for product in data["products"]:
                parsedProduct = productFromMigros(product, ingredient_id)
                try:
                    parsedProduct.save()
                    print(parsedProduct.name)
                except NotUniqueError:
                    pass

        print("Done")

if __name__ == "__main__":
    # Connect to database and reset the recipe collection
    init_db()

    meals = ['sushi', 'chili con carne', 'tacos', 'curry', 'fondue', 'dahl', 'dim sum']
    for meal in meals:
        scrape_recipe(meal)
from models.recepie import Recepie, recepieFromMigros
from models.product import Product, productFromMigros
import pip._vendor.requests as requests
from pip._vendor.requests.auth import HTTPBasicAuth
import json
from pprint import pprint
import mongoengine as me

if __name__ == "__main__":

    # Connect to database and reset the recepie collection
    me.connect('meal_hack')
    Recepie.drop_collection()
    
    queryUrl = 'https://hackzurich-api.migros.ch/hack/recipe/recipes_fr/_search?q=pizza'
    response = requests.get(queryUrl, auth=HTTPBasicAuth('hackzurich2020', 'uhSyJ08KexKn4ZFS'))
    data = response.json()

    hits = data["hits"]["hits"]
    print(f'{len(hits)} recepies found')
    productSet = set()
    for hit in hits : 
        print (hit["_source"]["title"])
        migrosSource = hit["_source"]
        parsedRecepie = recepieFromMigros(migrosSource)
        # parsedRecepie.save()

        # TODO scrape all the products as well
        for ingredient in parsedRecepie.ingredients:
            productSet.add(ingredient.migros_id)

    print(productSet)
    for ingredient_id in productSet:
        queryUrl = f"https://hackzurich-api.migros.ch/products?recipe_ingredient={ingredient_id}"
        response = requests.get(queryUrl, auth=HTTPBasicAuth('hackzurich2020', 'uhSyJ08KexKn4ZFS'))
        data = response.json()
        for product in data["products"]:
            parsedProduct = productFromMigros(product, ingredient_id)
            pprint(parsedProduct.to_json())
            exit()
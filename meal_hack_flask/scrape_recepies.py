from models.recepie import Recepie, fromMigros
import pip._vendor.requests as requests
from pip._vendor.requests.auth import HTTPBasicAuth
import json
from pprint import pprint
import mongoengine as me

if __name__ == "__main__":

    # Connect to database
    me.connect('meal_hack')
    
    queryUrl = 'https://hackzurich-api.migros.ch/hack/recipe/recipes_fr/_search?q=pizza'
    response = requests.get(queryUrl, auth=HTTPBasicAuth('hackzurich2020', 'uhSyJ08KexKn4ZFS'))
    data = response.json()

    hits = data["hits"]["hits"]
    print(f'{len(hits)} recepies found')
    for hit in hits : 
        print (hit["_source"]["title"])
        migrosSource = hit["_source"]
        test = fromMigros(migrosSource)
        test.save()
        # pprint(test.to_json())
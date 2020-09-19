# flask packages
from flask import Response, request, jsonify
from flask_restful import Resource

from mongoengine import Q
from datetime import date

# project resources
from api.errors import forbidden
from models.meal import Meal
from models.recipe import Recipe
from models.product import Product

class GroceryCartApi(Resource):
    """
    Resource to get all the meals stored in the database
    """
    def get(self) -> Response:
        ingredient_id_quantity = {}
        upcoming_meals = Meal.objects.filter((Q(date__gte=date.today())))
        for meal in upcoming_meals:
            recipe = Recipe.objects.filter((Q(migros_id=meal.recipe_id))).first()
            print(recipe)
            for ingredient in recipe.ingredients:
                if ingredient.migros_id not in ingredient_id_quantity:
                    ingredient_id_quantity[ingredient.migros_id] = ingredient.quantity
                else:
                    ingredient_id_quantity[ingredient.migros_id] += ingredient.quantity

        grocery_list = []
        for key, value in ingredient_id_quantity.items():
            product = Product.objects(ingredient_id=key).first()
            if product is not None:
                grocery_list.append({
                    'product': product,
                    'quantity': value
                })


        return jsonify(grocery_list)

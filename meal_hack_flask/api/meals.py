# flask packages
from flask import Response, request, jsonify
from flask_restful import Resource

# project resources
from models.meal import Meal
from api.errors import forbidden

class MealsApi(Resource):
    """
    Resource to get all the meals stored in the database
    """

    def get(self) -> Response:
        output = Meal.objects()
        return jsonify({'result': output})

    def post(self) -> Response:
        data = request.get_json()
        post_user = Meal(**data).save()
        return jsonify({'result': post_user})

class MealApi(Resource):
    """
    Resource to get a specific meal stored in the database
    """

    def get(self, meal_id: str) -> Response:
        output = Meal.objects(id=meal_id)
        return jsonify({'result': output})

    def put(self, meal_id:str) -> Response:
        data = request.get_json()
        put_user = Meal.objects(id=meal_id).update(**data)
        return jsonify({'result': put_user})

    def delete(self, meal_id:str) -> Response:
        delete_user = Meal.objects(id=meal_id).delete()
        return jsonify({'result': delete_user})

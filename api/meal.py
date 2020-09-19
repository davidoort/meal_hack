# flask packages
from flask import jsonify
from flask_restful import Resource

# mongo-engine models
from models.meals import Meals

class MealsApi(Resource):
    def get(self):
        output = Meals.objects()
        return jsonify({'result': output})
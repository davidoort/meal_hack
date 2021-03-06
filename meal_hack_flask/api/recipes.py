# flask packages
from flask import Response, request, jsonify
from flask_restful import Resource

# project resources
from models.recipe import Recipe
from api.errors import forbidden

class RecipesApi(Resource):
    """
    Resource to get all the meals stored in the database
    """

    def get(self) -> Response:
        output = Recipe.objects()
        return jsonify(output)

    def post(self) -> Response:
        data = request.get_json()
        post_user = Recipe(**data).save()
        return jsonify(post_user)

class RecipeApi(Resource):
    """
    Resource to get a specific meal stored in the database
    """

    def get(self, migros_id: int) -> Response:
        output = Recipe.objects(migros_id=migros_id)
        return jsonify(output)

    def put(self, migros_id:int) -> Response:
        data = request.get_json()
        put_user = Recipe.objects(migros_id=migros_id).update(**data)
        return jsonify(put_user)

    def delete(self, migros_id:int) -> Response:
        delete_user = Recipe.objects(migros_id=migros_id).delete()
        return jsonify(delete_user)

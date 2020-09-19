# flask packages
from flask import Response, request, jsonify
from flask_restful import Resource

# project resources
from api.errors import forbidden

class IndexApi(Resource):
    """
    Resource to get all the meals stored in the database
    """
    def get(self) -> Response:
        return jsonify({"message": "Welcome to the meal hacks api!"})

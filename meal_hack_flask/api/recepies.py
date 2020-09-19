# flask packages
from flask import Response, request, jsonify
from flask_restful import Resource

# project resources
from models.recepie import Recepie
from api.errors import forbidden

class RecepiesApi(Resource):
    """
    Resource to get all the meals stored in the database
    """

    def get(self) -> Response:
        output = Recepie.objects()
        return jsonify({'result': output})

    def post(self) -> Response:
        data = request.get_json()
        post_user = Recepie(**data).save()
        return jsonify({'result': post_user})

class RecepieApi(Resource):
    """
    Resource to get a specific meal stored in the database
    """

    def get(self, migros_id: int) -> Response:
        output = Recepie.objects(id=migros_id)
        return jsonify({'result': output})

    def put(self, migros_id:int) -> Response:
        data = request.get_json()
        put_user = Recepie.objects(id=migros_id).update(**data)
        return jsonify({'result': put_user})

    def delete(self, migros_id:int) -> Response:
        delete_user = Recepie.objects(id=migros_id).delete()
        return jsonify({'result': delete_user})

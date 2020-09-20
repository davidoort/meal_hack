# flask packages
from flask import Response, request, jsonify
from flask_restful import Resource

# project resources
from models.product import Product
from api.errors import forbidden

class ProductsApi(Resource):
    """
    Resource to get all the meals stored in the database
    """

    def get(self) -> Response:
        output = Product.objects()
        return jsonify(output)

    def post(self) -> Response:
        data = request.get_json()
        post_user = Product(**data).save()
        return jsonify(post_user)

class ProductApi(Resource):
    """
    Resource to get a specific meal stored in the database
    """

    def get(self, migros_id: int) -> Response:
        output = Product.objects(migros_id=migros_id).first()
        return jsonify(output)

    def put(self, migros_id:int) -> Response:
        data = request.get_json()
        put_user = Product.objects(migros_id=migros_id).update(**data)
        return jsonify(put_user)

    def delete(self, migros_id:int) -> Response:
        delete_user = Product.objects(migros_id=migros_id).delete()
        return jsonify(delete_user)

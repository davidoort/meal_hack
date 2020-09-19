# flask packages
from flask import Response, request, jsonify
from flask_restful import Resource

# project resources
from models.user import User

class UsersApi(Resource):
    """
    Resource to access all the users in a db
    """
    def get(self) -> Response:
        output = User.objects()
        return jsonify(output)


class UserApi(Resource):
    """
    Resource to access a specific user in the db
    """

    def get(self, user_id: str) -> Response:
        output = User.objects(id=user_id)
        return jsonify(output)

    def put(self, user_id: str) -> Response:
        data = request.get_json()
        put_user = User.objects(id=user_id).update(**data)
        return jsonify(put_user)
    
    def delete(self, user_id: str) -> Response:
        output = User.objects(id=user_id).delete()
        return jsonify(output)

   
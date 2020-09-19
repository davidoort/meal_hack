# flask packages
from flask import Response, jsonify

def unauthorized() -> Response:
    output = {
        'error': {
            'msg': '401 error: Unauthorized access'
        }
    }
    resp = jsonify({'result': output})
    resp.status_code = 401
    return resp


def forbidden() -> Response:
    output = {
        'error': {
            'msg': '403 error: Forbidden action'
        }
    }
    resp = jsonify({'result': output})
    resp.status_code = 403
    return resp


def invalid_route() -> Response:
    output = {
        'error': {
            'msg': '404 error: Resource not found'
        }
    }
    resp = jsonify({'result': output})
    resp.status_code = 404
    return resp



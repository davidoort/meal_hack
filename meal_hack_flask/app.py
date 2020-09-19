# flask packages
from flask import Flask, app
from flask_restful import Api
from tools.db import init_db

# local packages
from api.routes import create_routes

def get_flask_app(config: dict = None) -> app.Flask:
    """
    """

    # init flask app
    flask_app = Flask(__name__)

    # configure app
    flask_app.config.update(config)

    #init api and routes
    api = Api(app=flask_app)
    create_routes(api=api)

    # init db
    init_db(config)
    
    return flask_app

    
if __name__ == '__main__':
    # main entry point when run in stand-alone mode
    app = get_flask_app()
    app.run(debug=True)
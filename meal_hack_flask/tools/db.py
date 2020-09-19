from flask_mongoengine import MongoEngine
import mongoengine as me

# default mongodb configuration
default_config = {
    'MONGODB_SETTINGS': {
        'db': 'meal_hack',
        'host': 'localhost',
        'port': 27017,
         
    }
}

def init_db(app = None, config: dict = None):
    if (app is None and config is None):
        me.connect(default_config["MONGODB_SETTINGS"]["db"])
    else:
        config = default_config if config is None else config
        db = MongoEngine(app=app)




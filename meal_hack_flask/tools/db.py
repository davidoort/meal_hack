from flask_mongoengine import MongoEngine
import mongoengine as me

# default mongodb configuration
def get_default_config():
    return {
        'MONGODB_SETTINGS': {
            'db': 'meal_hack',
            'host': 'localhost',
            'port': 27017,
        }
    }

def init_db(app = None, config: dict = None):
    default_config = get_default_config()
    if (app is None and config is None):
        me.connect(default_config["MONGODB_SETTINGS"]["db"])
    else:
        config = default_config if config is None else config
        db = MongoEngine(app=app)




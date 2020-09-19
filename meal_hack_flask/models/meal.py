from mongoengine import Document, StringField, FloatField, DateField, IntField, ReferenceField
from models.recipe import Recipe

class Meal(Document):
    """
    Template for mongoengine document, which represent's a meal
    :param name: required string value
    :param description: optional string value, max 240 characters
    :param price: optional float value
    :param image_url: optional string image url
    :Example:
    """

    # user_id = StringField(required=True)
    date = DateField(required=True)
    quantity = IntField(min_value=1)
    note = StringField(max_length=240)
    recipe_id = IntField(required=True)
    recipe_title = StringField(requried=True)
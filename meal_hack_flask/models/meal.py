from mongoengine import Document, StringField, FloatField

class Meal(Document):
    """
    Template for mongoengine document, which represent's a meal
    :param name: required string value
    :param description: optional string value, max 240 characters
    :param price: optional float value
    :param image_url: optional string image url
    :Example:
    """

    name = StringField(required=True)
    description = StringField(max_length=240)
    price = FloatField()
    image_url = StringField()
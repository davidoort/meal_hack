from mongoengine import (
    Document, 
    StringField, 
    FloatField, 
    DateField, 
    IntField, 
    EmbeddedDocument,
    EmbeddedDocumentField,
    ListField
)

class Image(EmbeddedDocument):
    original = StringField
    stack = StringField 

class Product(Document):
    migrosId = IntField
    name = StringField
    description = StringField
    image = EmbeddedDocumentField(Image)
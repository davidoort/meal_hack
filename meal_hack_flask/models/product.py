from mongoengine import (
    Document, 
    DynamicDocument, 
    StringField, 
    FloatField, 
    DateField, 
    IntField, 
    EmbeddedDocument,
    EmbeddedDocumentField,
    ListField
)

import re

class Image(EmbeddedDocument):
    original = StringField()
    stack = StringField()

class Product(DynamicDocument):
    migros_id = IntField()
    name = StringField()
    description = StringField()
    image = EmbeddedDocumentField(Image)
    allergen_text = StringField()
    ingredient_id = IntField()

def productFromMigros(migrosSource, ingredient_id) -> Product:
    stripped_description = ""
    if "description" in migrosSource:
        stripped_description = re.sub('<[^<]+>', '', migrosSource["description"]["text"])

    return Product(
            migros_id = migrosSource["id"],
            name = migrosSource["name"],
            description = stripped_description,
            image = {
                'original': migrosSource["image"]["original"],
                'stack': migrosSource["image"]["stack"],
            },
            allergen_text = migrosSource.get("allergen_text", "No allergens"),
            ingredient_id = ingredient_id
    )

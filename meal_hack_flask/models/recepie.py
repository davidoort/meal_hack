from mongoengine import (
    DynamicDocument, 
    StringField, 
    FloatField, 
    DateField, 
    IntField, 
    DynamicEmbeddedDocument,
    EmbeddedDocumentField,
    ListField
)

from pprint import pprint 

class Nutrients(DynamicEmbeddedDocument):
    calories = IntField()
    carbohydrates = IntField()
    carbohydrates_percent = FloatField()
    fat = IntField()
    fat_percent = FloatField()
    kilojoule = IntField()
    proteins = IntField()
    proteins_percent = FloatField()

class Step(DynamicEmbeddedDocument):
    title = StringField()
    description = StringField()

class Ingredient(DynamicEmbeddedDocument):
    """
    To display, write quantity_text + text
    """
    product_id = IntField()
    quantity = IntField()
    quantity_text = StringField()
    text = StringField()
    display_text = StringField()

class Recepie(DynamicDocument):
    """
    """
    migros_id = IntField(unique=True)
    title = StringField()
    teaser_text = StringField()
    duration_total_in_minutes = FloatField()
    nutrients = EmbeddedDocumentField(Nutrients)
    steps = ListField(EmbeddedDocumentField(Step))
    ingredients = ListField(EmbeddedDocumentField(Ingredient))

def fromMigros(migrosSource) -> Recepie:
    stepsList = []
    for step in migrosSource["steps"]:
        stepsList.append(Step(
            title = step["title"],
            description = step["description"],
        ))

    ingredientsList = []
    recepieSize = migrosSource["sizes"][0]
    personQuantity = recepieSize["quantity"]
    for ingredientBlock in recepieSize["ingredient_blocks"]:
        for ingredient in ingredientBlock["ingredients"]:
            ingredientsList.append(Ingredient(
                product_id = ingredient["id"],
                quantity = ingredient["amount"]["quantity"] / personQuantity,
                quantity_text = ingredient["amount"]["text"],
                text = ingredient["text"],
                display_text = f'{ingredient["amount"]["text"]} {ingredient["text"]}'
            ))

    return Recepie(
            migros_id = migrosSource["id"],
            title = migrosSource["title"],
            teaser_text = migrosSource["teasertext"],
            duration_total_in_minutes = migrosSource["duration_total_in_minutes"],
            nutrients = Nutrients(**migrosSource["nutrients"]),
            steps = stepsList,
            ingredients = ingredientsList
    )

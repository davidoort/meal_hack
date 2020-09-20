from tools.db import init_db
from models.recipe import Recipe
from datetime import date, timedelta
from random import randint
from models.meal import Meal

def generate_meals(num_days:int):
    # increment by 1 day
    for i in range(0, num_days):
        meal_day = date.today() + timedelta(days = i)
        quantity = randint(1, 4)
        recipies = Recipe.objects
        random_recipe = recipies[randint(0, len(recipies))]
        print(random_recipe.title, random_recipe.eco_score)

        meal = Meal(
            date = meal_day,
            quantity = quantity,
            note = "randomly generated",
            recipe_id = random_recipe.migros_id,
            recipe_title = random_recipe.title,
            recipe_nutri_score=random_recipe.nutri_score,
            recipe_eco_score=random_recipe.eco_score,
        )

        meal.save()

if __name__ == "__main__":
    init_db()
    generate_meals(num_days = 5)
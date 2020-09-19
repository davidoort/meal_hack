from api.authentication import SignUpApi, LoginApi
from api.meals import MealsApi, MealApi
from api.users import UsersApi, UserApi
from api.recipes import RecipesApi, RecipeApi

def create_routes(api):
    # Authentication resources
    api.add_resource(SignUpApi, '/auth/signup')
    api.add_resource(LoginApi, '/auth/login')

    # Meal resources
    api.add_resource(MealsApi, '/meals/')
    api.add_resource(MealApi, '/meals/<meal_id>')

    # User resources
    api.add_resource(UsersApi, '/users/')
    api.add_resource(UserApi, '/users/<user_id>')

    # Recepie resources
    api.add_resource(RecipesApi, '/recipes/')
    api.add_resource(RecipeApi, '/recipes/<migros_id>')
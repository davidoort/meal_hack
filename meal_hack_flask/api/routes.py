from api.index import IndexApi
from api.authentication import SignUpApi, LoginApi
from api.meals import MealsApi, MealApi
from api.users import UsersApi, UserApi
from api.recipes import RecipesApi, RecipeApi
from api.products import ProductsApi, ProductApi
from api.grocery import GroceryCartApi

def create_routes(api):
    # Index
    api.add_resource(IndexApi, '/')

    # Authentication resources
    api.add_resource(SignUpApi, '/auth/signup')
    api.add_resource(LoginApi, '/auth/login')

    # Meal resources
    api.add_resource(MealsApi, '/meals/')
    api.add_resource(MealApi, '/meals/<meal_id>')

    # User resources
    api.add_resource(UsersApi, '/users/')
    api.add_resource(UserApi, '/users/<user_id>')

    # Recipe resources
    api.add_resource(RecipesApi, '/recipes/')
    api.add_resource(RecipeApi, '/recipes/<migros_id>')

    # Recipe resources
    api.add_resource(ProductsApi, '/products/')
    api.add_resource(ProductApi, '/products/<migros_id>')

    # Grocery cart resources
    api.add_resource(GroceryCartApi, '/grocery_cart/')
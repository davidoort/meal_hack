from api.meals import MealsApi

def create_routes(api):
    api.add_resource(MealsApi, '/meals/')
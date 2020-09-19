class Nutrients {
  int calories;
  int carbohydrates;
  double carbohydrates_percent;
  int fat;
  double fat_percent;
  int kilojoule;
  int proteins;
  double proteins_percent;
}

class Step {
  String title;
  String description;
}

class Ingredient {
  int migros_id;
  int quantity;
  String quantity_text;
  String text;
  String display_text;
}

class Recipe {
  int migros_id;
  String title;
  String teaser_text;
  double duration_total_in_minutes;
  Nutrients nutrients;
  List<Step> steps;
  List<Ingredient> ingredients;
}

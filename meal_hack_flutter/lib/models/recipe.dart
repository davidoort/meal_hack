class Nutrients {
  int calories;
  int carbohydrates;
  double carbohydrates_percent;
  int fat;
  double fat_percent;
  int kilojoule;
  int proteins;
  double proteins_percent;

  Nutrients({this.calories, this.carbohydrates, this.carbohydrates_percent, this.fat, this.fat_percent, this.kilojoule, this.proteins, this.proteins_percent});

  factory Nutrients.fromJson(Map<String, dynamic> json) {
    return Nutrients(
        calories: json["calories"],
        carbohydrates: json["carbohydrates"],
        carbohydrates_percent: json["carbohydrates_percent"],
        fat: json["fat"],
        fat_percent: json["fat_percent"],
        kilojoule: json["kilojoule"],
        proteins: json["proteins"],
        proteins_percent: json["proteins_percent"]);
  }
}

class Step {
  String title;
  String description;

  Step()
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

  Recipe({this.migros_id, this.title, this.teaser_text, this.duration_total_in_minutes, this.nutrients, this.steps, this.ingredients});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
        migros_id: json["migros_id"],
        teaser_text: json["teaser_text"],
        duration_total_in_minutes: json["duration_total_in_minutes"],
        nutrients: json["nutrients"],
        steps: json["steps"],
        ingredients: json["ingredients"],
        title: json["title"]);
  }
}

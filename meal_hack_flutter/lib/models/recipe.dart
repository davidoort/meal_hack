import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';

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

  Step({this.title, this.description});

  factory Step.fromJson(Map<String, dynamic> json) {
    return Step(
      title: json["title"],
      description: json["description"]
    );
  }
}

class Ingredient {
  int migros_id;
  int quantity;
  String quantity_text;
  String text;
  String display_text;

  Ingredient({this.migros_id, this.quantity, this.quantity_text, this.text, this.display_text});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(migros_id: json["migros_id"],
    quantity: json["quantity"],
    quantity_text: json["quantity_text"],
    text: json["text"],
    display_text: json["display_text"]);
  }
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

  static List<Step> parseSteps(String j) {
    Iterable list = json.decode(j);
    return List<Step>.from(list.map((e) => Step.fromJson(e)));
  }

  static List<Ingredient> parseIngredients(String j) {
    Iterable list = json.decode(j);
    return List<Ingredient>.from(list.map((e) => Ingredient.fromJson(e)));
  }

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
        migros_id: json["migros_id"],
        title: json["title"],
        teaser_text: json["teaser_text"],
        duration_total_in_minutes: json["duration_total_in_minutes"],
        nutrients: Nutrients.fromJson(json["nutrients"]),
        steps: parseSteps(json["steps"]),
        ingredients: parseIngredients(json["ingredients"]));        
  }
}

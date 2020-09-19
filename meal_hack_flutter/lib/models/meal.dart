class Meal {
  DateTime date;
  int quantity;
  String note;
  int recipeId;
  String recipeName;

  Meal({this.date, this.quantity, this.note, this.recipeId, this.recipeName});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
        date: DateTime.now(),
        quantity: json["quantity"],
        note: json["note"],
        recipeId: json["recipe_id"],
        recipeName: json["recipe_title"]);
  }
}

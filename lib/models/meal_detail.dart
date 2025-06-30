class MealDetail {
  final String idMeal;
  final String strMeal;
  final String strCategory;
  final String strInstructions;
  final String strMealThumb;

  MealDetail({
    required this.idMeal,
    required this.strMeal,
    required this.strCategory,
    required this.strInstructions,
    required this.strMealThumb,
  });

  factory MealDetail.fromJson(Map<String, dynamic> json) {
    return MealDetail(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strCategory: json['strCategory'],
      strInstructions: json['strInstructions'],
      strMealThumb: json['strMealThumb'],
    );
  }
}

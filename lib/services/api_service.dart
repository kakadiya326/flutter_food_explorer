import 'dart:convert';

import 'package:online_food_app/models/category.dart';
import 'package:http/http.dart' as http;
import 'package:online_food_app/models/meal.dart';
import 'package:online_food_app/models/meal_detail.dart';

class ApiService {
  static const String baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  static Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories.php'));
    final data = jsonDecode(response.body)['categories'];
    return data.map<Category>((json) => Category.fromJson(json)).toList();
  }

  static Future<List<Meal>> fetchMealByCategory(String category) async {
    final response =
        await http.get(Uri.parse('$baseUrl/filter.php?c=$category'));
    final data = jsonDecode(response.body)['meals'];
    return data.map<Meal>((json) => Meal.fromJson(json)).toList();
  }

  static Future<MealDetail> fetchMealDetail(String idMeal) async {
    final response = await http.get(Uri.parse('$baseUrl/lookup.php?i=$idMeal'));
    final data = jsonDecode(response.body)['meals'][0];
    return MealDetail.fromJson(data);
  }
}

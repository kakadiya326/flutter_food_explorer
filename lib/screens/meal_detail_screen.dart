import 'package:flutter/material.dart';
import 'package:online_food_app/models/meal_detail.dart';
import 'package:online_food_app/services/api_service.dart';

class MealDetailScreen extends StatelessWidget {
  final String mealId;
  MealDetailScreen({required this.mealId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meal Details")),
      body: FutureBuilder<MealDetail>(
        future: ApiService.fetchMealDetail(mealId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final meal = snapshot.data!;
            return SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(meal.strMealThumb),
                  SizedBox(height: 16),
                  Text(meal.strMeal, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("Category: ${meal.strCategory}", style: TextStyle(fontSize: 18)),
                  SizedBox(height: 16),
                  Text("Instructions:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  SizedBox(height: 8),
                  Text(meal.strInstructions, style: TextStyle(fontSize: 16)),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Error loading meal details"));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
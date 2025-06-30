import 'package:flutter/material.dart';
import 'package:online_food_app/models/meal.dart';
import 'package:online_food_app/screens/meal_detail_screen.dart';
import 'package:online_food_app/services/api_service.dart';

class MealsScreen extends StatefulWidget {
  final String category;
  const MealsScreen({required this.category});

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  late Future<List<Meal>> _meals;

  @override
  void initState() {
    super.initState();
    _meals = ApiService.fetchMealByCategory(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category)),
      body: FutureBuilder(
          future: _meals,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final meals = snapshot.data!;
              return ListView.builder(
                itemCount: meals.length,
                itemBuilder: (context, index) {
                  final meal = meals[index];
                  return ListTile(
                    leading: Image.network(
                      meal.strMealThumb,
                      width: 50,
                    ),
                    title: Text(meal.strMeal),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MealDetailScreen(mealId:meal.idMeal)));
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error loading meals'));
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

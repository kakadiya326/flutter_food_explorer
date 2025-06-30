import 'package:flutter/material.dart';
import 'package:online_food_app/models/category.dart';
import 'package:online_food_app/screens/meals_screen.dart';
import 'package:online_food_app/services/api_service.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late Future<List<Category>> _categories;

  @override
  void initState() {
    super.initState();
    _categories = ApiService.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Categories'),
      ),
      body: FutureBuilder<List<Category>>(
          future: _categories,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final categories = snapshot.data!;
              return ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return ListTile(
                      leading: CachedNetworkImage(
                        imageUrl: category.strCategoryThumbs,
                        width: 50,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            Image.asset('assets/images/default_food.png'),
                      ),
                      title: Text(category.strCategory),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MealsScreen(category: category.strCategory),
                            ));
                      },
                    );
                  });
            } else if (snapshot.hasError) {
              print("Error occurred: ${snapshot.error}");
              return Center(
                child: Text("Error loading categories"),
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

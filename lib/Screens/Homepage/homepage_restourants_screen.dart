import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:food_buddy/Screens/Homepage/restourant_card.dart';
import 'package:food_buddy/components/constants.dart';
import 'package:food_buddy/models/restourant.dart';
import 'package:food_buddy/models/restourant_api.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
    print(_recipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 240, 233, 233),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                color: kPrimaryColor,
              ))
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: _recipes[index].name,
                      cookTime: _recipes[index].totalTime,
                      rating: _recipes[index].rating.toString(),
                      thumbnailUrl: _recipes[index].images);
                },
              ));
  }
}

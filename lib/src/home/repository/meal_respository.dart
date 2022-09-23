import 'dart:convert';
import 'dart:developer';

import 'package:dmk_home/src/home/models/content/content.dart';
import 'package:dmk_home/src/home/models/meal/meal.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MealRepository {
  final contentBox = 'contentBox';
  final popularRecipesBox = 'popularRecipesBox';
  final suggestedMealBox = 'suggestedMealBox';

  Future<bool> hasContentData() async {
    final box = await Hive.openBox<List<dynamic>>(contentBox);
    return box.isNotEmpty;
  }

  Future<bool> hasPopularRecipesData() async {
    final box = await Hive.openBox<List<dynamic>>(popularRecipesBox);
    return box.isNotEmpty;
  }

  Future<bool> hasSuggestedMealData() async {
    final box = await Hive.openBox<List<dynamic>>(suggestedMealBox);
    return box.isNotEmpty;
  }

  Future<void> saveContentData() async {
    try {
      final response =
          await rootBundle.loadString('api/suggested_content_response.json');
      final data = json.decode(response) as List;
      final box = Hive.box<List<dynamic>>(contentBox);

      final contentList =
          data.map((e) => Content.fromJson(e as Map<String, dynamic>)).toList();

      await box.put(contentBox, contentList);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> savePopularRecipesData() async {
    try {
      final response =
          await rootBundle.loadString('api/popular_recipes_response.json');
      final data = json.decode(response) as List;
      final box = Hive.box<List<dynamic>>(popularRecipesBox);

      final recipesList =
          data.map((e) => Meal.fromJson(e as Map<String, dynamic>)).toList();

      await box.put(popularRecipesBox, recipesList);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> saveSuggestedMealData() async {
    try {
      final response =
          await rootBundle.loadString('api/suggested_meal_response.json');
      final data = json.decode(response) as List;
      final box = Hive.box<List<dynamic>>(suggestedMealBox);

      final mealList =
          data.map((e) => Meal.fromJson(e as Map<String, dynamic>)).toList();

      await box.put(suggestedMealBox, mealList);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Content>> getContentData() async {
    final box = Hive.box<List<dynamic>>(contentBox);
    final data = box
        .get(
          contentBox,
          defaultValue: <Content>[],
        )!
        .cast<Content>()
        .toList();
    return data;
  }

  Future<List<Meal>> getPopularRecipesData() async {
    final box = Hive.box<List<dynamic>>(popularRecipesBox);
    final data = box
        .get(
          contentBox,
          defaultValue: <Meal>[],
        )!
        .cast<Meal>()
        .toList();
    return data;
  }

  Future<List<Meal>> getSuggestedMealData() async {
    final box = Hive.box<List<dynamic>>(suggestedMealBox);
    final data = box
        .get(
          contentBox,
          defaultValue: <Meal>[],
        )!
        .cast<Meal>()
        .toList();
    return data;
  }
}

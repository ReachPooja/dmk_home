import 'package:dmk_home/app/app.dart';
import 'package:dmk_home/bootstrap.dart';
import 'package:dmk_home/src/home/models/content/content.dart';
import 'package:dmk_home/src/home/models/ingredient/ingredient.dart';
import 'package:dmk_home/src/home/models/meal/meal.dart';
import 'package:dmk_home/src/home/models/meal_type/meal_type.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();

  Hive
    ..registerAdapter(MealAdapter())
    ..registerAdapter(IngredientAdapter())
    ..registerAdapter(MealTypeAdapter())
    ..registerAdapter(ContentAdapter());

  await bootstrap(() => const MyApp());
}

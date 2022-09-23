import 'package:dmk_home/l10n/l10n.dart';
import 'package:dmk_home/src/home/bloc/meal_bloc.dart';
import 'package:dmk_home/src/home/repository/meal_respository.dart';
import 'package:dmk_home/src/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => MealBloc(MealRepository())
        ..add(HasContentData())
        ..add(HasPopularRecipesData())
        ..add(HasSuggestedMealData()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Montserrat',
          primarySwatch: Colors.lightGreen,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: const HomeView(),
      ),
    );
  }
}

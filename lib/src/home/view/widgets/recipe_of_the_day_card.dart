import 'package:dmk_home/l10n/l10n.dart';
import 'package:dmk_home/src/home/bloc/meal_bloc.dart';
import 'package:dmk_home/src/home/models/meal/meal.dart';
import 'package:dmk_home/src/home/view/widgets/custom_icon.dart';
import 'package:dmk_home/src/home/view/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeOfTheDayCard extends StatelessWidget {
  const RecipeOfTheDayCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<MealBloc, MealState>(
      buildWhen: (previous, current) =>
          previous.popularRecipeStatus != current.popularRecipeStatus,
      builder: (context, state) {
        if (state.popularRecipeStatus == Status.success) {
          final list = state.popularRecipeList
              .where((element) => element.isROTD == 1)
              .toList();
          final recipeOfTheDay = list.isEmpty ? Meal.empty : list.first;
          return SizedBox(
            height: screenWidth / 1.8,
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (recipeOfTheDay.imageUrl.isNotEmpty)
                  Image.asset(
                    recipeOfTheDay.imageUrl,
                    fit: BoxFit.cover,
                  ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.white60,
                        Colors.white12,
                        Colors.transparent,
                        Colors.black12,
                        Colors.black38,
                        Colors.black54,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 4, 8, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TitleText(
                        title: l10n.headerTitle,
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              recipeOfTheDay.name,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 18,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(
                                5,
                                (index) => Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: CustomIcon(
                                    imageUrl: 'star.png',
                                    iconSize: 12,
                                    iconColor: (index + 1 >
                                            double.parse(
                                              recipeOfTheDay.rating,
                                            ))
                                        ? Colors.white
                                        : Colors.amber,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

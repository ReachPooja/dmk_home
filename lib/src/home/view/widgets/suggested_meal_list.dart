import 'package:dmk_home/src/home/bloc/meal_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuggestedMealList extends StatelessWidget {
  const SuggestedMealList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenWidth / 1.8,
      child: BlocBuilder<MealBloc, MealState>(
        buildWhen: (previous, current) =>
            previous.suggestedMealStatus != current.suggestedMealStatus,
        builder: (context, state) {
          if (state.suggestedMealStatus == Status.success) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.suggestedMealList.length,
              itemBuilder: (context, index) {
                final meal = state.suggestedMealList[index];
                return Padding(
                  padding: EdgeInsets.only(
                    left: 12,
                    right:
                        index == (state.suggestedMealList.length - 1) ? 12 : 0,
                  ),
                  child: Column(
                    children: [
                      Text(
                        meal.day,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Flexible(
                        child: Image.asset(
                          meal.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        meal.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

import 'package:dmk_home/src/home/bloc/meal_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularRecipesList extends StatelessWidget {
  const PopularRecipesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenWidth / 2.4,
      child: BlocBuilder<MealBloc, MealState>(
        buildWhen: (previous, current) =>
            previous.popularRecipeStatus != current.popularRecipeStatus,
        builder: (context, state) {
          if (state.popularRecipeStatus == Status.success) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.popularRecipeList.length,
              itemBuilder: (context, index) => Center(
                child: SizedBox(
                  width: screenWidth / 2.8,
                  height: screenWidth / 2.8,
                  child: Card(
                    margin: EdgeInsets.only(
                      left: 12,
                      right: index == (state.popularRecipeList.length - 1)
                          ? 12
                          : 0,
                    ),
                    elevation: 8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                state.popularRecipeList[index].imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, bottom: 8),
                          child: Text(
                            state.popularRecipeList[index].name,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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

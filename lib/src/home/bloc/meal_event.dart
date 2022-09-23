part of 'meal_bloc.dart';

abstract class MealEvent extends Equatable {
  const MealEvent();

  @override
  List<Object> get props => [];
}

class HasContentData extends MealEvent {}

class HasPopularRecipesData extends MealEvent {}

class HasSuggestedMealData extends MealEvent {}

class ContentDataRequested extends MealEvent {}

class PopularRecipeDataRequested extends MealEvent {}

class SuggestedMealDataRequested extends MealEvent {}

class ContentDataSaved extends MealEvent {}

class PopularRecipeDataSaved extends MealEvent {}

class SuggestedMealDataSaved extends MealEvent {}

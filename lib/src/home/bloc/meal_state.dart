part of 'meal_bloc.dart';

enum Status { initial, loading, success }

class MealState extends Equatable {
  const MealState({
    this.contentStatus = Status.initial,
    this.popularRecipeStatus = Status.initial,
    this.suggestedMealStatus = Status.initial,
    this.contentList = const [],
    this.popularRecipeList = const [],
    this.suggestedMealList = const [],
  });

  final Status contentStatus;
  final Status popularRecipeStatus;
  final Status suggestedMealStatus;

  final List<Content> contentList;
  final List<Meal> popularRecipeList;
  final List<Meal> suggestedMealList;

  @override
  List<Object> get props {
    return [
      contentStatus,
      popularRecipeStatus,
      suggestedMealStatus,
      contentList,
      popularRecipeList,
      suggestedMealList,
    ];
  }

  MealState copyWith({
    Status? contentStatus,
    Status? popularRecipeStatus,
    Status? suggestedMealStatus,
    List<Content>? contentList,
    List<Meal>? popularRecipeList,
    List<Meal>? suggestedMealList,
  }) {
    return MealState(
      contentStatus: contentStatus ?? this.contentStatus,
      popularRecipeStatus: popularRecipeStatus ?? this.popularRecipeStatus,
      suggestedMealStatus: suggestedMealStatus ?? this.suggestedMealStatus,
      contentList: contentList ?? this.contentList,
      popularRecipeList: popularRecipeList ?? this.popularRecipeList,
      suggestedMealList: suggestedMealList ?? this.suggestedMealList,
    );
  }
}

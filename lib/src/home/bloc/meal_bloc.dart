import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dmk_home/src/home/models/content/content.dart';
import 'package:dmk_home/src/home/models/meal/meal.dart';
import 'package:dmk_home/src/home/repository/meal_respository.dart';
import 'package:equatable/equatable.dart';

part 'meal_event.dart';
part 'meal_state.dart';

class MealBloc extends Bloc<MealEvent, MealState> {
  MealBloc(this._mealRepository) : super(const MealState()) {
    on<HasContentData>(_onHasContentData);
    on<HasPopularRecipesData>(_onHasPopularMealData);
    on<HasSuggestedMealData>(_onHasSuggestedMealData);
    on<ContentDataSaved>(_onContentDataSaved);
    on<PopularRecipeDataSaved>(_onPopularMealDataSaved);
    on<SuggestedMealDataSaved>(_onSuggestedMealDataSaved);
    on<ContentDataRequested>(_onContentDataRequested);
    on<PopularRecipeDataRequested>(_onPopularMealDataRequested);
    on<SuggestedMealDataRequested>(_onSuggestedMealDataRequested);
  }
  final MealRepository _mealRepository;

  Future<void> _onHasContentData(
    HasContentData event,
    Emitter<MealState> emit,
  ) async {
    emit(
      state.copyWith(
        contentStatus: Status.loading,
      ),
    );

    final hasData = await _mealRepository.hasContentData();

    if (hasData) {
      add(ContentDataRequested());
    } else {
      add(ContentDataSaved());
    }
  }

  Future<void> _onHasPopularMealData(
    HasPopularRecipesData event,
    Emitter<MealState> emit,
  ) async {
    emit(
      state.copyWith(
        popularRecipeStatus: Status.loading,
      ),
    );

    final hasData = await _mealRepository.hasPopularRecipesData();
    if (hasData) {
      add(PopularRecipeDataRequested());
    } else {
      add(PopularRecipeDataSaved());
    }
  }

  Future<void> _onHasSuggestedMealData(
    HasSuggestedMealData event,
    Emitter<MealState> emit,
  ) async {
    emit(
      state.copyWith(
        suggestedMealStatus: Status.loading,
      ),
    );

    final hasData = await _mealRepository.hasSuggestedMealData();

    if (hasData) {
      add(SuggestedMealDataRequested());
    } else {
      add(SuggestedMealDataSaved());
    }
  }

  Future<void> _onContentDataSaved(
    ContentDataSaved event,
    Emitter<MealState> emit,
  ) async {
    await _mealRepository.saveContentData();

    add(ContentDataRequested());
  }

  Future<void> _onPopularMealDataSaved(
    PopularRecipeDataSaved event,
    Emitter<MealState> emit,
  ) async {
    await _mealRepository.savePopularRecipesData();
    add(PopularRecipeDataRequested());
  }

  Future<void> _onSuggestedMealDataSaved(
    SuggestedMealDataSaved event,
    Emitter<MealState> emit,
  ) async {
    await _mealRepository.saveSuggestedMealData();
    add(SuggestedMealDataRequested());
  }

  Future<void> _onContentDataRequested(
    ContentDataRequested event,
    Emitter<MealState> emit,
  ) async {
    final data = await _mealRepository.getContentData();
    emit(
      state.copyWith(
        contentList: data,
        contentStatus: Status.success,
      ),
    );
  }

  Future<void> _onPopularMealDataRequested(
    PopularRecipeDataRequested event,
    Emitter<MealState> emit,
  ) async {
    final data = await _mealRepository.getPopularRecipesData();
    emit(
      state.copyWith(
        popularRecipeList: data,
        popularRecipeStatus: Status.success,
      ),
    );
  }

  Future<void> _onSuggestedMealDataRequested(
    SuggestedMealDataRequested event,
    Emitter<MealState> emit,
  ) async {
    final data = await _mealRepository.getSuggestedMealData();
    emit(
      state.copyWith(
        suggestedMealList: data,
        suggestedMealStatus: Status.success,
      ),
    );
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prog4_meals/data.dart';
import 'package:prog4_meals/meals.dart';

//this is good for data which doesnt change => static data
final mealsProvider = Provider((ref) {
  return dummyMeals;
});

class FavoriteMealNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealNotifier, List<Meal>>((ref) {
  return FavoriteMealNotifier();
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

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
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});


// class FavMealNotifier extends StateNotifier<List<Meal>> {
//   FavMealNotifier() : super([]);

//   bool toggleMealFavStatue(Meal meal) {
//     final isFave = state.contains(meal);

//     if (isFave) {
//       state.where((m) => m.id != meal.id).toList();
//       return false;
//     } else {
//       state = [...state, meal];
//       return true;
//     }
//   }
// }

// final favMealsProvdier =
//     StateNotifierProvider<FavMealNotifier, List<Meal>>((ref) {
//   return FavMealNotifier();
// });

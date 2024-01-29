import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prog4_meals/meals.dart';
import 'package:prog4_meals/meals_provider.dart';

class MealDetails extends ConsumerWidget {
  const MealDetails({
    super.key,
    required this.meals,
    // required this.onToggleFavorite,
  });

  final Meal meals;
  // final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);

    final isFavorite = favoriteMeals.contains(meals);
    return Scaffold(
      appBar: AppBar(
        title: Text(meals.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .watch(favoriteMealsProvider.notifier)
                  .toggleMealFavoriteStatus(meals);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(wasAdded
                      ? 'Meal added as Favorite'
                      : 'Meal removed from Favorite'),
                ),
              );
              // onToggleFavorite(meals);
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween<double>(begin: 0.60, end: 1).animate(animation),
                  child: child,
                );
              },
              child: Icon(isFavorite ? Icons.star : Icons.star_border,
                  key: ValueKey(isFavorite)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meals.id,
              child: Image.network(
                meals.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 14),
            for (final i in meals.ingredients)
              Text(
                i,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            for (final i in meals.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Text(
                  i,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

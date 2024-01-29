import 'package:flutter/material.dart';
import 'package:prog4_meals/data.dart';
import 'package:prog4_meals/meals.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });

  final String id;
  final String title;
  final Color color;
}

// Displaying Items in Grid
class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key, required this.category, required this.onSelectCategory});

  final Category category;
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelectCategory();
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ),
      ),
    );
  }
}

//main Category

class CateogoriesScreen extends StatefulWidget {
  const CateogoriesScreen(
      {super.key,
      // required this.onToggleFavorite,
      required this.availableMeals});
  // final void Function(Meal meal) onToggleFavorite;
  //Redirect particular item to their specific page
  final List<Meal> availableMeals;

  @override
  State<CateogoriesScreen> createState() => _CateogoriesScreenState();
}

class _CateogoriesScreenState extends State<CateogoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredList = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    //navigator push
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredList,
          // onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: [
            for (final i in categoriesList)
              CategoryGridItem(
                category: i,
                onSelectCategory: () {
                  _selectCategory(context, i);
                },
              )
          ],
          // itemBuilder: itemBuilder,
        ),
      ),
      builder: (context, child) => SlideTransition(
        position: _animationController.drive(
          Tween(
            begin: const Offset(0.4, 1),
            end: const Offset(0, 0),
          ),
        ),
        child: child,
      ),
    );
  }
}

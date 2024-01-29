import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prog4_meals/meals_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  Widget textTitleLarge(context, text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
    );
  }

  Widget textLabelMedium(context, text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (ischecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.glutenFree, ischecked);
            },
            title: textTitleLarge(context, "Gluten-free"),
            subtitle:
                textLabelMedium(context, "Only include gluten-free meals."),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (ischecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.lactoseFree, ischecked);
            },
            title: textTitleLarge(context, "Lactose-free"),
            subtitle:
                textLabelMedium(context, "Only include lactose-free meals."),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (ischecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegetarian, ischecked);
            },
            title: textTitleLarge(context, "Vegetarian"),
            subtitle:
                textLabelMedium(context, "Only include vegetarian-free meals."),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan]!,
            onChanged: (ischecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegan, ischecked);
            },
            title: textTitleLarge(context, "Vegan"),
            subtitle:
                textLabelMedium(context, "Only include vegan-free meals."),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}

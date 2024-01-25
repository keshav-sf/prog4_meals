import 'package:flutter/material.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilters});
  final Map<Filter, bool> currentFilters;
  @override
  State<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

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

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFreeFilterSet = false;
  var _veganFreeFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFreeFilterSet = widget.currentFilters[Filter.vegetarian]!;
    _veganFreeFilterSet = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
        ),
        // drawer: MainDrawer(
        //   onSelectScreen: (identifier) {
        //     if (identifier == 'meals') {
        //       Navigator.pop(context);
        //       Navigator.of(context)
        //           .push(MaterialPageRoute(builder: (ctx) => const TabScreen()));
        //     } else {
        //       Navigator.pop(context);
        //     }
        //   },
        // ),
        body: PopScope(
          canPop: false,
          onPopInvoked: (bool didPop) {
            if (didPop) return;
            Navigator.of(context).pop({
              Filter.glutenFree: _glutenFreeFilterSet,
              Filter.lactoseFree: _lactoseFreeFilterSet,
              Filter.vegetarian: _vegetarianFreeFilterSet,
              Filter.vegan: _veganFreeFilterSet,
            });
          },
          child: Column(
            children: [
              SwitchListTile(
                value: _glutenFreeFilterSet,
                onChanged: (ischecked) {
                  setState(() {
                    _glutenFreeFilterSet = ischecked;
                  });
                },
                title: textTitleLarge(context, "Gluten-free"),
                subtitle:
                    textLabelMedium(context, "Only include gluten-free meals."),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: _lactoseFreeFilterSet,
                onChanged: (ischecked) {
                  setState(() {
                    _lactoseFreeFilterSet = ischecked;
                  });
                },
                title: textTitleLarge(context, "Lactose-free"),
                subtitle: textLabelMedium(
                    context, "Only include lactose-free meals."),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: _vegetarianFreeFilterSet,
                onChanged: (ischecked) {
                  setState(() {
                    _vegetarianFreeFilterSet = ischecked;
                  });
                },
                title: textTitleLarge(context, "Vegetarian"),
                subtitle: textLabelMedium(
                    context, "Only include vegetarian-free meals."),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: _veganFreeFilterSet,
                onChanged: (ischecked) {
                  setState(() {
                    _veganFreeFilterSet = ischecked;
                  });
                },
                title: textTitleLarge(context, "Vegan"),
                subtitle:
                    textLabelMedium(context, "Only include vegan-free meals."),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
            ],
          ),
        ));
  }
}

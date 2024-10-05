import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/providers/filters_provider.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({
    super.key,
    /*required this.currentFilter*/
  });
  // final Map<Filter,bool> currentFilter ;

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

// enum Filter{
//   glutenFree,
//   lactoseFree,
//   vegetarian,
//   vegan,
// }

class _FilterScreenState extends ConsumerState<FilterScreen> {
  // bool _glutenFreeFilterSet = false;
  // bool _lactoseFreeFilterSet = false;
  // bool _vegetarianFilterSet = false;
  // bool _veganFilterSet = false;

  // @override
  // void initState() {
  //   _glutenFreeFilterSet = widget.currentFilter[Filter.glutenFree]!;
  //   _lactoseFreeFilterSet = widget.currentFilter[Filter.lactoseFree]!;
  //   _vegetarianFilterSet = widget.currentFilter[Filter.vegetarian]!;
  //   _veganFilterSet = widget.currentFilter[Filter.vegan]!;

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filter Screen",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ),
      body:
          // PopScope(
          //   canPop: true,
          //   onPopInvoked: (didPop) {
          //     if (didPop) return;
          //     // Navigator.of(context).pop({
          //     //   Filter.glutenFree: _glutenFreeFilterSet,
          //     //   Filter.lactoseFree: _lactoseFreeFilterSet,
          //     //   Filter.vegetarian: _vegetarianFilterSet,
          //     //   Filter.vegan: _veganFilterSet,
          //     // });
          //   },
          
          /* ******* Passing the selected value of SwitchListTile to the previous screen when user press Back Button ****** */
          Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              setState(() {
                ref
                    .read(filtersProvider.notifier)
                    .setFilters(Filter.glutenFree, isChecked);
              });
            },
            title: Text(
              "Gluten-free",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              "Only include gluten-free food",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              setState(() {
                ref
                    .read(filtersProvider.notifier)
                    .setFilters(Filter.lactoseFree, isChecked);
              });
            },
            title: Text(
              "Lactose-free",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              "Only include lactose-free food",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              setState(() {
                ref
                    .read(filtersProvider.notifier)
                    .setFilters(Filter.vegetarian, isChecked);
              });
            },
            title: Text(
              "Vegetarian Food",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              "Only include vegetarian food",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan]!,
            onChanged: (isChecked) {
              setState(() {
                ref
                    .read(filtersProvider.notifier)
                    .setFilters(Filter.vegan, isChecked);
              });
            },
            title: Text(
              "Vegan",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              "Only include vegan food",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          const SizedBox(
            height: 16,
          ),
          OutlinedButton.icon(
              onPressed: () {
                setState(() {
                  // _glutenFreeFilterSet = false;
                  // _lactoseFreeFilterSet = false;
                  // _vegetarianFilterSet = false;
                  // _veganFilterSet = false;

                  ref
                      .read(filtersProvider.notifier)
                      .setFilters(Filter.glutenFree, false);
                  ref
                      .read(filtersProvider.notifier)
                      .setFilters(Filter.lactoseFree, false);
                  ref
                      .read(filtersProvider.notifier)
                      .setFilters(Filter.vegetarian, false);
                  ref
                      .read(filtersProvider.notifier)
                      .setFilters(Filter.vegan, false);
                });
              },
              icon: const Icon(Icons.clear_all),
              label: const Text("Clear Filters"))
        ],
      ),
      // ),
    );
  }
}

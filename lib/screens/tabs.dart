import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/providers/favourites_provider.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filter.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/drawer_main.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenConsumerState();
}

Map<Filter, bool> kInitialFilterSet = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class _TabsScreenConsumerState extends ConsumerState<TabsScreen> {
  int currentPageIndex = 0;
  // final List<Meal> _favouriteMeal = [];
  // Map<Filter, bool> _selectedFilters = kInitialFilterSet;

  _selectPage(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

/* ******* This function pop up a snack-bar to show the message STARTS HERE ******* */
  // void _showInfoMessage(String message, Color? color) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //       backgroundColor: color,
  //     ),
  //   );
  // }
/* ******* This function pop up a snack-bar to show the message ENDS HERE ******* */

/* ****** Function for adding and removing Favourites meal STARTS HERE */
  // void _toggleMealFavoriteStatus(Meal meal) {
  //   final isExisting = _favouriteMeal.contains(meal);

  //   if (isExisting) {
  //     setState(() {
  //       _favouriteMeal.remove(meal);
  //       _showInfoMessage("Removed from favourite ", Colors.red);
  //     });
  //   } else {
  //     setState(() {
  //       _favouriteMeal.add(meal);
  //       _showInfoMessage("Marked as Favourite", Colors.green);
  //     });
  //   }
  // }
/* ****** Function for adding and removing Favourites meal ENDS HERE */

/* ****** Function is passing to Drawer for Navigating to Filters Screen STARTS HERE ******* */
  void _setScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'filters') {
      // final result =
       await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
            builder: (ctx) =>
                const FilterScreen(/*currentFilter: _selectedFilters*/)),
      );
      // setState(() {
      //   _selectedFilters = result ?? kInitialFilterSet;
      // });
    }
  }     
/* ****** Function is passing to Drawer for Navigating to Filters Screen ENDS HERE ******* */

  @override
  Widget build(BuildContext context) {
    final favouriteMeal = ref.watch(favouriteMealsProvider);
    final availableMeals = ref.watch(availableMealProvider);

   
    Widget activeScreen = Categories(
      // onToggleFavourite: _toggleMealFavoriteStatus,
      availableMeals: availableMeals,
    );
    var activePageTitle = "Categories";

    if (currentPageIndex == 1) {
      setState(() {
        activePageTitle = "My Favourites";
        activeScreen = MealsScreen(
          meals: favouriteMeal,
          // onToggleFavourite: favouriteMeal,
        );
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: _selectPage,
        selectedIconTheme: Theme.of(context).iconTheme.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favourites",
          ),
        ],
      ),
    );
  }
}

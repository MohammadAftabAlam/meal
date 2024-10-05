import 'package:flutter/material.dart';

class FiltersItem extends StatefulWidget {
  const FiltersItem({super.key, required this.onChanged, required this.value});

  final bool value;
  final Function(bool isChecked) onChanged;

  @override
  State<FiltersItem> createState() => _FiltersItemState();
}

class _FiltersItemState extends State<FiltersItem> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: widget.value,
      onChanged: widget.onChanged,
      
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
    );
  }
}

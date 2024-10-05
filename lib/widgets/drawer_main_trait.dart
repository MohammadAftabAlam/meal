import 'package:flutter/material.dart';

class MainDrawerTraitListTile extends StatelessWidget {
  const MainDrawerTraitListTile(
      {super.key,
      required this.label,
      required this.iconData,
      required this.onTap});

  final IconData iconData;
  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Theme.of(context).colorScheme.onBackground,
        size: 26,
      ),
      title: Text(
        label,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 24,
            ),
      ),
      onTap: onTap,
    );
  }
}

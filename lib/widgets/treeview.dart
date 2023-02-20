import 'package:flutter/material.dart';

class TreeView extends StatelessWidget {
  final Map<String, List<String>> items;

  const TreeView({required this.items, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Material(
        child: ListView(
          children: items.keys.map((parentTitle) {
            final children = items[parentTitle] ?? [];
            if (children.isEmpty) {
              return ListTile(
                title: Text(parentTitle),
              );
            }
            return ExpansionTile(
              title: Text(parentTitle),
              children: children.map((childTitle) {
                return ListTile(
                  title: Text(childTitle),
                );
              }).toList(),
            );
          }).toList(),
        ),
      ),
    );
  }
}

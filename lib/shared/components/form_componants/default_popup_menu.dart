import 'package:flutter/material.dart';

class DefaultPopupMenu extends StatelessWidget {
  const DefaultPopupMenu({
    Key? key,
    required this.items,
    required this.values,
    required this.onSelected,
    this.iconColor,
    this.icons,
  }) : super(key: key);

  final List<String> items;
  final List<IconData>? icons;
  final List<String> values;
  final Function(Object? value) onSelected;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(
        Icons.more_vert_outlined,
        color: iconColor,
      ),
      onSelected: onSelected,
      itemBuilder: (context) {
        return List.generate(items.length, (index) {
          return PopupMenuItem(
            child: ListTile(
              title: Text(items[index]),
              leading: icons != null ? Icon(icons![index]) : null,
            ),
            value: values[index],
          );
        });
      },
    );
  }
}

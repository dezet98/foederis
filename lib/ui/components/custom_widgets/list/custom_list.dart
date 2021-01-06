import 'package:flutter/widgets.dart';

class CustomList<ItemType> extends StatelessWidget {
  final List<ItemType> items;
  final Widget Function(ItemType) buildTile;

  CustomList({@required this.items, @required this.buildTile});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return buildTile(items[index]);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:one_gate_system/models/basic_tile.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: basicTiles.map(buildTile).toList(),
    );
  }

  Widget buildTile(BasicTile tile) {
    return ExpansionTile(
      title: Text(tile.title),
      children: tile.tiles.map((tile) => buildTile(tile)).toList(),
    );
  }
}

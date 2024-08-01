import 'package:flutter/material.dart';

class InventoryPage extends StatelessWidget {
  final String id;
  const InventoryPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
    );
  }
}

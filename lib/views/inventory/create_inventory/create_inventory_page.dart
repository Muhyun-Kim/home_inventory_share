import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateInventoryPage extends ConsumerStatefulWidget {
  const CreateInventoryPage({super.key});

  @override
  ConsumerState<CreateInventoryPage> createState() =>
      _CreateInventoryPageState();
}

class _CreateInventoryPageState extends ConsumerState<CreateInventoryPage> {
  final _formKey = GlobalKey<FormState>();
  final _inventoryController = TextEditingController();
  final _quantityController = TextEditingController();
  IconData? _selectIcon;

  @override
  void dispose() {
    _inventoryController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('create inventory'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.00),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _inventoryController,
                decoration: InputDecoration(
                  labelText: 'inventory',
                ),
              ),
              TextFormField(
                controller: _quantityController,
                decoration: InputDecoration(
                  labelText: 'quantity',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

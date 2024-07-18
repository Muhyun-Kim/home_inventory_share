import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:home_inventory_share/controllers/inventory_controller.dart';

class CreateInventoryPage extends ConsumerStatefulWidget {
  const CreateInventoryPage({super.key});

  @override
  ConsumerState<CreateInventoryPage> createState() =>
      _CreateInventoryPageState();
}

class _CreateInventoryPageState extends ConsumerState<CreateInventoryPage> {
  final _formKey = GlobalKey<FormState>();
  final _inventoryNameController = TextEditingController();
  final _inventoryQuantityController = TextEditingController();
  IconData? _selectIcon;

  @override
  void dispose() {
    _inventoryNameController.dispose();
    _inventoryQuantityController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    final inventoryController = ref.read(inventoryControllerProvider);
    try {
      await inventoryController.createInventory(
        inventoryName: _inventoryNameController.text,
        inventoryQuantity: int.parse(_inventoryQuantityController.text),
      );
      context.go('/');
    } catch (e) {
      print(e);
    }
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
                controller: _inventoryNameController,
                decoration: InputDecoration(
                  labelText: '品名',
                ),
              ),
              TextFormField(
                controller: _inventoryQuantityController,
                decoration: InputDecoration(
                  labelText: '個',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              const SizedBox(
                height: 16.00,
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text("作成"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_inventory_share/providers/inventory_provider.dart';

class InventoryController {
  final Ref _ref;

  InventoryController(this._ref);

  Future<void> createInventory(
      String inventoryName, int inventoryQuantity) async {
    await _ref
        .read(inventoryProvider.notifier)
        .createInventory(inventoryName, inventoryQuantity);
  }

  Future<void> updateInventory(
      String docId, String inventoryName, int inventoryQuantity) async {
    await _ref
        .read(inventoryProvider.notifier)
        .updateInventory(docId, inventoryName, inventoryQuantity);
  }

  Future<void> deleteInventory(String docId) async {
    await _ref.read(inventoryProvider.notifier).deleteInventory(docId);
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_inventory_share/providers/inventory_provider.dart';

class InventoryController {
  final Ref _ref;

  InventoryController(this._ref);

  Future<void> createInventory(
      {required inventoryName, required int inventoryQuantity}) async {
    await _ref
        .read(inventoryProvider.notifier)
        .createInventory(inventoryName, inventoryQuantity);
  }

  Future<void> updateInventory(
      {required String docId,
      required String inventoryName,
      required int inventoryQuantity}) async {
    await _ref
        .read(inventoryProvider.notifier)
        .updateInventory(docId, inventoryName, inventoryQuantity);
  }

  Future<void> deleteInventory({required String docId}) async {
    await _ref.read(inventoryProvider.notifier).deleteInventory(docId);
  }
}

final inventoryControllerProvider = Provider((ref) {
  return InventoryController(ref);
});

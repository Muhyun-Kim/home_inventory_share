import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_inventory_share/models/inventory_model.dart';
import 'package:home_inventory_share/providers/firebase_provider.dart';

final inventoryProvider =
    StateNotifierProvider<InventoryNotifier, List<InventoryModel>>((ref) {
  return InventoryNotifier(ref);
});

class InventoryNotifier extends StateNotifier<List<InventoryModel>> {
  final Ref _ref;

  InventoryNotifier(this._ref) : super([]) {
    _readInventory();
  }

  Future<void> createInventory(
      String inventoryName, int inventoryQuantity) async {
    final user = _ref.read(firebaseAuthProvider).currentUser!;
    InventoryModel newInventory = InventoryModel(
        uid: user.uid,
        inventoryName: inventoryName,
        inventoryQuantity: inventoryQuantity);
    await _ref
        .read(firestoreProvider)
        .collection('inventory')
        .doc()
        .set(newInventory.toJson());
    state = [...state, newInventory];
  }

  Future<void> _readInventory() async {
    final user = _ref.read(firebaseAuthProvider).currentUser!;
    QuerySnapshot querySnapshot = await _ref
        .read(firestoreProvider)
        .collection('inventory')
        .where('uid', isEqualTo: user.uid)
        .get();

    List<InventoryModel> inventoryList = querySnapshot.docs.map((doc) {
      return InventoryModel.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();

    state = inventoryList;
  }

  Future<void> updateInventory(
      String docId, String inventoryName, int inventoryQuantity) async {
    await _ref
        .read(firestoreProvider)
        .collection('inventory')
        .doc(docId)
        .update({
      'inventoryName': inventoryName,
      'inventoryQuantity': inventoryQuantity,
    });

    state = state.map((inventory) {
      if (inventory.uid == docId) {
        return inventory.copyWith(
          inventoryName: inventoryName,
          inventoryQuantity: inventoryQuantity,
        );
      }
      return inventory;
    }).toList();
  }

  Future<void> deleteInventory(String docId) async {
    await _ref
        .read(firestoreProvider)
        .collection('inventory')
        .doc(docId)
        .delete();
    state = state.where((inventory) => inventory.uid != docId).toList();
  }
}

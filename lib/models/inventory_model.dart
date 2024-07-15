import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_model.freezed.dart';
part 'inventory_model.g.dart';

@freezed
class InventoryModel with _$InventoryModel {
  const factory InventoryModel({
    required String uid,
    required String inventoryName,
    required int inventoryQuantity,
  }) = _InventoryModel;

  factory InventoryModel.fromJson(Map<String, dynamic> json) =>
      _$InventoryModelFromJson(json);
}

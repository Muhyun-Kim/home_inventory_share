// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InventoryModelImpl _$$InventoryModelImplFromJson(Map<String, dynamic> json) =>
    _$InventoryModelImpl(
      uid: json['uid'] as String,
      inventoryName: json['inventoryName'] as String,
      inventoryQuantity: (json['inventoryQuantity'] as num).toInt(),
    );

Map<String, dynamic> _$$InventoryModelImplToJson(
        _$InventoryModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'inventoryName': instance.inventoryName,
      'inventoryQuantity': instance.inventoryQuantity,
    };

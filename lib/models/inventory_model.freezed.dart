// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InventoryModel _$InventoryModelFromJson(Map<String, dynamic> json) {
  return _InventoryModel.fromJson(json);
}

/// @nodoc
mixin _$InventoryModel {
  String get uid => throw _privateConstructorUsedError;
  String get inventoryName => throw _privateConstructorUsedError;
  int get inventoryQuantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryModelCopyWith<InventoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryModelCopyWith<$Res> {
  factory $InventoryModelCopyWith(
          InventoryModel value, $Res Function(InventoryModel) then) =
      _$InventoryModelCopyWithImpl<$Res, InventoryModel>;
  @useResult
  $Res call({String uid, String inventoryName, int inventoryQuantity});
}

/// @nodoc
class _$InventoryModelCopyWithImpl<$Res, $Val extends InventoryModel>
    implements $InventoryModelCopyWith<$Res> {
  _$InventoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? inventoryName = null,
    Object? inventoryQuantity = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      inventoryName: null == inventoryName
          ? _value.inventoryName
          : inventoryName // ignore: cast_nullable_to_non_nullable
              as String,
      inventoryQuantity: null == inventoryQuantity
          ? _value.inventoryQuantity
          : inventoryQuantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryModelImplCopyWith<$Res>
    implements $InventoryModelCopyWith<$Res> {
  factory _$$InventoryModelImplCopyWith(_$InventoryModelImpl value,
          $Res Function(_$InventoryModelImpl) then) =
      __$$InventoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, String inventoryName, int inventoryQuantity});
}

/// @nodoc
class __$$InventoryModelImplCopyWithImpl<$Res>
    extends _$InventoryModelCopyWithImpl<$Res, _$InventoryModelImpl>
    implements _$$InventoryModelImplCopyWith<$Res> {
  __$$InventoryModelImplCopyWithImpl(
      _$InventoryModelImpl _value, $Res Function(_$InventoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? inventoryName = null,
    Object? inventoryQuantity = null,
  }) {
    return _then(_$InventoryModelImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      inventoryName: null == inventoryName
          ? _value.inventoryName
          : inventoryName // ignore: cast_nullable_to_non_nullable
              as String,
      inventoryQuantity: null == inventoryQuantity
          ? _value.inventoryQuantity
          : inventoryQuantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryModelImpl implements _InventoryModel {
  const _$InventoryModelImpl(
      {required this.uid,
      required this.inventoryName,
      required this.inventoryQuantity});

  factory _$InventoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryModelImplFromJson(json);

  @override
  final String uid;
  @override
  final String inventoryName;
  @override
  final int inventoryQuantity;

  @override
  String toString() {
    return 'InventoryModel(uid: $uid, inventoryName: $inventoryName, inventoryQuantity: $inventoryQuantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryModelImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.inventoryName, inventoryName) ||
                other.inventoryName == inventoryName) &&
            (identical(other.inventoryQuantity, inventoryQuantity) ||
                other.inventoryQuantity == inventoryQuantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uid, inventoryName, inventoryQuantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryModelImplCopyWith<_$InventoryModelImpl> get copyWith =>
      __$$InventoryModelImplCopyWithImpl<_$InventoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryModelImplToJson(
      this,
    );
  }
}

abstract class _InventoryModel implements InventoryModel {
  const factory _InventoryModel(
      {required final String uid,
      required final String inventoryName,
      required final int inventoryQuantity}) = _$InventoryModelImpl;

  factory _InventoryModel.fromJson(Map<String, dynamic> json) =
      _$InventoryModelImpl.fromJson;

  @override
  String get uid;
  @override
  String get inventoryName;
  @override
  int get inventoryQuantity;
  @override
  @JsonKey(ignore: true)
  _$$InventoryModelImplCopyWith<_$InventoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

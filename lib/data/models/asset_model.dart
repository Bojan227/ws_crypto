import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'asset_model.freezed.dart';

part 'asset_model.g.dart';

@freezed
class AssetDto with _$AssetDto {
  const factory AssetDto(List<Map<String, dynamic>> data) = _AssetDto;

  factory AssetDto.fromJson(Map<String, dynamic> json) =>
      _$AssetDtoFromJson(json);
}

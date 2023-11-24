import 'package:json_annotation/json_annotation.dart';

import 'package:place_autocomplete/models/place/geometry_model.dart';

part 'place_model.g.dart';

@JsonSerializable()
class Place {
  Place(this.result);

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  final Result? result;

  Map<String, dynamic> toJson() => _$PlaceToJson(this);
}

@JsonSerializable()
class Result {
  Result(this.geometry, this.placeId);

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  final Geometry? geometry;
  @JsonKey(name: 'place_id')
  final String? placeId;
}

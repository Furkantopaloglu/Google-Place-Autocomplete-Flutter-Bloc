import 'package:json_annotation/json_annotation.dart';
part 'geometry_model.g.dart';

@JsonSerializable()
class Geometry {
  Geometry(this.location);

  factory Geometry.fromJson(Map<String, dynamic> json) =>
      _$GeometryFromJson(json);

  final Location? location;
}

@JsonSerializable()
class Location {
  Location(this.lat, this.lng);

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  final double? lat;
  final double? lng;
}

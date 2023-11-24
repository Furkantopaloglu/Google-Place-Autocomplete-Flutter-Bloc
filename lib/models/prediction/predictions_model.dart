import 'package:json_annotation/json_annotation.dart';
import 'package:place_autocomplete/models/prediction/structured_formatting_model.dart';

part 'predictions_model.g.dart';

@JsonSerializable()
class PredictionResponse {
  PredictionResponse(this.predictions, this.status);

  factory PredictionResponse.fromJson(Map<String, dynamic> json) =>
      _$PredictionResponseFromJson(json);

  @JsonKey(name: 'predictions')
  final List<Prediction>? predictions;
  final String? status;

  Map<String, dynamic> toJson() => _$PredictionResponseToJson(this);
}

@JsonSerializable()
class Prediction {
  Prediction(this.description, this.placeId, this.structuredFormatting);

  factory Prediction.fromJson(Map<String, dynamic> json) =>
      _$PredictionFromJson(json);

  final String? description;
  @JsonKey(name: 'place_id')
  final String? placeId;
  @JsonKey(name: 'structured_formatting')
  final StructuredFormatting? structuredFormatting;
}

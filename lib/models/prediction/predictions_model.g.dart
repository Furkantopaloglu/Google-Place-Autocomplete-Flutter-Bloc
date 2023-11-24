// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'predictions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PredictionResponse _$PredictionResponseFromJson(Map<String, dynamic> json) =>
    PredictionResponse(
      (json['predictions'] as List<dynamic>?)
          ?.map((e) => Prediction.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['status'] as String?,
    );

Map<String, dynamic> _$PredictionResponseToJson(PredictionResponse instance) =>
    <String, dynamic>{
      'predictions': instance.predictions,
      'status': instance.status,
    };

Prediction _$PredictionFromJson(Map<String, dynamic> json) => Prediction(
      json['description'] as String?,
      json['place_id'] as String?,
      json['structured_formatting'] == null
          ? null
          : StructuredFormatting.fromJson(
              json['structured_formatting'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PredictionToJson(Prediction instance) =>
    <String, dynamic>{
      'description': instance.description,
      'place_id': instance.placeId,
      'structured_formatting': instance.structuredFormatting,
    };

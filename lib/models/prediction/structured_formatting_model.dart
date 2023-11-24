import 'package:json_annotation/json_annotation.dart';

part 'structured_formatting_model.g.dart';

@JsonSerializable()
class StructuredFormatting {
  StructuredFormatting(this.mainText, this.secondaryText);

  factory StructuredFormatting.fromJson(Map<String, dynamic> json) =>
      _$StructuredFormattingFromJson(json);
  @JsonKey(name: 'main_text')
  final String? mainText;
  @JsonKey(name: 'secondary_text')
  final String? secondaryText;
}

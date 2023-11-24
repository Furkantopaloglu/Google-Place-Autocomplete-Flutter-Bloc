part of 'auto_complete_bloc.dart';

abstract class AutoCompleteEvent extends Equatable {
  const AutoCompleteEvent();

  @override
  List<Object> get props => [];
}

class TextChanged extends AutoCompleteEvent {
  const TextChanged({required this.text});
  final String text;

  @override
  List<Object> get props => [text];

  @override
  String toString() => 'TextChanged { text: $text }';
}

class PlaceSelected extends AutoCompleteEvent {
  const PlaceSelected({required this.place});
  final Prediction place;

  @override
  List<Object> get props => [];
}

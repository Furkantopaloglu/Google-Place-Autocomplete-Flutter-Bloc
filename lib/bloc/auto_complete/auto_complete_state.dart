part of 'auto_complete_bloc.dart';

sealed class AutoCompleteState extends Equatable {
  const AutoCompleteState();

  @override
  List<Object> get props => [];
}

class AutoCompleteEmpty extends AutoCompleteState {}

class AutoCompleteLoading extends AutoCompleteState {}

class AutoCompleteSuccess extends AutoCompleteState {
  const AutoCompleteSuccess(this.items);
  final List<Prediction> items;

  @override
  List<Object> get props => [items];
}

class AutoCompleteSelectedPlace extends AutoCompleteState {
  const AutoCompleteSelectedPlace(this.place);
  final Place place;

  @override
  List<Object> get props => [place];
}

class AutoCompleteError extends AutoCompleteState {
  const AutoCompleteError(this.error);

  final String error;
}

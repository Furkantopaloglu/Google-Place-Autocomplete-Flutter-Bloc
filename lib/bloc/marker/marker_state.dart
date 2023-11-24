part of 'marker_cubit.dart';

sealed class MarkerState extends Equatable {
  const MarkerState();

  @override
  List<Object> get props => [];
}

final class MarkerInitial extends MarkerState {}

final class MarkerComplate extends MarkerState {
  const MarkerComplate(this.place);
  final Place place;

  @override
  List<Object> get props => [place];
}

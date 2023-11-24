import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:place_autocomplete/models/place/place_model.dart';
import 'package:place_autocomplete/models/prediction/predictions_model.dart';
import 'package:place_autocomplete/repository/place_search_service.dart';

import 'package:stream_transform/stream_transform.dart';

part 'auto_complete_event.dart';
part 'auto_complete_state.dart';

const _duration = Duration(milliseconds: 300);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class AutoCompleteBloc extends Bloc<AutoCompleteEvent, AutoCompleteState> {
  AutoCompleteBloc({required this.placeSearchService})
      : super(AutoCompleteEmpty()) {
    on<TextChanged>(_onTextChanged, transformer: debounce(_duration));
  }

  final PlaceSearchService placeSearchService;
  Future<void> _onTextChanged(
    TextChanged event,
    Emitter<AutoCompleteState> emit,
  ) async {
    final searchTerm = event.text;
    if (searchTerm.length < 2) return emit(AutoCompleteEmpty());

    emit(AutoCompleteLoading());

    final results =
        await placeSearchService.placesAutoCompleteSearch(searchTerm);
    if (results != null) {
      emit(AutoCompleteSuccess(results.predictions!));
    } else {
      const AutoCompleteError('something went wrong');
    }
  }
}

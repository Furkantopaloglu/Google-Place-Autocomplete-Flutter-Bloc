import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_autocomplete/models/place/place_model.dart';
import 'package:place_autocomplete/repository/place_search_service.dart';

part 'marker_state.dart';

class MarkerCubit extends Cubit<MarkerState> {
  MarkerCubit({required this.placeSearchService}) : super(MarkerInitial());

  final Set<Marker> mapMarkers = {};
  late GoogleMapController controller;
  final PlaceSearchService placeSearchService;
  Future<void> selectPlace(
    String placeId,
  ) async {
    mapMarkers.clear();
    final results = await placeSearchService.getPlace(placeId);
    mapMarkers.add(
      Marker(
        markerId: MarkerId(results!.result!.placeId!),
        position: LatLng(results.result!.geometry!.location!.lat!,
            results.result!.geometry!.location!.lng!),
      ),
    );
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          zoom: 12,
          target: LatLng(
            results.result!.geometry!.location!.lat!,
            results.result!.geometry!.location!.lng!,
          ),
        ),
      ),
    );
    emit(MarkerComplate(results));
  }
}

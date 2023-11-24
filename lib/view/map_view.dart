import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_autocomplete/bloc/auto_complete/auto_complete_bloc.dart';
import 'package:place_autocomplete/bloc/marker/marker_cubit.dart';
import 'package:place_autocomplete/repository/place_search_service.dart';
import 'package:place_autocomplete/view/widgets/search_result_item.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    const kInitialPosition =
        CameraPosition(target: LatLng(11.967375, 121.924812), zoom: 15);
    final textController = TextEditingController();
    final placeSearchService = PlaceSearchService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Place Autocomplete'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => MarkerCubit(placeSearchService: placeSearchService),
          ),
          BlocProvider(
            create: (_) =>
                AutoCompleteBloc(placeSearchService: placeSearchService),
          ),
        ],
        child: Stack(
          children: [
            const Map(kInitialPosition: kInitialPosition),
            PredictionList(
              textController: textController,
            ),
          ],
        ),
      ),
    );
  }
}

class Map extends StatelessWidget {
  const Map({
    required CameraPosition kInitialPosition,
    super.key,
  }) : _kInitialPosition = kInitialPosition;

  final CameraPosition _kInitialPosition;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarkerCubit, MarkerState>(
      builder: (context, state) {
        return GoogleMap(
          onMapCreated: (controller) {
            context.read<MarkerCubit>().controller = controller;
          },
          markers: context.read<MarkerCubit>().mapMarkers,
          initialCameraPosition: _kInitialPosition,
        );
      },
    );
  }
}

class PredictionList extends StatelessWidget {
  const PredictionList({
    required TextEditingController textController,
    super.key,
  }) : _textController = textController;

  final TextEditingController _textController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.06,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: TextFormField(
              controller: _textController,
              autocorrect: false,
              onChanged: (text) {
                context.read<AutoCompleteBloc>().add(TextChanged(text: text));
              },
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.black54,
                  ),
                  onPressed: () {
                    context
                        .read<AutoCompleteBloc>()
                        .add(const TextChanged(text: ""));
                    _textController.clear();
                  },
                ),
                prefixIcon: const Icon(
                  Icons.location_pin,
                  color: Colors.red,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          const SearchResults()
        ],
      ),
    );
  }
}

class SearchResults extends StatelessWidget {
  const SearchResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AutoCompleteBloc, AutoCompleteState>(
      builder: (context, state) {
        return switch (state) {
          AutoCompleteEmpty() => const SizedBox.shrink(),
          AutoCompleteSelectedPlace() => const SizedBox.shrink(),
          AutoCompleteError() => Text(state.error),
          AutoCompleteLoading() => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          AutoCompleteSuccess() => state.items.isEmpty
              ? const Text('No Result')
              : Expanded(
                  child: ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SearchResultItemCard(
                        itemText: state.items[index].structuredFormatting!,
                        onTap: () {
                          context.read<MarkerCubit>().selectPlace(
                                state.items[index].placeId.toString(),
                              );
                          context
                              .read<AutoCompleteBloc>()
                              .add(const TextChanged(text: ''));
                        },
                      );
                    },
                  ),
                ),
        };
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rides_showcase/feature/ride_summary/presentation/bloc/location_tile_cubit.dart';

class LocationTile extends StatelessWidget {
  const LocationTile({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        BlocBuilder<LocationTileCubit, LocationTileState>(
          builder: (context, state) {
            switch (state) {
              case LocationTileLoading():
                return const CircularProgressIndicator();
              case LocationTileLoaded():
                return Text(
                  _buildAddress(state),
                  style: const TextStyle(color: Colors.grey),
                );
              case LocationTileError():
                return Text(
                  state.error,
                  style: const TextStyle(color: Colors.grey),
                );
            }
          },
        ),
      ],
    );
  }

  String _buildAddress(LocationTileLoaded state) =>
      state.placemark.street != null
          ? '${state.placemark.street}, ${state.placemark.locality},'
              ' ${state.placemark.country}'
          : '${state.placemark.locality}, ${state.placemark.country}';
}

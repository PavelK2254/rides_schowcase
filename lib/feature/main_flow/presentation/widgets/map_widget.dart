import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rides_showcase/feature/main_flow/presentation/bloc/map_widget_cubit.dart';
import 'package:rides_showcase/styleguide/dimensions.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MapWidgetCubit, MapWidgetState>(
        builder: (context, state) => SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height / 3,
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(cardBorderRadius),
            ),
            margin: const EdgeInsets.all(medium),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(cardBorderRadius),
              child: GoogleMap(
                circles: state.circles.toSet(),
                initialCameraPosition: CameraPosition(
                  target: state.currentLocation,
                  zoom: 14.4746,
                ),
                onMapCreated: (GoogleMapController controller) {
                  context.read<MapWidgetCubit>().controller = controller;
                },
                myLocationEnabled: true,
              ),
            ),
          ),
        ),
      );
}

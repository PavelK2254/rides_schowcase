import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rides_showcase/feature/main_flow/domain/repositories/main_flow_repository.dart';
import 'package:rides_showcase/feature/main_flow/presentation/bloc/map_widget_cubit.dart';
import 'package:rides_showcase/feature/main_flow/presentation/bloc/where_to_cubit.dart';
import 'package:rides_showcase/feature/main_flow/presentation/widgets/map_widget.dart';
import 'package:rides_showcase/feature/main_flow/presentation/widgets/where_to_content_section.dart';
import 'package:rides_showcase/feature/main_flow/presentation/widgets/where_to_field.dart';
import 'package:rides_showcase/navigation/app_navigation.dart';
import 'package:rides_showcase/styleguide/dimensions.dart';

class SetDestinationScreen extends StatelessWidget {
  const SetDestinationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set your destination'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const MapWidget(),
          WhereToField(
            onTap: () {
              final mapCubit = context.read<MapWidgetCubit>();
              showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                backgroundColor: Theme.of(context).colorScheme.surface,
                builder: (BuildContext _) => WhereToContentSection(
                  onLocationSelected: mapCubit.setMapLocation,
                  cubit: context.read<WhereToCubit>(),
                  onConfirm: () {
                    mapCubit.addMapMarkers(context);
                  },
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(medium),
            child: ElevatedButton(
              onPressed: () {
                _buttonEnabled(context)
                    ? AppNavigation().goToRideDetails(context)
                    : ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select a destination'),
                        ),
                      );
              },
              child: const Text('Confirm destination'),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  bool _buttonEnabled(BuildContext context) =>
      context.read<MainFlowRepository>().pickupLocation != null &&
      context.read<MainFlowRepository>().destinationLocation != null;
}

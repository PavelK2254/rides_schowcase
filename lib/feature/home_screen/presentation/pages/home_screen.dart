import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rides_showcase/feature/home_screen/presentation/bloc/home_screen_cubit.dart';
import 'package:rides_showcase/feature/home_screen/presentation/widgets/where_to_content.dart';
import 'package:rides_showcase/feature/home_screen/presentation/widgets/where_to_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: BlocBuilder<HomeScreenCubit, HomeScreenState>(
        builder: (context, HomeScreenState state) {
          return switch (state) {
            HomeScreenInitial() => Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height / 3,
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: const EdgeInsets.all(16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: state.currentLocation,
                            zoom: 14.4746,
                          ),
                          onMapCreated: (GoogleMapController controller) {
                            context.read<HomeScreenCubit>().controller =
                                controller;
                          },
                          myLocationEnabled: true,
                        ),
                      ),
                    ),
                  ),
                  WhereToField(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        builder: (_) => const WhereToContent(),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to another screen or perform an action
                      },
                      child: const Text('Confirm destination'),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            HomeScreenError() => throw UnimplementedError(),
          };
        },
      ),
    );
  }
}

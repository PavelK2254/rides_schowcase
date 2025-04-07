import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rides_showcase/feature/ride_details/presentation/bloc/ride_type_carousel_cubit.dart';
import 'package:rides_showcase/feature/ride_details/presentation/widgets/ride_container.dart';

class RideTypeCarousel extends StatefulWidget {
  const RideTypeCarousel({super.key});

  @override
  State<RideTypeCarousel> createState() => _RideTypeCarouselState();
}

class _RideTypeCarouselState extends State<RideTypeCarousel> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RideTypeCarouselCubit, RideTypeCarouselState>(
      builder: (context, state) {
        switch (state) {
          case RideTypeCarouselLoading():
            return const Center(
              child: CircularProgressIndicator(),
            );
          case RideTypeCarouselLoaded():
            return SizedBox(
              height: 190,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: state.rideTypes.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final ride = state.rideTypes[index];
                  final isSelected = index == selectedIndex;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        context
                            .read<RideTypeCarouselCubit>()
                            .setCurrentRideType(ride);
                      });
                    },
                    child: RideContainer(isSelected: isSelected, ride: ride),
                  );
                },
              ),
            );
          case RideTypeCarouselError():
            return const SizedBox();
        }
      },
    );
  }
}

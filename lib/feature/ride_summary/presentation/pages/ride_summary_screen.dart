import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rides_showcase/feature/main_flow/data/remote/data_sources/geocoding_service.dart';
import 'package:rides_showcase/feature/ride_summary/presentation/bloc/location_tile_cubit.dart';
import 'package:rides_showcase/feature/ride_summary/presentation/bloc/ride_summary_cubit.dart';
import 'package:rides_showcase/feature/ride_summary/presentation/widgets/date_tile.dart';
import 'package:rides_showcase/feature/ride_summary/presentation/widgets/location_tile.dart';
import 'package:rides_showcase/feature/ride_summary/presentation/widgets/passanger_info.dart';
import 'package:rides_showcase/feature/ride_summary/presentation/widgets/ride_info_card.dart';
import 'package:rides_showcase/styleguide/dimensions.dart';
import 'package:rides_showcase/utils/utils.dart';

class RideSummaryScreen extends StatelessWidget {
  const RideSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ride Summary'),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: BlocConsumer<RideSummaryCubit, RideSummaryState>(
        builder: (BuildContext context, state) {
          final rideEntity = state.rideEntity;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                RideInfoCard(
                  imagePath: rideEntity.rideType.imagePath,
                  title: rideEntity.rideType.name,
                  subtitle: '${rideEntity.rideType.description} -'
                      ' ${rideEntity.rideType.price}',
                ),
                const SizedBox(height: 32),
                BlocProvider(
                  create: (context) =>
                      LocationTileCubit(geocodingService: GeocodingService())
                        ..getLocationFromAddress(rideEntity.pickupLocation),
                  child: const LocationTile(label: 'Pickup Location'),
                ),
                const SizedBox(height: 24),
                DateTile(
                  title: 'Pickup Time',
                  date: getDateSubtitle(rideEntity.selectedDate),
                ),
                const SizedBox(height: 24),
                BlocProvider(
                  create: (context) => LocationTileCubit(
                    geocodingService: GeocodingService(),
                  )..getLocationFromAddress(rideEntity.destinationLocation),
                  child: const LocationTile(label: 'Drop-off Location'),
                ),
                const SizedBox(height: 24),
                PassengerInfo(
                  countLabel: 'Passenger Count',
                  description: getPassengersSubtitle(
                    int.parse(rideEntity.passengerAmount),
                  ),
                ),
                const Spacer(),
                AnimatedCrossFade(
                  duration: kThemeAnimationDuration,
                  firstChild: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(small),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  secondChild: ElevatedButton(
                    onPressed: context.read<RideSummaryCubit>().bookRide,
                    child: const Text('Confirm Ride'),
                  ),
                  crossFadeState: state is RideSummaryLoading
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
        listener: (BuildContext context, RideSummaryState state) {
          if (state is RideSummaryError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              ),
            );
          }
          if (state is RideSummarySuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content:
                    Text('Ride booked successfully, you will receive an email'
                        ' with additional details'),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
      ),
    );
  }
}

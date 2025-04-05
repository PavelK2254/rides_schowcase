import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rides_showcase/feature/home_screen/presentation/widgets/address_text_field.dart';
import 'package:rides_showcase/feature/home_screen/presentation/widgets/where_to_content.dart';
import 'package:rides_showcase/feature/home_screen/presentation/widgets/where_to_field.dart';
import 'package:rides_showcase/styleguide/dimensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
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
                child: const GoogleMap(
                  initialCameraPosition: _kGooglePlex,
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
    );
  }
}

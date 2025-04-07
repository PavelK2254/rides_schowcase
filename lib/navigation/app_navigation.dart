import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  void goToRoot(BuildContext context) {
    context.replace('/');
  }

  void goToRideDetails(BuildContext context) {
    context.go('/ride-details');
  }
}

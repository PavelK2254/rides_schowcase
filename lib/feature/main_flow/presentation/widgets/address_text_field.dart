import 'package:flutter/material.dart';

class AddressTextField extends StatelessWidget {
  const AddressTextField.pickup({
    required this.controller,
    super.key,
    this.errorText,
  })  : label = 'Pickup Point',
        hint = 'Enter pickup location';

  const AddressTextField.destination({
    required this.controller,
    super.key,
    this.errorText,
  })  : label = 'Destination Point',
        hint = 'Enter destination location';

  final TextEditingController controller;
  final String label;
  final String hint;
  final String? errorText;

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        onTapOutside: (_) => FocusScope.of(context).unfocus,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          errorText: errorText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Theme.of(context).inputDecorationTheme.fillColor,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          prefixIcon: const Icon(Icons.location_on, color: Colors.grey),
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 16,
          ),
          prefixIconColor: Colors.grey.shade500,
        ),
      );
}

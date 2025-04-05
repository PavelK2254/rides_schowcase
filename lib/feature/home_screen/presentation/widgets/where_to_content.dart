import 'package:flutter/material.dart';
import 'package:rides_showcase/feature/home_screen/presentation/widgets/address_text_field.dart';
import 'package:rides_showcase/styleguide/dimensions.dart';

class WhereToContent extends StatelessWidget {
  const WhereToContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        medium,
        medium,
        medium,
        medium + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(small),
            child: Text(
              'Where to?',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(
            height: medium,
          ),
          AddressTextField.pickup(
            controller: TextEditingController(),
          ),
          const SizedBox(
            height: medium,
          ),
          AddressTextField.destination(
            controller: TextEditingController(),
          ),
          const SizedBox(
            height: medium,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }
}

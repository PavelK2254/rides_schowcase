import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:rides_showcase/feature/main_flow/presentation/bloc/where_to_cubit.dart';
import 'package:rides_showcase/feature/main_flow/presentation/widgets/address_text_field.dart';
import 'package:rides_showcase/styleguide/dimensions.dart';

class WhereToContent extends StatelessWidget {
  const WhereToContent({
    required this.onLocationSelected,
    required this.cubit,
    required this.onConfirm,
    super.key,
  });

  final WhereToCubit cubit;
  final void Function(Location locations) onLocationSelected;
  final void Function() onConfirm;

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<WhereToCubit, WhereToState>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) {
          if (state is WhereToLoaded) {
            onLocationSelected(state.location);
          }
        },
        bloc: cubit,
        builder: (context, state) => Padding(
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
                controller: cubit.pickupController,
                errorText:
                    state is WhereToError ? state.pickupErrorMessage : null,
              ),
              const SizedBox(
                height: medium,
              ),
              AddressTextField.destination(
                controller: cubit.destinationController,
                errorText: state is WhereToError
                    ? state.destinationErrorMessage
                    : null,
              ),
              const SizedBox(
                height: medium,
              ),
              ElevatedButton(
                onPressed: state is WhereToLoaded && state.areAddressesValid
                    ? () {
                        onConfirm();
                        Navigator.pop(context);
                      }
                    : null,
                child: const Text('Confirm'),
              ),
            ],
          ),
        ),
      );
}

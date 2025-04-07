import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rides_showcase/feature/ride_details/presentation/bloc/ride_options_cubit.dart';
import 'package:rides_showcase/feature/ride_details/presentation/widgets/options_tile.dart';

class RideOptionsSection extends StatelessWidget {
  const RideOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RideOptionsCubit, RideOptionsState>(
      builder: (context, state) {
        return Column(
          children: [
            OptionTile(
              icon: Icons.schedule_outlined,
              title: 'When',
              subtitle: _getDateSubtitle(state),
              onTap: () {
                showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                ).then((date) {
                  if (context.mounted) {
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then((time) {
                      if (date != null && time != null) {
                        final selectedDateTime = DateTime(
                          date.year,
                          date.month,
                          date.day,
                          time.hour,
                          time.minute,
                        );
                        if (context.mounted) {
                          context
                              .read<RideOptionsCubit>()
                              .setDateTime(selectedDateTime);
                        }
                      }
                    });
                  }
                });
              },
            ),
            const SizedBox(height: 12),
            OptionTile(
              icon: Icons.people_outline,
              title: 'Passengers',
              subtitle: _getPassengersSubtitle(state),
              onTap: () {
                showAdaptiveDialog<void>(
                  context: context,
                  builder: (context) {
                    var selectedValue = 1;
                    return AlertDialog(
                      title: const Text('Select number of passengers'),
                      content: SizedBox(
                        height: 150,
                        child: ListWheelScrollView.useDelegate(
                          itemExtent: 50,
                          onSelectedItemChanged: (index) {
                            selectedValue = index + 1;
                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                            builder: (context, index) {
                              return Center(
                                child: Text((index + 1).toString()),
                              );
                            },
                            childCount: 100,
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            context
                                .read<RideOptionsCubit>()
                                .setPassengers(selectedValue);
                            Navigator.of(context).pop(selectedValue);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }

  String _getDateSubtitle(RideOptionsState state) {
    if (state.dateTime == null) {
      return 'Select a date and time';
    } else {
      return '${state.dateTime!.day}/${state.dateTime!.month}/${state.dateTime!.year} ${state.dateTime!.hour}:${state.dateTime!.minute}';
    }
  }

  String _getPassengersSubtitle(RideOptionsState state) {
    if (state.passengers == 1) {
      return '1 Passenger';
    } else {
      return '${state.passengers} Passengers';
    }
  }
}

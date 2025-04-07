part of 'where_to_cubit.dart';

abstract class WhereToState extends Equatable {
  const WhereToState();

  @override
  List<Object?> get props => [];
}

class WhereToInitial extends WhereToState {}

class WhereToLoaded extends WhereToState {
  const WhereToLoaded(this.location, {this.areAddressesValid = false});
  final Location location;
  final bool areAddressesValid;

  @override
  List<Object?> get props => [location];
}

class WhereToError extends WhereToState {
  const WhereToError({this.pickupErrorMessage, this.destinationErrorMessage});

  final String? pickupErrorMessage;
  final String? destinationErrorMessage;

  @override
  List<Object?> get props => [pickupErrorMessage, destinationErrorMessage];
}

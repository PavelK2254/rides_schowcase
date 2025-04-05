import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());
}

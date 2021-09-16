import 'package:apod_app/data/repositories/apod_repository.dart';
import 'package:apod_app/models/apod.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'apod_state.dart';

class ApodCubit extends Cubit<ApodState> {
  final ApodRepository repository;

  ApodCubit(this.repository) : super(ApodInitial());
  // int page = 1;
  void loadThisWeekApods() {
    if (state is ApodLoading) {
      emit(ApodLoading());
    }

    repository.fetchThisWeek().then((value) {
      emit(ApodLoaded(apods: value));
    });
  }
}

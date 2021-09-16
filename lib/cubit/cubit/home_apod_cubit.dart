import 'package:apod_app/data/repositories/apod_repository.dart';
import 'package:apod_app/models/apod.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_apod_state.dart';

class HomeApodCubit extends Cubit<HomeApodState> {
  HomeApodCubit(this.repository) : super(HomeApodInitial());

  final ApodRepository repository;

  void loadTodayApod() {
    repository.fetchToday().then((value) {
      emit(HomeApodLoaded(apod: value));
    });
  }
}

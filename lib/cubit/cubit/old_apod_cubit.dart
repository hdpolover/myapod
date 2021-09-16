import 'package:apod_app/data/repositories/apod_repository.dart';
import 'package:apod_app/models/apod.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'old_apod_state.dart';

class OldApodCubit extends Cubit<OldApodState> {
  final ApodRepository repository;

  OldApodCubit(this.repository) : super(OldApodInitial());

  void loadOlderApods() {
    if (state is ApodOlderLoading) {
      emit(ApodOlderLoading());
    }
    repository.fetchOlder().then((value) {
      emit(ApodOlderLoaded(apods: value));
    });
  }
}

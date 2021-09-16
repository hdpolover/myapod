import 'dart:async';

import 'package:apod_app/data/repositories/apod_repository.dart';
import 'package:apod_app/models/apod.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'discover_event.dart';
part 'discover_state.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  ApodRepository apodRepository;

  DiscoverBloc({required this.apodRepository}) : super(DiscoverInitialState());

  @override
  Stream<DiscoverState> mapEventToState(
    DiscoverEvent event,
  ) async* {
    if (event is FetchThisWeekApodEvent) {
      yield DiscoverLoadingState();

      try {
        List<Apod> apods = await apodRepository.fetchThisWeek();
        yield DiscoverLoadedState(apods: apods);
      } catch (e) {
        yield DiscoverErrorState(message: e.toString());
      }
    }
  }
}

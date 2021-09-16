part of 'discover_bloc.dart';

@immutable
abstract class DiscoverState {}

class DiscoverInitialState extends DiscoverState {}

class DiscoverLoadingState extends DiscoverState {}

class DiscoverLoadedState extends DiscoverState {
  final List<Apod> apods;

  DiscoverLoadedState({required this.apods});
}

class DiscoverErrorState extends DiscoverState {
  final String message;

  DiscoverErrorState({required this.message});
}

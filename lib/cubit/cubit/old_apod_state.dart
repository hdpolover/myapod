part of 'old_apod_cubit.dart';

@immutable
abstract class OldApodState {}

class OldApodInitial extends OldApodState {}

class ApodOlderLoaded extends OldApodState {
  final List<Apod> apods;

  ApodOlderLoaded({required this.apods});
}

class ApodOlderLoading extends OldApodState {}

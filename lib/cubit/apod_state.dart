part of 'apod_cubit.dart';

@immutable
abstract class ApodState {}

class ApodInitial extends ApodState {}

class ApodLoaded extends ApodState {
  final List<Apod> apods;

  ApodLoaded({required this.apods});
}

class ApodLoading extends ApodState {}

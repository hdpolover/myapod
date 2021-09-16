part of 'home_apod_cubit.dart';

@immutable
abstract class HomeApodState {}

class HomeApodInitial extends HomeApodState {}

class HomeApodLoaded extends HomeApodState {
  final Apod apod;

  HomeApodLoaded({required this.apod});
}

class HomeApodLoading extends HomeApodState {}

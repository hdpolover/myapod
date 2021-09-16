import 'package:apod_app/data/services/apod_service.dart';
import 'package:apod_app/models/apod.dart';

class ApodRepository {
  final ApodService service;

  ApodRepository({required this.service});

  Future<Apod> fetchToday() async {
    final apod = await service.fetchToday();

    return Apod.fromJson(apod);
  }

  Future<List<Apod>> fetchThisWeek() async {
    final apod = await service.fetchThisWeek();

    return apod.map((e) => Apod.fromJson(e)).toList();
  }

  Future<List<Apod>> fetchOlder() async {
    final apod = await service.fetchOlderApods();

    return apod.map((e) => Apod.fromJson(e)).toList();
  }
}

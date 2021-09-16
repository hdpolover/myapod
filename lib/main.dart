import 'package:apod_app/app_router.dart';
import 'package:apod_app/constants.dart';
import 'package:apod_app/cubit/apod_cubit.dart';
import 'package:apod_app/cubit/bloc/discover_bloc.dart';
import 'package:apod_app/cubit/cubit/home_apod_cubit.dart';
import 'package:apod_app/cubit/cubit/old_apod_cubit.dart';
import 'package:apod_app/data/repositories/apod_repository.dart';
import 'package:apod_app/data/services/apod_service.dart';
import 'package:apod_app/presentation/screens/apod_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/simple_bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(
    MyApp(
      appRouter: AppRouter(),
      repository: ApodRepository(
        service: ApodService(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter? appRouter;
  final ApodRepository repository;

  MyApp({required this.appRouter, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DiscoverBloc(
            apodRepository: ApodRepository(
              service: ApodService(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => ApodCubit(repository),
        ),
        BlocProvider(
          create: (context) => OldApodCubit(repository),
        ),
        BlocProvider(
          create: (context) => HomeApodCubit(repository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My APOD',
        theme: apodTheme,
        home: ApodApp(),
        initialRoute: "/",
        onGenerateRoute: appRouter!.generateRoute,
      ),
    );
  }
}



// void main() {
//   Bloc.observer = SimpleBlocObserver();
//   runApp(ApodApp(
//     appRouter: AppRouter(),
//     repository: ApodRepository(service: ApodService()),
//   ));
// }

// class ApodApp extends StatelessWidget {
//   final AppRouter? appRouter;
//   final ApodRepository repository;

//   const ApodApp({Key? key, this.appRouter, required this.repository})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ApodCubit(repository),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         onGenerateRoute: appRouter!.generateRoute,
//       ),
//     );
//   }
// }

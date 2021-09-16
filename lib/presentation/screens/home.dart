import 'package:apod_app/constants.dart';
import 'package:apod_app/cubit/cubit/home_apod_cubit.dart';
import 'package:apod_app/presentation/widgets/content.dart';
import 'package:apod_app/presentation/widgets/content_placeholder.dart';
import 'package:apod_app/presentation/widgets/header.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeApodCubit>(context).loadTodayApod();

    return Scaffold(
      body: BlocBuilder<HomeApodCubit, HomeApodState>(
        builder: (context, state) {
          if (state is HomeApodLoaded) {
            return Stack(
              children: [
                Hero(
                  tag: state.apod.title.toString(),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height,
                    imageUrl: state.apod.url.toString(),
                    errorWidget: (context, url, error) => Center(
                        child: Icon(
                      Icons.error,
                      color: Colors.yellow[700],
                    )),
                  ),
                ),
                Opacity(
                  opacity: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      gradient: new LinearGradient(
                        colors: [
                          Colors.black54,
                          Colors.white10,
                          Colors.black26,
                        ],
                        stops: [
                          0.15,
                          0.5,
                          0.65,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    header(context, mainTitle),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.33,
                    ),
                    content(context, state.apod),
                    //contentPlaceHolder(context),
                  ],
                ),
              ],
            );
          }
          return Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  'assets/placeholder_image.png',
                  fit: BoxFit.cover,
                ),
              ),
              Opacity(
                opacity: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                      colors: [
                        Colors.black54,
                        Colors.white10,
                        Colors.black26,
                      ],
                      stops: [
                        0.15,
                        0.5,
                        0.65,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  header(context, mainTitle),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.33,
                  ),
                  contentPlaceHolder(context),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

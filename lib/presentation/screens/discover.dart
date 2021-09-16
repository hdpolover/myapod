import 'package:apod_app/constants.dart';
import 'package:apod_app/cubit/apod_cubit.dart';
import 'package:apod_app/cubit/cubit/old_apod_cubit.dart';
import 'package:apod_app/presentation/widgets/apods_carousel.dart';
import 'package:apod_app/presentation/widgets/apods_grid.dart';
import 'package:apod_app/presentation/widgets/carousel_apod_shimmer.dart';
import 'package:apod_app/presentation/widgets/header.dart';
import 'package:apod_app/presentation/widgets/old_apod_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Discover extends StatelessWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ApodCubit>(context).loadThisWeekApods();
    BlocProvider.of<OldApodCubit>(context).loadOlderApods();

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(context, discoverTitle),
                BlocBuilder<ApodCubit, ApodState>(
                  builder: (context, state) {
                    if (state is ApodLoaded) {
                      return buildCarousel(context, state.apods);
                    }

                    return buildCarouselApodShimmer(context);
                  },
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    moreText,
                    style: subHeaderTextStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
                BlocBuilder<OldApodCubit, OldApodState>(
                  builder: (context, state) {
                    if (state is ApodOlderLoaded) {
                      return buildApodsGrid(context, state.apods);
                    }

                    return buildOldApodShimmer(context);
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

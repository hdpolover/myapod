import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

Widget buildCarouselApodShimmer(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Colors.black45,
    highlightColor: Colors.yellow[700]!,
    child: Container(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Container(
              color: Colors.grey,
              width: MediaQuery.of(context).size.width * 0.13,
              height: MediaQuery.of(context).size.height * 0.37,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Container(
                color: Colors.grey,
                width: MediaQuery.of(context).size.width * 0.66,
                height: MediaQuery.of(context).size.height * 0.45,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Container(
              color: Colors.grey,
              width: MediaQuery.of(context).size.width * 0.13,
              height: MediaQuery.of(context).size.height * 0.37,
            ),
          ),
        ],
      ),
    ),
  );
}

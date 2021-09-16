import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

Widget buildOldApodShimmer(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Colors.black45,
    highlightColor: Colors.yellow[700]!,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Container(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              child: Container(
                                color: Colors.grey,
                                width:
                                    MediaQuery.of(context).size.width * 0.435,
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    child: Container(
                                      color: Colors.grey,
                                      width: MediaQuery.of(context).size.width *
                                          0.42,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    child: Container(
                                      color: Colors.grey,
                                      width: MediaQuery.of(context).size.width *
                                          0.42,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.135,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      )),
    ),
  );
}

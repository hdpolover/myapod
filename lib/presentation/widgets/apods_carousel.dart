import 'package:apod_app/models/apod.dart';
import 'package:apod_app/presentation/widgets/open_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget buildCarousel(BuildContext context, List<Apod> apods) {
  return Container(
    child: CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 0.7,
        autoPlay: true,
        aspectRatio: 0.9,
        enlargeCenterPage: true,
      ),
      items: apods
          .map((item) => InkWell(
                onTap: () => openDetail(context, item),
                child: Container(
                  child: Container(
                    margin: EdgeInsets.all(5.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        child: Stack(
                          children: <Widget>[
                            Hero(
                              tag: item.title.toString(),
                              child: CachedNetworkImage(
                                imageUrl: item.url.toString(),
                                fit: BoxFit.cover,
                                height: 700,
                              ),
                            ),
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(200, 0, 0, 0),
                                      Color.fromARGB(0, 0, 0, 0)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                child: Text(
                                  item.title.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ))
          .toList(),
    ),
  );
}

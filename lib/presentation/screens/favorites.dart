import 'package:apod_app/constants.dart';
import 'package:apod_app/presentation/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);
  final String assetName = 'assets/empty.svg';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                header(context, favoritesTitle),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                SvgPicture.asset(
                  assetName,
                  alignment: Alignment.center,
                  semanticsLabel: 'Empty',
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 45,
                    right: 45,
                    top: 30,
                  ),
                  child: Text(
                    noFavoritesText,
                    textAlign: TextAlign.center,
                    style: descTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

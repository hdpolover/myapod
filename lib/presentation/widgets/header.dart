import 'package:apod_app/constants.dart';
import 'package:apod_app/presentation/screens/info.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

Widget header(BuildContext context, String title) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              softWrap: true,
              style: headerTextStyle,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          IconButton(
            onPressed: () {
              pushNewScreen(
                context,
                screen: Info(),
                withNavBar: false, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            icon: FaIcon(FontAwesomeIcons.infoCircle),
          ),
        ],
      ),
    ),
  );
}

import 'package:apod_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';

Widget contentPlaceHolder(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
          child: Container(
            color: Colors.grey,
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          baseColor: Colors.black45,
          highlightColor: Colors.yellow[700]!,
        ),
        SizedBox(height: 10),
        Shimmer.fromColors(
          child: Container(
            color: Colors.grey,
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          baseColor: Colors.black45,
          highlightColor: Colors.yellow[700]!,
        ),
        SizedBox(height: 10),
        Shimmer.fromColors(
          child: Container(
            color: Colors.grey,
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          baseColor: Colors.black45,
          highlightColor: Colors.yellow[700]!,
        ),
        SizedBox(height: 30),
        Shimmer.fromColors(
          child: Container(
            color: Colors.grey,
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          baseColor: Colors.black45,
          highlightColor: Colors.yellow[700]!,
        ),
        SizedBox(height: 10),
        Shimmer.fromColors(
          child: Container(
            color: Colors.grey,
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          baseColor: Colors.black45,
          highlightColor: Colors.yellow[700]!,
        ),
        SizedBox(height: 10),
        Shimmer.fromColors(
          child: Container(
            color: Colors.grey,
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          baseColor: Colors.black45,
          highlightColor: Colors.yellow[700]!,
        ),
        SizedBox(height: 10),
        Shimmer.fromColors(
          child: Container(
            color: Colors.grey,
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          baseColor: Colors.black45,
          highlightColor: Colors.yellow[700]!,
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Fluttertoast.showToast(
                          msg: "Saved to Favorites",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    },
                    icon: FaIcon(FontAwesomeIcons.heart),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: FaIcon(FontAwesomeIcons.share),
                    tooltip: "Favorite",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.yellow[700]!,
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                ),
                child: Text(
                  "Read More",
                  style: descTextStyle,
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

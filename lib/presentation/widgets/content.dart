import 'package:apod_app/constants.dart';
import 'package:apod_app/models/apod.dart';
import 'package:apod_app/presentation/widgets/open_detail.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

Widget content(BuildContext context, Apod apod) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Chip(
          label: Text(
            DateFormat('yyyy-MM-dd').format(apod.date!).toString(),
            style: descTextStyle,
          ),
        ),
        Text(
          apod.title.toString(),
          style: titleTextStyle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 15),
        Text(
          apod.explanation.toString(),
          style: descTextStyle,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
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
                onPressed: () {
                  openDetail(context, apod);
                },
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

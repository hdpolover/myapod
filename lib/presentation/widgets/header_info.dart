import 'package:apod_app/constants.dart';
import 'package:flutter/material.dart';

Widget headerInfo(BuildContext context, String title) {
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
        ],
      ),
    ),
  );
}

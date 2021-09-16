import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const API_KEY = "eZm4duHTVcdt8VIbPST5Y37nRiTxfdgZdOR54fsM";
const BASE_URL = "https://api.nasa.gov/planetary/apod";
const TEXT_NAME = "Poppins";

const String infoRoute = "/info";
const String discoverRoute = "/discover";
const String searchRoute = "/search";
const String favoritesRoute = "/favorites";
const String homeRoute = "/";

const String mainTitle = "Astronomy Picture of the Day";
const String discoverTitle = "This Week";
const String searchTitle = "Search APODs";
const String favoritesTitle = "Favorites";
const String moreText = "Discover previous APODs";
const String noFavoritesText =
    "You have no favorite APODs yet. Start adding some to see them here.";

const String infoTitle = "App Info";

ThemeData apodTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
);

TextStyle headerTextStyle = GoogleFonts.getFont(
  TEXT_NAME,
  color: Colors.yellow[700]!,
  fontSize: 30,
  fontWeight: FontWeight.bold,
);

TextStyle subHeaderTextStyle = GoogleFonts.getFont(
  TEXT_NAME,
  color: Colors.yellow[700]!,
  fontSize: 22,
  fontWeight: FontWeight.bold,
);

TextStyle titleTextStyle = GoogleFonts.getFont(
  TEXT_NAME,
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.bold,
  letterSpacing: 0.7,
);

TextStyle descTextStyle = GoogleFonts.getFont(
  TEXT_NAME,
  color: Colors.white,
  fontSize: 14,
  fontWeight: FontWeight.normal,
);

import 'package:apod_app/constants.dart';
import 'package:apod_app/models/apod.dart';
import 'package:apod_app/presentation/screens/full_photo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

class Detail extends StatelessWidget {
  final Apod selectedApod;

  const Detail({required this.selectedApod});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.heart),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FullPhoto(
                  url: selectedApod.hdurl.toString(),
                  imageTitle: selectedApod.title.toString(),
                ),
              ),
            ),
          ),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.expand),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FullPhoto(
                  url: selectedApod.url.toString(),
                  imageTitle: selectedApod.title.toString(),
                ),
              ),
            ),
          ),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.download),
            onPressed: () {
              _saveNetworkImage(context, selectedApod.hdurl.toString());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Hero(
                    tag: selectedApod.title.toString(),
                    transitionOnUserGestures: true,
                    child: CachedNetworkImage(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      imageUrl: selectedApod.url.toString(),
                      useOldImageOnUrlChange: true,
                      placeholder: (context, url) => Container(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Text(
                  selectedApod.title.toString(),
                  style: titleTextStyle,
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Chip(
                      avatar: FaIcon(
                        FontAwesomeIcons.calendar,
                        size: 17,
                      ),
                      padding: EdgeInsets.all(10),
                      label: Text(
                        DateFormat('yyyy-MM-dd')
                            .format(selectedApod.date!)
                            .toString(),
                        style: descTextStyle,
                        textAlign: TextAlign.justify,
                        softWrap: true,
                      ),
                    ),
                    SizedBox(width: 5),
                    selectedApod.copyright == null
                        ? Container()
                        : Expanded(
                            child: Chip(
                              avatar: FaIcon(
                                FontAwesomeIcons.solidCopyright,
                                size: 17,
                              ),
                              padding: EdgeInsets.all(10),
                              label: Text(
                                selectedApod.copyright.toString(),
                                style: descTextStyle,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Text(
                  selectedApod.explanation.toString(),
                  style: descTextStyle,
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _saveNetworkImage(BuildContext context, String url) async {
    showLoading(context);
    GallerySaver.saveImage(url, albumName: "Saved Apods").then((value) {
      print("saved");
      Navigator.of(context).pop();
      _showFinishDialog(context, url);
    });
  }

  void _showFinishDialog(context, url) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () => Future.value(false),
          child: AlertDialog(
            title: Text(
              'Image Saved!',
              style: subHeaderTextStyle,
            ),
            content: Text(
              'Do you want to set the image as wallpaper?',
              style: descTextStyle,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _showSetWallpaperDialog(context, url);
                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.yellow[700]!,
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                ),
                child: Text(
                  "Yes",
                  style: descTextStyle,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.grey,
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                ),
                child: Text(
                  "No",
                  style: descTextStyle,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showLoading(context) {
    showDialog(
      context: context,
      barrierColor: Colors.black54,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () => Future.value(false),
        child: new Dialog(
          backgroundColor: Colors.transparent,
          child: new Container(
            alignment: FractionalOffset.center,
            height: MediaQuery.of(context).size.height * 0.5,
            padding: const EdgeInsets.all(20.0),
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                new CircularProgressIndicator(
                  color: Colors.yellow[700],
                ),
                SizedBox(height: 30),
                new Padding(
                  padding: new EdgeInsets.only(left: 10.0),
                  child: new Text(
                    "Please wait! Downloading HD Image...",
                    style: descTextStyle,
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSetWallpaperDialog(context, url) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(
            'Set the image as',
            style: titleTextStyle,
          ),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () async {
                var cachedimage =
                    await DefaultCacheManager().getSingleFile(url);
                int location =
                    WallpaperManagerFlutter.HOME_SCREEN; //Choose screen type

                try {
                  WallpaperManagerFlutter()
                      .setwallpaperfromFile(cachedimage, location)
                      .then(
                    (value) {
                      Navigator.of(context).pop();
                      Fluttertoast.showToast(
                          msg: "Image set to Homescreen!",
                          toastLength: Toast.LENGTH_LONG,
                          timeInSecForIosWeb: 1);
                    },
                  );
                } catch (e) {
                  print("error: " + e.toString());
                  Fluttertoast.showToast(
                      msg: "An error occured!",
                      toastLength: Toast.LENGTH_LONG,
                      timeInSecForIosWeb: 1);
                }
              },
              child: Text(
                'Homescreen',
                style: descTextStyle,
              ),
            ),
            SimpleDialogOption(
              onPressed: () async {
                var cachedimage =
                    await DefaultCacheManager().getSingleFile(url);
                int location =
                    WallpaperManagerFlutter.LOCK_SCREEN; //Choose screen type

                try {
                  WallpaperManagerFlutter()
                      .setwallpaperfromFile(cachedimage, location)
                      .then(
                    (value) {
                      Navigator.of(context).pop();
                      Fluttertoast.showToast(
                          msg: "Image set to Lockscreen!",
                          toastLength: Toast.LENGTH_LONG,
                          timeInSecForIosWeb: 1);
                    },
                  );
                } catch (e) {
                  print("error: " + e.toString());
                  Fluttertoast.showToast(
                      msg: "An error occured!",
                      toastLength: Toast.LENGTH_LONG,
                      timeInSecForIosWeb: 1);
                }
              },
              child: Text(
                'Lockscreen',
                style: descTextStyle,
              ),
            ),
            SimpleDialogOption(
              onPressed: () async {
                var cachedimage =
                    await DefaultCacheManager().getSingleFile(url);
                int location =
                    WallpaperManagerFlutter.BOTH_SCREENS; //Choose screen type

                try {
                  WallpaperManagerFlutter()
                      .setwallpaperfromFile(cachedimage, location)
                      .then(
                    (value) {
                      Navigator.of(context).pop();
                      Fluttertoast.showToast(
                          msg: "Image set to Homescreen and Lockscreen!",
                          toastLength: Toast.LENGTH_LONG,
                          timeInSecForIosWeb: 1);
                    },
                  );
                } catch (e) {
                  print("error: " + e.toString());
                  Fluttertoast.showToast(
                      msg: "An error occured!",
                      toastLength: Toast.LENGTH_LONG,
                      timeInSecForIosWeb: 1);
                }
              },
              child: Text(
                'Both',
                style: descTextStyle,
              ),
            ),
          ],
        );
      },
    );
  }
}

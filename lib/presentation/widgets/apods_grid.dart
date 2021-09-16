import 'package:apod_app/models/apod.dart';
import 'package:apod_app/presentation/widgets/open_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

Widget buildApodsGrid(BuildContext context, List<Apod> apods) {
  return Flexible(
    child: StaggeredGridView.countBuilder(
      padding: EdgeInsets.only(left: 20, right: 20),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 4,
      itemCount: apods.length,
      itemBuilder: (BuildContext context, int index) =>
          apods[index].mediaType == "video"
              ? Container()
              : InkWell(
                  onTap: () => openDetail(context, apods[index]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: Container(
                        child: Center(
                      child: Hero(
                        tag: apods[index].title.toString(),
                        child: CachedNetworkImage(
                          imageUrl: apods[index].url.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                  ),
                ),
      staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
    ),
  );
}

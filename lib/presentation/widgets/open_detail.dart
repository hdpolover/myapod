import 'package:apod_app/presentation/screens/detail.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

openDetail(context, apod) {
  pushNewScreen(
    context,
    screen: Detail(selectedApod: apod),
    withNavBar: false, // OPTIONAL VALUE. True by default.
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
  );
}

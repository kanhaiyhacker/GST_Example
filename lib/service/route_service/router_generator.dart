import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gst_app/domain/model/gst/gst_detail.dart';
import 'package:gst_app/service/route_service/routes.dart';
import 'package:gst_app/ui/gst_detail/ui/gst_detail.dart';
import 'package:gst_app/ui/gst_search/ui/gst_search_home.dart';
import 'package:gst_app/ui/no_screen/gst_no_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => const GSTSearchHome());
      case AppRoutes.gstDetail:
        return MaterialPageRoute(
            builder: (context) => GSTDetailScreen(arg as GSTDetail));

      default:
        return MaterialPageRoute(builder: (context) => const GSTNoScreen());
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gst_app/data/api_client/api_endpoints.dart';
import 'package:gst_app/service/route_service/locator.dart';
import 'package:gst_app/service/route_service/navigation_service.dart';
import 'package:gst_app/service/route_service/router_generator.dart';
import 'package:gst_app/service/service_manager.dart';
import 'package:gst_app/ui/gst_search/bloc/gst_search_bloc.dart';
import 'package:gst_app/ui/gst_search/bloc/gst_search_bloc_state.dart';
import 'package:gst_app/ui/gst_search/ui/gst_search_home.dart';
import 'package:gst_app/utility/app_config/app_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  ServiceManager.init(baseUrl: kBaseUrl, isDebug: true);
  setupLocator();

  runApp(const BaseApp());
}

class BaseApp extends StatelessWidget {
  const BaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GSTSearchCubit>(
          create: (context) => GSTSearchCubit(LoadGSTSearchState.initial()),
        )
      ],
      child: MaterialApp(
        theme: AppThemeData,
        home: const GSTSearchHome(),
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}

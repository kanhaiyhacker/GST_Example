import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gst_app/service/route_service/locator.dart';
import 'package:gst_app/service/route_service/navigation_service.dart';
import 'package:gst_app/service/route_service/routes.dart';
import 'package:gst_app/ui/base_ui/base_ui.dart';
import 'package:gst_app/ui/gst_search/bloc/gst_search_bloc.dart';
import 'package:gst_app/ui/gst_search/bloc/gst_search_bloc_state.dart';
import 'package:gst_app/ui/gst_search/ui/sub_widget/home_header.dart';
import 'package:gst_app/ui/widgets/input_field.dart';
import 'package:gst_app/ui/widgets/primary_button.dart';
import 'package:gst_app/utility/color_util.dart';
import 'package:gst_app/utility/resources/size_constant.dart';
import 'package:gst_app/utility/resources/strings.dart';

class GSTSearchHome extends StatefulWidget {
  const GSTSearchHome({Key? key}) : super(key: key);

  @override
  _GSTSearchHomeState createState() => _GSTSearchHomeState();
}

class _GSTSearchHomeState extends State<GSTSearchHome> {
  late TextEditingController gstTextController;

  @override
  void initState() {
    gstTextController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BaseUI<GSTSearchCubit, GSTSearchCubitState>(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            padding: AppSizeUtil.paddingAll4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const HomeHeaderWidget(),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: AppSizeUtil.paddingOnlyHorizontal16,
                  child: InputField(
                      hintText: 'hintText',
                      labelText: kEnterGSTNumber,
                      textEditingController: gstTextController),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: AppSizeUtil.paddingOnlyHorizontal16,
                  child: Row(
                    children: [
                      Expanded(
                          child: PrimaryButton(
                              title: kSearch, action: getGSTData)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        onDataLoaded: (data) {
          locator<NavigationService>()
              .navigateTo(AppRoutes.gstDetail, data: data);
        },
      ),
    );
  }

  void getGSTData() {
    print("get gst data is called");
    FocusScope.of(context).unfocus();

    final gstNumber = gstTextController.text.trim();
    context.read<GSTSearchCubit>().searchGSTRepository(gstNumber);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gst_app/service/exception_helper.dart';
import 'package:gst_app/service/route_service/locator.dart';
import 'package:gst_app/service/route_service/navigation_service.dart';
import 'package:gst_app/service/route_service/routes.dart';
import 'package:gst_app/ui/gst_search/bloc/gst_search_bloc.dart';
import 'package:gst_app/ui/gst_search/bloc/gst_search_bloc_state.dart';
import 'package:gst_app/ui/gst_search/ui/sub_widget/home_header.dart';
import 'package:gst_app/ui/widgets/input_field.dart';
import 'package:gst_app/ui/widgets/primary_button.dart';
import 'package:gst_app/utility/color_util.dart';
import 'package:gst_app/utility/common/bloc_state.dart';
import 'package:gst_app/utility/resources/size_constant.dart';
import 'package:gst_app/utility/resources/strings.dart';
import 'package:loader_overlay/loader_overlay.dart';

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
      body: BlocConsumer<GSTSearchCubit, GSTSearchCubitState>(
          listener: (context, state) {
            if (state.status == Status.loading) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
            }
            if (state.status == Status.completed) {
              locator<NavigationService>()
                  .navigateTo(AppRoutes.gstDetail, data: state.data);
            }
            if (state.status == Status.error) {
              Fluttertoast.showToast(
                  msg:
                      state.error?.displayMessage ?? kErrorMessageGenericError);
            }
          },
          builder: (context, state) => LoaderOverlay(
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
              )),
    );
  }

  void getGSTData() {
    print("get gst data is called");
    FocusScope.of(context).unfocus();

    final gstNumber = gstTextController.text.trim();
    context.read<GSTSearchCubit>().searchGSTRepository(gstNumber);
  }
}

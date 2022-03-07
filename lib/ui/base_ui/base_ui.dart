import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gst_app/service/exception_helper.dart';
import 'package:gst_app/utility/common/bloc_state.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:loader_overlay/src/overlay_controller_widget_extension.dart';

class BaseUI<T extends StateStreamable<S>, S extends ApiState>
    extends StatefulWidget {
  final Widget child;
  final Function onDataLoaded;

  const BaseUI({required this.child, required this.onDataLoaded, Key? key})
      : super(key: key);

  @override
  _BaseUIState createState() => _BaseUIState<T, S>();
}

class _BaseUIState<T extends StateStreamable<S>, S extends ApiState>
    extends State<BaseUI> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<T, S>(
      listener: (context, state) {
        if (state.status == Status.loading) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }
        if (state.status == Status.completed) {
          widget.onDataLoaded(state.data);
        }
        if (state.status == Status.error) {
          Fluttertoast.showToast(
              msg: state.error?.displayMessage ?? kErrorMessageGenericError);
        }
      },
      builder: (context, state) {
        return LoaderOverlay(child: widget.child);
      },
    );
  }
}

import 'package:gst_app/domain/model/gst/gst_detail.dart';
import 'package:gst_app/utility/common/bloc_state.dart';

abstract class GSTSearchCubitState extends ApiState {
  GSTSearchCubitState.completed(data) : super.completed(data);

  GSTSearchCubitState.loading(data) : super.loading(data);

  GSTSearchCubitState.error(data) : super.error(data);

  GSTSearchCubitState.initial() : super.initial();
}

class LoadGSTSearchState extends GSTSearchCubitState {
  GSTDetail? gstDetail;

  LoadGSTSearchState.completed(gstDetail) : super.completed(gstDetail);

  LoadGSTSearchState.loading(data) : super.loading(data);

  LoadGSTSearchState.error(data) : super.error(data);

  LoadGSTSearchState.initial() : super.initial();
}

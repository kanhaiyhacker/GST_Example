import 'package:gst_app/domain/model/gst/gst_detail.dart';
import 'package:gst_app/utility/common/bloc_state.dart';

abstract class GSTDetailCubitState extends ApiState {
  GSTDetailCubitState.completed(data) : super.completed(data);

  GSTDetailCubitState.loading(data) : super.loading(data);

  GSTDetailCubitState.error(data) : super.error(data);

  GSTDetailCubitState.initial() : super.initial();
}

class LoadGSTDetailState extends GSTDetailCubitState {
  GSTDetail? gstDetail;

  LoadGSTDetailState.completed(gstDetail) : super.completed(gstDetail);

  LoadGSTDetailState.loading(data) : super.loading(data);

  LoadGSTDetailState.error(data) : super.error(data);

  LoadGSTDetailState.initial() : super.initial();
}

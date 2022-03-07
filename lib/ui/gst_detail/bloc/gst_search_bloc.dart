import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gst_app/data/error/app_error.dart';
import 'package:gst_app/domain/respository/gst_repository/gst_repository.dart';

import 'gst_search_bloc_state.dart';

class GSTSearchDetailCubit extends Cubit<GSTDetailCubitState> {
  String searchType = "";

  GSTSearchDetailCubit(GSTDetailCubitState initialState) : super(initialState);

  GSTRepository repository = GSTRepository();

  void searchGSTRepository(String gst) async {
    emit(LoadGSTDetailState.loading(''));
    print("gst is empty ${gst.isNotEmpty} $gst");
    if (gst.isEmpty) {
      emit(LoadGSTDetailState.error(
          AppError.defaultError(displayMessage: "Please enter GST Number")));
      return;
    }
    try {
      final response = await repository.getMockGSTDetail(gst);
      if (response.getData != null) {
        emit(LoadGSTDetailState.completed(response.getData));
      } else {
        emit(LoadGSTDetailState.error(AppError.defaultError()));
      }
    } catch (e) {
      print(e);
      emit(LoadGSTDetailState.error(AppError.defaultError()));
    }
  }

  void setSearchType(String value) {
    searchType = value;
  }
}

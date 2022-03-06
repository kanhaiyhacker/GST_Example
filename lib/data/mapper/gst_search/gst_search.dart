import 'package:gst_app/data/model/gst_detail/gst_detail_response.dart';
import 'package:gst_app/domain/model/gst/gst_detail.dart';

GSTDetail mapGSTDetail(GSTDetailResponse detailResponse) {
  var detail = GSTDetail()
    ..name = detailResponse.name
    ..status = detailResponse.status
    ..additionalPlace = detailResponse.additionalPlace
    ..address = detailResponse.address
    ..centralJurisdiction = detailResponse.centralJurisdiction
    ..stateJurisdiction = detailResponse.stateJurisdiction
    ..taxPayerType = detailResponse.taxPayerType
    ..registrationDate = detailResponse.registrationDate
    ..gstNumber = detailResponse.gstNumber
    ..businessType = detailResponse.businessType;

  return detail;
}

import 'package:json_annotation/json_annotation.dart';

// part 'generate_gst_detail_response.g.dart';
part 'gst_detail_response.g.dart';

@JsonSerializable()
class GSTDetailResponse {
  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "address")
  String? address;

  @JsonKey(name: "additionalPlace")
  String? additionalPlace;

  @JsonKey(name: "taxPayerType")
  String? taxPayerType;

  @JsonKey(name: "businessType")
  String? businessType;

  @JsonKey(name: "registrationDate")
  String? registrationDate;

  @JsonKey(name: "stateJurisdiction")
  String? stateJurisdiction;

  @JsonKey(name: "centralJurisdiction")
  String? centralJurisdiction;

  @JsonKey(name: "gstNumber")
  String? gstNumber;

  GSTDetailResponse(
      this.name,
      this.status,
      this.address,
      this.additionalPlace,
      this.taxPayerType,
      this.businessType,
      this.registrationDate,
      this.stateJurisdiction,
      this.gstNumber,
      this.centralJurisdiction);

  factory GSTDetailResponse.fromJson(Map<String,dynamic> srcJson) => _$GSTDetailResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GSTDetailResponseToJson(this);


}

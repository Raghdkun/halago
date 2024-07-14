class CountryModel {
  int? countrycodesId;
  String? countrycodesName;
  String? countrycodesIso;
  String? countrycodesCode;
  String? countrycodesFlag;
  int? countrycodesActive;

  CountryModel(
      {this.countrycodesId,
      this.countrycodesName,
      this.countrycodesIso,
      this.countrycodesCode,
      this.countrycodesFlag,
      this.countrycodesActive});

  CountryModel.fromJson(Map<String, dynamic> json) {
    countrycodesId = json['countrycodes_id'];
    countrycodesName = json['countrycodes_name'];
    countrycodesIso = json['countrycodes_iso'];
    countrycodesCode = json['countrycodes_code'];
    countrycodesFlag = json['countrycodes_flag'];
    countrycodesActive = json['countrycodes_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['countrycodes_id'] = this.countrycodesId;
    data['countrycodes_name'] = this.countrycodesName;
    data['countrycodes_iso'] = this.countrycodesIso;
    data['countrycodes_code'] = this.countrycodesCode;
    data['countrycodes_flag'] = this.countrycodesFlag;
    data['countrycodes_active'] = this.countrycodesActive;
    return data;
  }
}

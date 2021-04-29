import 'package:dio/dio.dart';
import 'package:jivandaan/Model/servicesModel.dart';

class APIServices {
  final Dio dio = Dio();
  Future<List<Hospital>> getBeds() async {
    Response res = await dio.get(
        "https://life-api.coronasafe.network/data/hospital_clinic_centre.json");
    final List<Hospital> hospitalList = [];
    for (var i in res.data['data']) {
      print(i);
      try {
        hospitalList.add(Hospital(
            i['availability'] ?? "None",
            i['comment'] ?? "None",
            DateTime.parse(i['createdTime']).toLocal(),
            i['district'] ?? "None",
            i['email1'] ?? "None",
            i['phone1'] ?? 0,
            DateTime.parse(i['lastVerifiedOn']).toLocal(),
            i['name'] ?? "None",
            i['state'] ?? "None",
            i['pointOfContact'] ?? "None",
            i['verificationStatus'] ?? "None",
            i['verifiedBy'] ?? "None",
            i['totalBedsAvailable'].toString() ?? "No information"));
      } catch (e) {}
    }
    return hospitalList;
  }
}

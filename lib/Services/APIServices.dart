import 'dart:convert';

import 'package:dio/dio.dart';

class APIServices {
  getBeds(String type, String state) async {
    print(
      {
        "state": state,
        "requirement": type,
      },
    );
    print("hello");
    Response res = await Dio().post(
      "https://Twitter.devilunknown.repl.co",
      data: {
        "state": state,
        "requirement": type,
      },
    );
    // print(res.data);
    print((json.decode(res.data))['data'].length);
    return (json.decode(res.data))['data'];
  }

  getTotalCases() async {
    Response res = await Dio().get(
      "https://Twitter.devilunknown.repl.co/stats",
    );
    return res.data;
  }

  getRecordByCity(String type, String state, String city) async {
    Response res = await Dio().post(
      "https://Twitter.devilunknown.repl.co/$city",
      data: {
        "state": state,
        "requirement": type,
      },
    );
    print((json.decode(res.data))['data'].length);
    return (json.decode(res.data))['data'];
  }
}

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
}

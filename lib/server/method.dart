import 'package:dio/dio.dart';

import '../config/myserver.dart';

class apiMenthod {
  var _dio = Dio();

  Future<Response> getapilistdata({required String url, String? token}) async {
    Response response;

    String finalurl = '${Server.mainapi}$url?token=$token';
    print(finalurl);
    try {
      response = await _dio.get(finalurl);

      return response;
    } on DioError catch (e) {
      print(e);
      throw "Error Coming From $finalurl";
    }
  }

  Future<Response> postMethod(
      {required String url,
      String? token,
      required Map<String, dynamic> data}) async {
    Response response;
    var formData = FormData.fromMap(data);

    String finalurl = '';

    if (token!.toString() != '0') {
      finalurl = '${Server.mainapi}/${url}?token=$token';
    } else {
      finalurl = '${Server.mainapi}/${url}';
    }

    try {
      response = await Dio().post(finalurl, data: formData);
      print(response);
      return response;
    } on DioError catch (e) {
      print(e);

      //data.add(e);
      throw "Error Coming From Post Request $finalurl";
    }
  }
}

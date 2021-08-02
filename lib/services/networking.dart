import 'package:http/http.dart';
import 'dart:convert';

class Networkdata {
  Networkdata(this.url);

  final String url;

  Future getdata() async {
    Response response = await get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else
      print(response.statusCode);
  }
}

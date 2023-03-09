import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:kofuko_test/name_model.dart';

String count = "0";
Future<NameData?> getData() async {
  try {
    var url = "https://randomuser.me/api/?results=$count";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log(response.body);
      NameData data = NameData.fromJson(jsonDecode(response.body));

      return data;
    } else {
      return null;
    }
  } catch (e) {
    log(e.toString());
  }
}

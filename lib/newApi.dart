import 'package:http/http.dart' as http;
import 'dart:convert';
import 'personModel.dart';

String baseURL = "http://kangmeas.itc.edu.kh/api/categories/show/3";

getNews() async {
  try {
    final response = await http.get(baseURL);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('Load data success.');
      final responseData = json.decode(response.body);
      List<New> allNew = List<New>();
      for (final newData in responseData['data']['news']) {
        final aData = New.fromJson(newData);
        allNew.add(aData);
      }
      print("Length of data : ${allNew.length}");
      return allNew;
    } else {
      print('Load order error. ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print(e);
  }
}
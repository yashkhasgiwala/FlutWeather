import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  String city;
  Network(this.city);
  Future getData() async {
    http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=f54353ee1a6347ceb1af3a8ba5c584f5&units=metric');
    if (response.statusCode == 200) {
      print(response.statusCode);
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class dataFetcher {
  dataFetcher(this.url);
  final String url;
  //url is the api that is to be given (api to be used of openweather).
  Future getData() async {
    print("fetching data");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      //Rituparna Singha
      String data = response.body;
      Map<String, dynamic> test = convert.jsonDecode(data);
      return test;
      //return convert.jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}

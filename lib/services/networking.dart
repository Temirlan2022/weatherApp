// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class NetworkHelper {
//   NetworkHelper(this.url);
//   final String url;

//   Future getData() async {
//     http.Response response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       String body = response.body;
//       return jsonDecode(body);
//     } else {
//       print(response.statusCode);
      
//     }
//   }
// }

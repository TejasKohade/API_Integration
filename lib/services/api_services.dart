import 'package:api_integration/models/products_model.dart';
import 'package:http/http.dart' as http;

var base = "https://dummyjson.com";

getPosts() async {
  Uri url = Uri.parse("$base/products");
  var res = await http.get(url);
  try {
    if (res.statusCode == 200) {
      var data = productsFromJson(res.body);
      return data.products;
    } else {
      print("Error");
    }
  } catch (e) {
    print(e.toString());
  }
}

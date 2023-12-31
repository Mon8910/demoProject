import 'package:demo_project/constants/api_endpoints.dart';
import 'package:demo_project/constants/constantvar.dart';
import 'package:http/http.dart' as http;

class ProductsServices {
  Future<http.Response> products(int productId) async {
    final response = await http
        .get(Uri.parse('${Einveromevt.baseurl}${Appurl.productOccasionType}$productId'));
    return response;
  }
}
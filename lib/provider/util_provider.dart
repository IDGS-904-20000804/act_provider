import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';

class UtilProvider extends ChangeNotifier {
  static final UtilProvider rtp = UtilProvider._();
  UtilProvider._();

  static Future responseHTTP({required String urlBase}) async {
    var response = await http.get(Uri.parse(urlBase));
    return response;
  }
}

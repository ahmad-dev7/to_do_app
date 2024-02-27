import 'dart:convert';

import 'package:http/http.dart' as http;

late String quote;

class QuoteServices {
  static fetchQuote() async {
    try {
      String url = 'https://api.adviceslip.com/advice';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        quote = data['slip']['advice'];
      } else {
        quote =
            'Success is not final, failure is not fatal: It is the courage to continue that counts';
      }
    } catch (e) {
      quote = 'Earn enough so that you never ran out of mobile network';
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;

class ImageServices {
  static Future<String> fetchImageUrl() async {
    late String imagePath;
    String clintID = 'dJMnHcvNfVrCcwcunB-dFlsHPjNQzCy8lc3p3fRsxg8';
    try {
      var response = await http.get(
        Uri.parse(
          'https://api.unsplash.com/photos/random?client_id=$clintID&query=motivational&fm=jpg',
        ),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        imagePath = '${data['urls']['regular']}';
        return imagePath;
      } else {
        imagePath = 'asset://images/motivational_image.jpg';
        return imagePath;
      }
    } catch (e) {
      imagePath = 'asset://images/motivational_image.jpg';
      return imagePath;
    }
  }
}

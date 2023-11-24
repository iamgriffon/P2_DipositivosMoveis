import 'dart:convert';
import 'dart:html';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<List<String>> getCats() async {
  const apiUrl = 'https://api.thecatapi.com/v1/images/search?limit=5';
  final response = await http.get(Uri.parse(apiUrl), headers: {
    'x-api-key':
        'live_48bwIpF0LXL8DhrEjpNN94qotGTOOLjE3qvk1QfnYYX0ZBMj7sM46fI6SfwuEdNb',
    'Access-Control-Allow-Origin': '*'
  });

  if (response.statusCode == 200) {
    try {
      List<dynamic> images = jsonDecode(response.body);
      List<String> imageUrls =
          images.map((img) => img['url'].toString()).toList();

      print('API Response: ${imageUrls}');
      return imageUrls;
    } catch (e) {
      print('Error decoding JSON: $e');
      throw Exception('Failed to decode JSON');
    }
  } else {
    print('API Error: ${response.statusCode}');
    throw Exception('Failed to load images');
  }
}

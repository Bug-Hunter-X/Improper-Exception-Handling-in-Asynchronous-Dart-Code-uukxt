```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      final errorMessage = 'Failed to load data: ${response.statusCode} - ${response.reasonPhrase}';
      print('Error fetching data: $errorMessage');
      throw Exception(errorMessage);
    }
  } on SocketException catch (e) {
    final errorMessage = 'Network error: $e';
    print('Error fetching data: $errorMessage');
    throw Exception(errorMessage);
  } on FormatException catch (e) {
    final errorMessage = 'Invalid JSON format: $e';
    print('Error fetching data: $errorMessage');
    throw Exception(errorMessage);
  } catch (e) {
    final errorMessage = 'An unexpected error occurred: $e';
    print('Error fetching data: $errorMessage');
    throw Exception(errorMessage);
  }
}
```
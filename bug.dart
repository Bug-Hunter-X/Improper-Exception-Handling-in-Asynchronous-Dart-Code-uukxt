```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Handle the successful response
      final jsonData = jsonDecode(response.body);
      // Process jsonData
    } else {
      // Handle error response
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions during API call
    print('Error fetching data: $e');
    // Re-throw the exception to be handled higher up the call stack
    rethrow;
  }
}
```
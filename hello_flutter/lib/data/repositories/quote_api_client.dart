// Encoder/Decoder for converting between different data representations, including JSON and UTF-8.
import 'dart:convert';

// defines annotations that can be used by the tools that are shipped with the Dart SDK.
import 'package:meta/meta.dart';

// composable, Future-based library for making HTTP requests.
import 'package:http/http.dart' as http;

// our barrel for all models
import '../models/models.dart';

class QuoteApiClient {
  final _baseUrl = 'https://quote-garden.herokuapp.com';
  final http.Client httpClient = http.Client();

  Future<Quote> fetchQuote() async {
    final url = '$_baseUrl/quotes/random';
    print('Calling HTTP URL - $url');
    try {
      final response = await this.httpClient.get(url);
      print('HTTP response statusCode - ${response.statusCode}');

      if (response.statusCode != 200) {
        throw new Exception('error getting quotes');
      }
      final json = jsonDecode(response.body);
      return Quote.fromJson(json);
    } catch (e) {
      print(e);
    }
    return Quote();
  }
}

import 'dart:async';

import 'package:meta/meta.dart';

import './quote_api_client.dart';

// our barrel for all models
import '../models/models.dart';

class QuoteRepository {

  final QuoteApiClient quoteApiClient = QuoteApiClient();

  Future<Quote> fetchQuote() async {
    return await quoteApiClient.fetchQuote();
  }
}

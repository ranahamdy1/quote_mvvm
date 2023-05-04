import '../../models/quote_model.dart';

abstract class QuotesRepository {
  Future<QuotesModel> getAllQuotes();
}

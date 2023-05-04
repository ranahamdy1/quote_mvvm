import 'package:quote_mvvm/models/quote_model.dart';
import 'package:quote_mvvm/repositorys/quotes/quotes_repository.dart';

class QuotesLocal extends QuotesRepository {
  @override
  Future<QuotesModel> getAllQuotes() {
    throw UnimplementedError();
  }
}

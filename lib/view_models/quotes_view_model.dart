import 'package:quote_mvvm/view_models/quote_view_model.dart';
import '../repositorys/quotes/quotes_repository.dart';

class QuotesViewModel {
  QuotesRepository? quotesRepository;
  QuotesViewModel({this.quotesRepository});

  Future<QuoteViewModel> fetchAllQuotes() async {
    final response = await quotesRepository!.getAllQuotes();
    return QuoteViewModel(quoteModel: response);
  }
}

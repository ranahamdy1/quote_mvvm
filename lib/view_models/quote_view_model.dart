import '../models/quote_model.dart';

class QuoteViewModel {
  QuotesModel? quoteModel;
  QuoteViewModel({this.quoteModel});

  get content => quoteModel?.content;

  get tags => quoteModel?.tags;

  get author => quoteModel?.author;
}

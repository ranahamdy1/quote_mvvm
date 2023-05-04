import 'package:dio/dio.dart';
import 'package:quote_mvvm/repositorys/quotes/quotes_repository.dart';
import '../../constants/api_constants.dart';
import '../../models/quote_model.dart';

class QuotesApi extends QuotesRepository {
  @override
  Future<QuotesModel> getAllQuotes() async {
    final dio = Dio();

    QuotesModel quotes;
    try {
      final response = await dio.get(ApiConstants.baseUrl);
      print(response.data);
      quotes = response.data;
    } on DioError catch (error) {
      throw _handleError(error);
    } catch (e) {
      rethrow;
    }
    return quotes;
  }

  Exception _handleError(DioError error) {
    String errorMessage = "";
    switch (error.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        errorMessage = "timeOut";
        break;
      case DioErrorType.badResponse:
        errorMessage =
            "Bad Response ${error.response?.statusCode} ${error.response?.statusMessage}";
        break;
      default:
        errorMessage = "network message";
    }
    return Exception(errorMessage);
  }
}

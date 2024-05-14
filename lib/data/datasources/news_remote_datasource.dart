import 'package:dartz/dartz.dart';
import 'package:news_apps/common/global_data.dart';
import 'package:news_apps/data/models/responses/get_all_news_responses_model.dart';
import 'package:http/http.dart' as http;

class NewsRemoteDatasource {
  Future<Either<String, GetAllNewsResponseModel>> getAllNews() async {
    final response = await http.get(Uri.parse(urlBase));

    if (response.statusCode == 200) {
      return Right(GetAllNewsResponseModel.fromJson(response.body));
    } else {
      return Left(response.statusCode.toString());
    }
  }
}

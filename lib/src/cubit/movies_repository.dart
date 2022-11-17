import 'package:proform3/src/helpers/api_helper.dart';
import 'package:proform3/src/models/api_response_model.dart';
import 'package:proform3/src/web_service/api_routes.dart';

class MoviesRepository {
 Future<ApiResponseModel> getAllMovies() async {
    ApiResponseModel response =
        await ApiHelper().makeGetRequest(ApiRoutes.shows);
    return response;
  }
}

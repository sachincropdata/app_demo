import 'package:my_cropdata_test/model/assignment_response_model.dart';
import 'package:my_cropdata_test/service/network_api_service.dart';
import 'package:my_cropdata_test/utility/constant.dart';

class ApiRepository {
  final baseApiService = NetworkApiService();

  Future<AssignmentResponseModel> callDataApi() async {
    dynamic response = await baseApiService.getGetApiResponse(
        url: BASE_URL + BASE_URL_SUFFIX + API_END_POINT);

    AssignmentResponseModel farmListModelResponse =
        AssignmentResponseModel.fromJson(response);
    print("Api Response --> $response");
    return farmListModelResponse;
  }

  // Post request
  Future<AssignmentResponseModel> postDataApi(
      String latitude, String longitude) async {
    dynamic response =
        await baseApiService.getPostApiResponse(endPoint: API_END_POINT, data: {
      "KEY_LATITUDE": latitude,
      "KEY_LONGITUDE": longitude,
    });

    AssignmentResponseModel farmListModelResponse =
        AssignmentResponseModel.fromJson(response);
    print("Api Response --> $response");
    return farmListModelResponse;
  }

  // Add query parameter
  Future<AssignmentResponseModel> callApiToGetWarehouses(
    String searchTerm,
  ) async {
    final response = await baseApiService.getGetApiResponse(
        url: BASE_URL + BASE_URL_SUFFIX + API_END_POINT,
        queryParameters: {'s': searchTerm});

    return AssignmentResponseModel.fromJson(response);
  }
}

import 'package:dio/dio.dart';
import 'package:generat_app/model/error_model.dart';
import 'package:generat_app/model/higth_model.dart';
import 'package:generat_app/model/list_type_model.dart';
import 'package:generat_app/service/service.dart';

class GenericService<T> extends Service {
  
  Future<HightModel> getData({
    required String baseUrl,
    required HightModel modelFromMap,
    String quereyParam = "",
    String? token,
  }) async {
    try {
      if (token == null) {
        response = await dio.get(baseUrl + quereyParam);
      } else {
        response = await dio.get(baseUrl + quereyParam,
            options: Options(headers: {"Authorization": "Bearer $token"}));
      }

      if (response.statusCode == 200) {
        if (response.requestOptions.responseType.runtimeType is List) {
          List<HightModel> result = List.generate(
            response.data.length,
            (index) => modelFromMap.fromMap(response.data), //* => HightModel.fromMap(response.data)*/
          );
          ListTypeModel model = ListTypeModel(model: result);
          return model;
        } else {
          HightModel model =
              modelFromMap.fromMap(response.data); //* => HightModel.fromMap(response.data)*/
          return model;
        }
      } else {
        return ErrorModel(Message: response.statusMessage!);
      }
    } catch (e) {
      return ErrorModel(Message: e.toString());
    }
  }

  sendData({
    required String baseUrl,
    required HightModel model,
    String? token,
  }) async {
    try {
      if (token == null) {
        response = await dio.post(baseUrl, data: model.toJson());
      } else {
        response = await dio.post(
          baseUrl,
          data: model.toJson(),
          options: Options(headers: {"Authorization": "Bearer $token"}),
        );
      }

      if (response.statusCode == 200) {
        print("success");
      } else {
        return ErrorModel(Message: response.statusMessage!);
      }
    } catch (e) {
      return ErrorModel(Message: e.toString());
    }
  }

}

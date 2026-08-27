import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:posts/models/general_response.dart';

//MARK: - networking service class to handle API requests
enum HttpMethod { get, post, put, delete }

class NetworkingService {
final Dio _dio;

  // Provide a base URL or set up interceptors here
  NetworkingService({String baseUrl = "https://dummyjson.com/"})
      : _dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ));


  Future<GeneralResponse<T>> request<T>({
    required String path,
    required HttpMethod method,
    dynamic body, 
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic) fromJsonT, 
  }) async {
    try {
      Response response;

      // Execute request based on HttpMethod
      switch (method) {
        case HttpMethod.get:
          response = await _dio.get(path, queryParameters: queryParameters);
          break;
        case HttpMethod.post:
          response = await _dio.post(path, data: body, queryParameters: queryParameters);
          break;
        case HttpMethod.put:
          response = await _dio.put(path, data: body, queryParameters: queryParameters);
          break;
        case HttpMethod.delete:
          response = await _dio.delete(path, data: body, queryParameters: queryParameters);
          break;
      }

      // If the response is successful, parse it into the GeneralResponse wrapper
      if (response.data != null) {
        log('Response data: ${response.data}'); // Log the response data for debugging
        return GeneralResponse<T>(data: fromJsonT(response.data));
      } else {
        return GeneralResponse<T>(data: fromJsonT(null));
      }
    } on DioException catch (e) {
      // Safely catch network/Dio errors
         log('Response failure data: ${e.response?.data.toString()}');
      return GeneralResponse<T>(
        data: fromJsonT(null),
      );
    } catch (e) {
      // Safely catch unexpected parsing errors
      return GeneralResponse<T>(data: fromJsonT(null));
    }
  }
}
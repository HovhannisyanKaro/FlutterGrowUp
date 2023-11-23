import 'dart:js_interop';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'package:http/http.dart' as http;
part 'api_service.g.dart';

@RestApi(baseUrl: 'https://cmsbetconstruct.com')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  
  @GET('/casino/getGames?partner_id=1&lang=eng&is_mobile=1&use_webp=1&country=AM&limit=4')
  Future<Object?> getGames();

  //http.Response
}


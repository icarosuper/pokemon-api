import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:litedex/model/pokemon.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    debugPrint('REQUEST');
    debugPrint('URL: ${data.url}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    debugPrint('\nRESPONSE');
    debugPrint('STATUS CODE: ${data.statusCode}');
    debugPrint('HEADERS: ${data.headers}');
    debugPrint('BODY: ${data.body}');

    return data;
  }
}

Future<Pokemon?> getPokemonByName(String pokemonName) async {
  try {
    Client client = InterceptedClient.build(
      interceptors: [LoggingInterceptor()],
      requestTimeout: const Duration(seconds: 5),
    );

    final Response response = await client
        .get(Uri.parse("https://pokeapi.co/api/v2/pokemon/$pokemonName/"));

    if (response.statusCode != 200) return null;

    return Pokemon.fromJson(jsonDecode(response.body));
  } catch (error) {
    return null;
  }
}

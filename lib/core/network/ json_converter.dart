import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:drone_assist/feature/auth/data/contract/sign_in_response.dart';
import 'package:drone_assist/feature/auth/data/contract/sign_up_response.dart';

final converters = {
  SignUpResponse: (json) => SignUpResponse.fromJson(json),
  SignInResponse: (json) => SignInResponse.fromJson(json),
};

class ModelJsonConverter implements Converter {
  @override
  Request convertRequest(Request request) {
    final req = applyHeader(
      request,
      contentTypeKey,
      jsonHeaders,
      override: false,
    );

    return encodeJson(req);
  }

  Request encodeJson(Request request) {
    var contentType = request.headers[contentTypeKey];
    if (contentType != null && contentType.contains(jsonHeaders)) {
      return request.copyWith(body: json.encode(request.body));
    }
    return request;
  }

  Response<BodyType> decodeJson<BodyType, InnerType>(Response response) {
    var contentType = response.headers[contentTypeKey];
    var body = response.body;
    if (contentType != null && contentType.contains(jsonHeaders)) {
      body = utf8.decode(response.bodyBytes);
    }
    try {
      var mapData = json.decode(body);
      final converter = converters[BodyType];

      if (converter == null) {
        throw UnsupportedError(
            'There is no converter to such Body Type: $BodyType. Did you forgot to add this type to converters?');
      }

      final object = converter(mapData) as BodyType;

      return response.copyWith<BodyType>(body: object);
    } catch (e) {
      chopperLogger.warning(e);
      return response.copyWith<BodyType>(body: body);
    }
  }

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    return decodeJson<BodyType, InnerType>(response);
  }
}

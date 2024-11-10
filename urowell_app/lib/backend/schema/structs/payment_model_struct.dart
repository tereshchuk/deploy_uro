// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentModelStruct extends BaseStruct {
  PaymentModelStruct({
    String? url,
  }) : _url = url;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  static PaymentModelStruct fromMap(Map<String, dynamic> data) =>
      PaymentModelStruct(
        url: data['url'] as String?,
      );

  static PaymentModelStruct? maybeFromMap(dynamic data) => data is Map
      ? PaymentModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'url': _url,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
      }.withoutNulls;

  static PaymentModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      PaymentModelStruct(
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PaymentModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PaymentModelStruct && url == other.url;
  }

  @override
  int get hashCode => const ListEquality().hash([url]);
}

PaymentModelStruct createPaymentModelStruct({
  String? url,
}) =>
    PaymentModelStruct(
      url: url,
    );

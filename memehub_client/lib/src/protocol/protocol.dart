/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'ai_analysis_result.dart' as _i2;
import 'collection.dart' as _i3;
import 'collection_meme.dart' as _i4;
import 'greetings/greeting.dart' as _i5;
import 'meme.dart' as _i6;
import 'meme_process_request.dart' as _i7;
import 'meme_status.dart' as _i8;
import 'meme_usage.dart' as _i9;
import 'trending_update.dart' as _i10;
import 'upload_description.dart' as _i11;
import 'package:memehub_client/src/protocol/collection.dart' as _i12;
import 'package:memehub_client/src/protocol/meme.dart' as _i13;
import 'package:memehub_client/src/protocol/trending_update.dart' as _i14;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i15;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i16;
export 'ai_analysis_result.dart';
export 'collection.dart';
export 'collection_meme.dart';
export 'greetings/greeting.dart';
export 'meme.dart';
export 'meme_process_request.dart';
export 'meme_status.dart';
export 'meme_usage.dart';
export 'trending_update.dart';
export 'upload_description.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.AiAnalysisResult) {
      return _i2.AiAnalysisResult.fromJson(data) as T;
    }
    if (t == _i3.Collection) {
      return _i3.Collection.fromJson(data) as T;
    }
    if (t == _i4.CollectionMeme) {
      return _i4.CollectionMeme.fromJson(data) as T;
    }
    if (t == _i5.Greeting) {
      return _i5.Greeting.fromJson(data) as T;
    }
    if (t == _i6.Meme) {
      return _i6.Meme.fromJson(data) as T;
    }
    if (t == _i7.MemeProcessRequest) {
      return _i7.MemeProcessRequest.fromJson(data) as T;
    }
    if (t == _i8.MemeStatus) {
      return _i8.MemeStatus.fromJson(data) as T;
    }
    if (t == _i9.MemeUsage) {
      return _i9.MemeUsage.fromJson(data) as T;
    }
    if (t == _i10.TrendingUpdate) {
      return _i10.TrendingUpdate.fromJson(data) as T;
    }
    if (t == _i11.UploadDescription) {
      return _i11.UploadDescription.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.AiAnalysisResult?>()) {
      return (data != null ? _i2.AiAnalysisResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Collection?>()) {
      return (data != null ? _i3.Collection.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.CollectionMeme?>()) {
      return (data != null ? _i4.CollectionMeme.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Greeting?>()) {
      return (data != null ? _i5.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Meme?>()) {
      return (data != null ? _i6.Meme.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.MemeProcessRequest?>()) {
      return (data != null ? _i7.MemeProcessRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.MemeStatus?>()) {
      return (data != null ? _i8.MemeStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.MemeUsage?>()) {
      return (data != null ? _i9.MemeUsage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.TrendingUpdate?>()) {
      return (data != null ? _i10.TrendingUpdate.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.UploadDescription?>()) {
      return (data != null ? _i11.UploadDescription.fromJson(data) : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<String>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i12.Collection>) {
      return (data as List).map((e) => deserialize<_i12.Collection>(e)).toList()
          as T;
    }
    if (t == List<_i13.Meme>) {
      return (data as List).map((e) => deserialize<_i13.Meme>(e)).toList() as T;
    }
    if (t == List<_i14.TrendingUpdate>) {
      return (data as List)
              .map((e) => deserialize<_i14.TrendingUpdate>(e))
              .toList()
          as T;
    }
    try {
      return _i15.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i16.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.AiAnalysisResult => 'AiAnalysisResult',
      _i3.Collection => 'Collection',
      _i4.CollectionMeme => 'CollectionMeme',
      _i5.Greeting => 'Greeting',
      _i6.Meme => 'Meme',
      _i7.MemeProcessRequest => 'MemeProcessRequest',
      _i8.MemeStatus => 'MemeStatus',
      _i9.MemeUsage => 'MemeUsage',
      _i10.TrendingUpdate => 'TrendingUpdate',
      _i11.UploadDescription => 'UploadDescription',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('memehub.', '');
    }

    switch (data) {
      case _i2.AiAnalysisResult():
        return 'AiAnalysisResult';
      case _i3.Collection():
        return 'Collection';
      case _i4.CollectionMeme():
        return 'CollectionMeme';
      case _i5.Greeting():
        return 'Greeting';
      case _i6.Meme():
        return 'Meme';
      case _i7.MemeProcessRequest():
        return 'MemeProcessRequest';
      case _i8.MemeStatus():
        return 'MemeStatus';
      case _i9.MemeUsage():
        return 'MemeUsage';
      case _i10.TrendingUpdate():
        return 'TrendingUpdate';
      case _i11.UploadDescription():
        return 'UploadDescription';
    }
    className = _i15.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i16.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'AiAnalysisResult') {
      return deserialize<_i2.AiAnalysisResult>(data['data']);
    }
    if (dataClassName == 'Collection') {
      return deserialize<_i3.Collection>(data['data']);
    }
    if (dataClassName == 'CollectionMeme') {
      return deserialize<_i4.CollectionMeme>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i5.Greeting>(data['data']);
    }
    if (dataClassName == 'Meme') {
      return deserialize<_i6.Meme>(data['data']);
    }
    if (dataClassName == 'MemeProcessRequest') {
      return deserialize<_i7.MemeProcessRequest>(data['data']);
    }
    if (dataClassName == 'MemeStatus') {
      return deserialize<_i8.MemeStatus>(data['data']);
    }
    if (dataClassName == 'MemeUsage') {
      return deserialize<_i9.MemeUsage>(data['data']);
    }
    if (dataClassName == 'TrendingUpdate') {
      return deserialize<_i10.TrendingUpdate>(data['data']);
    }
    if (dataClassName == 'UploadDescription') {
      return deserialize<_i11.UploadDescription>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i15.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i16.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}

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
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i1;
import 'package:serverpod_client/serverpod_client.dart' as _i2;
import 'dart:async' as _i3;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i4;
import 'package:memehub_client/src/protocol/collection.dart' as _i5;
import 'package:memehub_client/src/protocol/meme.dart' as _i6;
import 'package:memehub_client/src/protocol/upload_description.dart' as _i7;
import 'package:memehub_client/src/protocol/trending_update.dart' as _i8;
import 'package:memehub_client/src/protocol/greetings/greeting.dart' as _i9;
import 'protocol.dart' as _i10;

/// By extending [EmailIdpBaseEndpoint], the email identity provider endpoints
/// are made available on the server and enable the corresponding sign-in widget
/// on the client.
/// {@category Endpoint}
class EndpointEmailIdp extends _i1.EndpointEmailIdpBase {
  EndpointEmailIdp(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'emailIdp';

  /// Logs in the user and returns a new session.
  ///
  /// Throws an [EmailAccountLoginException] in case of errors, with reason:
  /// - [EmailAccountLoginExceptionReason.invalidCredentials] if the email or
  ///   password is incorrect.
  /// - [EmailAccountLoginExceptionReason.tooManyAttempts] if there have been
  ///   too many failed login attempts.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _i3.Future<_i4.AuthSuccess> login({
    required String email,
    required String password,
  }) => caller.callServerEndpoint<_i4.AuthSuccess>(
    'emailIdp',
    'login',
    {
      'email': email,
      'password': password,
    },
  );

  /// Starts the registration for a new user account with an email-based login
  /// associated to it.
  ///
  /// Upon successful completion of this method, an email will have been
  /// sent to [email] with a verification link, which the user must open to
  /// complete the registration.
  ///
  /// Always returns a account request ID, which can be used to complete the
  /// registration. If the email is already registered, the returned ID will not
  /// be valid.
  @override
  _i3.Future<_i2.UuidValue> startRegistration({required String email}) =>
      caller.callServerEndpoint<_i2.UuidValue>(
        'emailIdp',
        'startRegistration',
        {'email': email},
      );

  /// Verifies an account request code and returns a token
  /// that can be used to complete the account creation.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if no request exists
  ///   for the given [accountRequestId] or [verificationCode] is invalid.
  @override
  _i3.Future<String> verifyRegistrationCode({
    required _i2.UuidValue accountRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyRegistrationCode',
    {
      'accountRequestId': accountRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a new account registration, creating a new auth user with a
  /// profile and attaching the given email account to it.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if the [registrationToken]
  ///   is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  ///
  /// Returns a session for the newly created user.
  @override
  _i3.Future<_i4.AuthSuccess> finishRegistration({
    required String registrationToken,
    required String password,
  }) => caller.callServerEndpoint<_i4.AuthSuccess>(
    'emailIdp',
    'finishRegistration',
    {
      'registrationToken': registrationToken,
      'password': password,
    },
  );

  /// Requests a password reset for [email].
  ///
  /// If the email address is registered, an email with reset instructions will
  /// be send out. If the email is unknown, this method will have no effect.
  ///
  /// Always returns a password reset request ID, which can be used to complete
  /// the reset. If the email is not registered, the returned ID will not be
  /// valid.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to request a password reset.
  ///
  @override
  _i3.Future<_i2.UuidValue> startPasswordReset({required String email}) =>
      caller.callServerEndpoint<_i2.UuidValue>(
        'emailIdp',
        'startPasswordReset',
        {'email': email},
      );

  /// Verifies a password reset code and returns a finishPasswordResetToken
  /// that can be used to finish the password reset.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to verify the password reset.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// If multiple steps are required to complete the password reset, this endpoint
  /// should be overridden to return credentials for the next step instead
  /// of the credentials for setting the password.
  @override
  _i3.Future<String> verifyPasswordResetCode({
    required _i2.UuidValue passwordResetRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyPasswordResetCode',
    {
      'passwordResetRequestId': passwordResetRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a password reset request by setting a new password.
  ///
  /// The [verificationCode] returned from [verifyPasswordResetCode] is used to
  /// validate the password reset request.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.policyViolation] if the new
  ///   password does not comply with the password policy.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _i3.Future<void> finishPasswordReset({
    required String finishPasswordResetToken,
    required String newPassword,
  }) => caller.callServerEndpoint<void>(
    'emailIdp',
    'finishPasswordReset',
    {
      'finishPasswordResetToken': finishPasswordResetToken,
      'newPassword': newPassword,
    },
  );
}

/// By extending [RefreshJwtTokensEndpoint], the JWT token refresh endpoint
/// is made available on the server and enables automatic token refresh on the client.
/// {@category Endpoint}
class EndpointJwtRefresh extends _i4.EndpointRefreshJwtTokens {
  EndpointJwtRefresh(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'jwtRefresh';

  /// Creates a new token pair for the given [refreshToken].
  ///
  /// Can throw the following exceptions:
  /// -[RefreshTokenMalformedException]: refresh token is malformed and could
  ///   not be parsed. Not expected to happen for tokens issued by the server.
  /// -[RefreshTokenNotFoundException]: refresh token is unknown to the server.
  ///   Either the token was deleted or generated by a different server.
  /// -[RefreshTokenExpiredException]: refresh token has expired. Will happen
  ///   only if it has not been used within configured `refreshTokenLifetime`.
  /// -[RefreshTokenInvalidSecretException]: refresh token is incorrect, meaning
  ///   it does not refer to the current secret refresh token. This indicates
  ///   either a malfunctioning client or a malicious attempt by someone who has
  ///   obtained the refresh token. In this case the underlying refresh token
  ///   will be deleted, and access to it will expire fully when the last access
  ///   token is elapsed.
  ///
  /// This endpoint is unauthenticated, meaning the client won't include any
  /// authentication information with the call.
  @override
  _i3.Future<_i4.AuthSuccess> refreshAccessToken({
    required String refreshToken,
  }) => caller.callServerEndpoint<_i4.AuthSuccess>(
    'jwtRefresh',
    'refreshAccessToken',
    {'refreshToken': refreshToken},
    authenticated: false,
  );
}

/// Collection 엔드포인트 - 보관함 CRUD 기능
/// {@category Endpoint}
class EndpointCollection extends _i2.EndpointRef {
  EndpointCollection(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'collection';

  /// 보관함 생성
  _i3.Future<_i5.Collection> create(
    String name, {
    String? description,
  }) => caller.callServerEndpoint<_i5.Collection>(
    'collection',
    'create',
    {
      'name': name,
      'description': description,
    },
  );

  /// 내 보관함 목록
  _i3.Future<List<_i5.Collection>> getMyCollections() =>
      caller.callServerEndpoint<List<_i5.Collection>>(
        'collection',
        'getMyCollections',
        {},
      );

  /// 보관함 상세 정보
  _i3.Future<_i5.Collection?> getCollection(int collectionId) =>
      caller.callServerEndpoint<_i5.Collection?>(
        'collection',
        'getCollection',
        {'collectionId': collectionId},
      );

  /// 보관함 수정
  _i3.Future<_i5.Collection?> update(
    int collectionId, {
    String? name,
    String? description,
  }) => caller.callServerEndpoint<_i5.Collection?>(
    'collection',
    'update',
    {
      'collectionId': collectionId,
      'name': name,
      'description': description,
    },
  );

  /// 보관함 삭제
  _i3.Future<bool> delete(int collectionId) => caller.callServerEndpoint<bool>(
    'collection',
    'delete',
    {'collectionId': collectionId},
  );

  /// 보관함에 짤 추가
  _i3.Future<bool> addMeme(
    int collectionId,
    int memeId,
  ) => caller.callServerEndpoint<bool>(
    'collection',
    'addMeme',
    {
      'collectionId': collectionId,
      'memeId': memeId,
    },
  );

  /// 보관함에서 짤 제거
  _i3.Future<bool> removeMeme(
    int collectionId,
    int memeId,
  ) => caller.callServerEndpoint<bool>(
    'collection',
    'removeMeme',
    {
      'collectionId': collectionId,
      'memeId': memeId,
    },
  );

  /// 보관함 내 짤 목록
  _i3.Future<List<_i6.Meme>> getMemes(
    int collectionId, {
    required int offset,
    required int limit,
  }) => caller.callServerEndpoint<List<_i6.Meme>>(
    'collection',
    'getMemes',
    {
      'collectionId': collectionId,
      'offset': offset,
      'limit': limit,
    },
  );
}

/// Meme 엔드포인트 - 업로드, 검색, 조회 기능 제공
/// {@category Endpoint}
class EndpointMeme extends _i2.EndpointRef {
  EndpointMeme(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'meme';

  /// 파일 업로드 URL 생성 (Direct Upload to Cloud Storage)
  /// 실제 GCS 설정이 없는 경우를 위한 간단한 구현
  _i3.Future<_i7.UploadDescription> createUploadUrl(
    String fileName,
    String fileType,
    int fileSize,
  ) => caller.callServerEndpoint<_i7.UploadDescription>(
    'meme',
    'createUploadUrl',
    {
      'fileName': fileName,
      'fileType': fileType,
      'fileSize': fileSize,
    },
  );

  /// 업로드 완료 알림 → Future Call 트리거
  _i3.Future<_i6.Meme> completeUpload({
    required String storagePath,
    required String storageUrl,
    required String fileType,
    required int fileSize,
    required int width,
    required int height,
  }) => caller.callServerEndpoint<_i6.Meme>(
    'meme',
    'completeUpload',
    {
      'storagePath': storagePath,
      'storageUrl': storageUrl,
      'fileType': fileType,
      'fileSize': fileSize,
      'width': width,
      'height': height,
    },
  );

  /// 시맨틱 검색 (태그 + OCR 텍스트 기반)
  _i3.Future<List<_i6.Meme>> search(
    String query, {
    required int limit,
    required int offset,
  }) => caller.callServerEndpoint<List<_i6.Meme>>(
    'meme',
    'search',
    {
      'query': query,
      'limit': limit,
      'offset': offset,
    },
  );

  /// 인기 (트렌딩) 짤 목록
  _i3.Future<List<_i6.Meme>> getTrending({
    required int limit,
    required int offset,
  }) => caller.callServerEndpoint<List<_i6.Meme>>(
    'meme',
    'getTrending',
    {
      'limit': limit,
      'offset': offset,
    },
  );

  /// 최신 짤 목록
  _i3.Future<List<_i6.Meme>> getLatest({
    required int limit,
    required int offset,
  }) => caller.callServerEndpoint<List<_i6.Meme>>(
    'meme',
    'getLatest',
    {
      'limit': limit,
      'offset': offset,
    },
  );

  /// 짤 사용 기록
  _i3.Future<void> recordUsage(
    int memeId,
    String source,
  ) => caller.callServerEndpoint<void>(
    'meme',
    'recordUsage',
    {
      'memeId': memeId,
      'source': source,
    },
  );

  /// 짤 상세 정보
  _i3.Future<_i6.Meme?> getMeme(int memeId) =>
      caller.callServerEndpoint<_i6.Meme?>(
        'meme',
        'getMeme',
        {'memeId': memeId},
      );

  /// 내가 업로드한 짤 목록
  _i3.Future<List<_i6.Meme>> getMyMemes({
    required int offset,
    required int limit,
  }) => caller.callServerEndpoint<List<_i6.Meme>>(
    'meme',
    'getMyMemes',
    {
      'offset': offset,
      'limit': limit,
    },
  );

  /// 짤 삭제
  _i3.Future<bool> deleteMeme(int memeId) => caller.callServerEndpoint<bool>(
    'meme',
    'deleteMeme',
    {'memeId': memeId},
  );
}

/// 실시간 트렌딩 피드 스트리밍 엔드포인트
/// {@category Endpoint}
class EndpointTrending extends _i2.EndpointRef {
  EndpointTrending(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'trending';

  /// 실시간 트렌딩 업데이트 스트림
  /// 클라이언트가 이 스트림을 구독하면 짤 사용량 변화를 실시간으로 받을 수 있음
  _i3.Stream<_i8.TrendingUpdate> streamTrending() =>
      caller.callStreamingServerEndpoint<
        _i3.Stream<_i8.TrendingUpdate>,
        _i8.TrendingUpdate
      >(
        'trending',
        'streamTrending',
        {},
        {},
      );

  /// 현재 트렌딩 스냅샷 조회
  _i3.Future<List<_i8.TrendingUpdate>> getTrendingSnapshot({
    required int limit,
  }) => caller.callServerEndpoint<List<_i8.TrendingUpdate>>(
    'trending',
    'getTrendingSnapshot',
    {'limit': limit},
  );
}

/// This is an example endpoint that returns a greeting message through
/// its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _i2.EndpointRef {
  EndpointGreeting(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _i3.Future<_i9.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i9.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

class Modules {
  Modules(Client client) {
    serverpod_auth_idp = _i1.Caller(client);
    serverpod_auth_core = _i4.Caller(client);
  }

  late final _i1.Caller serverpod_auth_idp;

  late final _i4.Caller serverpod_auth_core;
}

class Client extends _i2.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    @Deprecated(
      'Use authKeyProvider instead. This will be removed in future releases.',
    )
    super.authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i2.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_i2.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
         host,
         _i10.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
       ) {
    emailIdp = EndpointEmailIdp(this);
    jwtRefresh = EndpointJwtRefresh(this);
    collection = EndpointCollection(this);
    meme = EndpointMeme(this);
    trending = EndpointTrending(this);
    greeting = EndpointGreeting(this);
    modules = Modules(this);
  }

  late final EndpointEmailIdp emailIdp;

  late final EndpointJwtRefresh jwtRefresh;

  late final EndpointCollection collection;

  late final EndpointMeme meme;

  late final EndpointTrending trending;

  late final EndpointGreeting greeting;

  late final Modules modules;

  @override
  Map<String, _i2.EndpointRef> get endpointRefLookup => {
    'emailIdp': emailIdp,
    'jwtRefresh': jwtRefresh,
    'collection': collection,
    'meme': meme,
    'trending': trending,
    'greeting': greeting,
  };

  @override
  Map<String, _i2.ModuleEndpointCaller> get moduleLookup => {
    'serverpod_auth_idp': modules.serverpod_auth_idp,
    'serverpod_auth_core': modules.serverpod_auth_core,
  };
}

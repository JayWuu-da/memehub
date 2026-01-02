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
import 'package:serverpod/serverpod.dart' as _i1;
import '../auth/email_idp_endpoint.dart' as _i2;
import '../auth/jwt_refresh_endpoint.dart' as _i3;
import '../endpoints/collection_endpoint.dart' as _i4;
import '../endpoints/meme_endpoint.dart' as _i5;
import '../endpoints/trending_endpoint.dart' as _i6;
import '../greetings/greeting_endpoint.dart' as _i7;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i8;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i9;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'emailIdp': _i2.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'jwtRefresh': _i3.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
      'collection': _i4.CollectionEndpoint()
        ..initialize(
          server,
          'collection',
          null,
        ),
      'meme': _i5.MemeEndpoint()
        ..initialize(
          server,
          'meme',
          null,
        ),
      'trending': _i6.TrendingEndpoint()
        ..initialize(
          server,
          'trending',
          null,
        ),
      'greeting': _i7.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
    };
    connectors['emailIdp'] = _i1.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint).login(
                session,
                email: params['email'],
                password: params['password'],
              ),
        ),
        'startRegistration': _i1.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCode': _i1.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _i1.ParameterDescription(
              name: 'accountRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _i1.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _i1.ParameterDescription(
              name: 'registrationToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _i1.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _i1.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _i1.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _i1.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _i1.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'newPassword': _i1.ParameterDescription(
              name: 'newPassword',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
      },
    );
    connectors['jwtRefresh'] = _i1.EndpointConnector(
      name: 'jwtRefresh',
      endpoint: endpoints['jwtRefresh']!,
      methodConnectors: {
        'refreshAccessToken': _i1.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _i1.ParameterDescription(
              name: 'refreshToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['jwtRefresh'] as _i3.JwtRefreshEndpoint)
                  .refreshAccessToken(
                    session,
                    refreshToken: params['refreshToken'],
                  ),
        ),
      },
    );
    connectors['collection'] = _i1.EndpointConnector(
      name: 'collection',
      endpoint: endpoints['collection']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'description': _i1.ParameterDescription(
              name: 'description',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['collection'] as _i4.CollectionEndpoint).create(
                    session,
                    params['name'],
                    description: params['description'],
                  ),
        ),
        'getMyCollections': _i1.MethodConnector(
          name: 'getMyCollections',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['collection'] as _i4.CollectionEndpoint)
                  .getMyCollections(session),
        ),
        'getCollection': _i1.MethodConnector(
          name: 'getCollection',
          params: {
            'collectionId': _i1.ParameterDescription(
              name: 'collectionId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['collection'] as _i4.CollectionEndpoint)
                  .getCollection(
                    session,
                    params['collectionId'],
                  ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'collectionId': _i1.ParameterDescription(
              name: 'collectionId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'description': _i1.ParameterDescription(
              name: 'description',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['collection'] as _i4.CollectionEndpoint).update(
                    session,
                    params['collectionId'],
                    name: params['name'],
                    description: params['description'],
                  ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'collectionId': _i1.ParameterDescription(
              name: 'collectionId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['collection'] as _i4.CollectionEndpoint).delete(
                    session,
                    params['collectionId'],
                  ),
        ),
        'addMeme': _i1.MethodConnector(
          name: 'addMeme',
          params: {
            'collectionId': _i1.ParameterDescription(
              name: 'collectionId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'memeId': _i1.ParameterDescription(
              name: 'memeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['collection'] as _i4.CollectionEndpoint).addMeme(
                    session,
                    params['collectionId'],
                    params['memeId'],
                  ),
        ),
        'removeMeme': _i1.MethodConnector(
          name: 'removeMeme',
          params: {
            'collectionId': _i1.ParameterDescription(
              name: 'collectionId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'memeId': _i1.ParameterDescription(
              name: 'memeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['collection'] as _i4.CollectionEndpoint)
                  .removeMeme(
                    session,
                    params['collectionId'],
                    params['memeId'],
                  ),
        ),
        'getMemes': _i1.MethodConnector(
          name: 'getMemes',
          params: {
            'collectionId': _i1.ParameterDescription(
              name: 'collectionId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['collection'] as _i4.CollectionEndpoint).getMemes(
                    session,
                    params['collectionId'],
                    offset: params['offset'],
                    limit: params['limit'],
                  ),
        ),
      },
    );
    connectors['meme'] = _i1.EndpointConnector(
      name: 'meme',
      endpoint: endpoints['meme']!,
      methodConnectors: {
        'createUploadUrl': _i1.MethodConnector(
          name: 'createUploadUrl',
          params: {
            'fileName': _i1.ParameterDescription(
              name: 'fileName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'fileType': _i1.ParameterDescription(
              name: 'fileType',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'fileSize': _i1.ParameterDescription(
              name: 'fileSize',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['meme'] as _i5.MemeEndpoint).createUploadUrl(
                    session,
                    params['fileName'],
                    params['fileType'],
                    params['fileSize'],
                  ),
        ),
        'completeUpload': _i1.MethodConnector(
          name: 'completeUpload',
          params: {
            'storagePath': _i1.ParameterDescription(
              name: 'storagePath',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'storageUrl': _i1.ParameterDescription(
              name: 'storageUrl',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'fileType': _i1.ParameterDescription(
              name: 'fileType',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'fileSize': _i1.ParameterDescription(
              name: 'fileSize',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'width': _i1.ParameterDescription(
              name: 'width',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'height': _i1.ParameterDescription(
              name: 'height',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['meme'] as _i5.MemeEndpoint).completeUpload(
                session,
                storagePath: params['storagePath'],
                storageUrl: params['storageUrl'],
                fileType: params['fileType'],
                fileSize: params['fileSize'],
                width: params['width'],
                height: params['height'],
              ),
        ),
        'search': _i1.MethodConnector(
          name: 'search',
          params: {
            'query': _i1.ParameterDescription(
              name: 'query',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['meme'] as _i5.MemeEndpoint).search(
                session,
                params['query'],
                limit: params['limit'],
                offset: params['offset'],
              ),
        ),
        'getTrending': _i1.MethodConnector(
          name: 'getTrending',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['meme'] as _i5.MemeEndpoint).getTrending(
                session,
                limit: params['limit'],
                offset: params['offset'],
              ),
        ),
        'getLatest': _i1.MethodConnector(
          name: 'getLatest',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['meme'] as _i5.MemeEndpoint).getLatest(
                session,
                limit: params['limit'],
                offset: params['offset'],
              ),
        ),
        'recordUsage': _i1.MethodConnector(
          name: 'recordUsage',
          params: {
            'memeId': _i1.ParameterDescription(
              name: 'memeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'source': _i1.ParameterDescription(
              name: 'source',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['meme'] as _i5.MemeEndpoint).recordUsage(
                session,
                params['memeId'],
                params['source'],
              ),
        ),
        'getMeme': _i1.MethodConnector(
          name: 'getMeme',
          params: {
            'memeId': _i1.ParameterDescription(
              name: 'memeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['meme'] as _i5.MemeEndpoint).getMeme(
                session,
                params['memeId'],
              ),
        ),
        'getMyMemes': _i1.MethodConnector(
          name: 'getMyMemes',
          params: {
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['meme'] as _i5.MemeEndpoint).getMyMemes(
                session,
                offset: params['offset'],
                limit: params['limit'],
              ),
        ),
        'deleteMeme': _i1.MethodConnector(
          name: 'deleteMeme',
          params: {
            'memeId': _i1.ParameterDescription(
              name: 'memeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['meme'] as _i5.MemeEndpoint).deleteMeme(
                session,
                params['memeId'],
              ),
        ),
      },
    );
    connectors['trending'] = _i1.EndpointConnector(
      name: 'trending',
      endpoint: endpoints['trending']!,
      methodConnectors: {
        'getTrendingSnapshot': _i1.MethodConnector(
          name: 'getTrendingSnapshot',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['trending'] as _i6.TrendingEndpoint)
                  .getTrendingSnapshot(
                    session,
                    limit: params['limit'],
                  ),
        ),
        'streamTrending': _i1.MethodStreamConnector(
          name: 'streamTrending',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
                Map<String, Stream> streamParams,
              ) => (endpoints['trending'] as _i6.TrendingEndpoint)
                  .streamTrending(session),
        ),
      },
    );
    connectors['greeting'] = _i1.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['greeting'] as _i7.GreetingEndpoint).hello(
                session,
                params['name'],
              ),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _i8.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _i9.Endpoints()
      ..initializeEndpoints(server);
  }
}

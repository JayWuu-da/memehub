# MemeHub Client 📦

> Auto-generated Dart client library for MemeHub API

[English](#english) | [한국어](#한국어)

---

## English

### 📖 Overview

This package is **auto-generated** by Serverpod and provides type-safe client bindings for the MemeHub API. It includes all data models and method stubs for communicating with the server.

> ⚠️ **Do not edit files in this package manually.** Changes will be overwritten when running `serverpod generate`.

### 🛠️ Usage

#### Installation

Add to your Flutter app's `pubspec.yaml`:

```yaml
dependencies:
  memehub_client:
    path: ../memehub_client
```

#### Initialize Client

```dart
import 'package:memehub_client/memehub_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

late final Client client;

void main() async {
  client = Client('http://localhost:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();
  
  runApp(MyApp());
}
```

#### API Calls

```dart
// Meme operations
final trending = await client.meme.getTrending(limit: 20, offset: 0);
final searchResults = await client.meme.search('funny', limit: 20, offset: 0);
final uploadUrl = await client.meme.createUploadUrl('image.jpg', 'jpg', 1024);

// Collection operations
final collections = await client.collection.getMyCollections();
await client.collection.create('Favorites');
await client.collection.addMeme(collectionId, memeId);

// Real-time streaming
final stream = client.trending.streamTrending();
stream.listen((update) {
  print('Trending update: ${update.memeId}');
});
```

### 📊 Generated Models

| Model | Description |
|-------|-------------|
| `Meme` | Meme entity with all metadata |
| `Collection` | User collection |
| `CollectionMeme` | Collection-Meme relation |
| `MemeUsage` | Usage tracking |
| `TrendingUpdate` | Real-time update data |
| `UploadDescription` | Upload URL info |
| `AiAnalysisResult` | AI processing result |
| `MemeProcessRequest` | Future call parameter |

### 🔧 Regenerate

When server models change:

```bash
cd memehub_server
serverpod generate
```

This automatically updates the client package.

---

## 한국어

### 📖 개요

이 패키지는 Serverpod에 의해 **자동 생성**되며 MemeHub API에 대한 타입 안전 클라이언트 바인딩을 제공합니다.

> ⚠️ **이 패키지의 파일을 수동으로 편집하지 마세요.** `serverpod generate` 실행 시 덮어씌워집니다.

### 🛠️ 사용법

#### 설치

Flutter 앱의 `pubspec.yaml`에 추가:

```yaml
dependencies:
  memehub_client:
    path: ../memehub_client
```

#### 클라이언트 초기화

```dart
import 'package:memehub_client/memehub_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

late final Client client;

void main() async {
  client = Client('http://localhost:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();
  
  runApp(MyApp());
}
```

#### API 호출

```dart
// Meme 작업
final trending = await client.meme.getTrending(limit: 20, offset: 0);
final searchResults = await client.meme.search('funny', limit: 20, offset: 0);

// Collection 작업
final collections = await client.collection.getMyCollections();
await client.collection.create('즐겨찾기');

// 실시간 스트리밍
final stream = client.trending.streamTrending();
stream.listen((update) {
  print('트렌딩 업데이트: ${update.memeId}');
});
```

### 🔧 재생성

서버 모델이 변경되면:

```bash
cd memehub_server
serverpod generate
```

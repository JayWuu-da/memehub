# MemeHub 🎭

> A meme management and sharing platform built with Serverpod and Flutter for the Serverpod Hackathon

[한국어](#한국어) | [English](#english)

---

## English

### 📖 Overview

MemeHub is a comprehensive meme platform that enables users to easily explore, save, and share memes across messenger apps. Built with Serverpod's powerful features and Gemini AI integration, it provides intelligent meme management with:

- **🔒 Safety** - Gemini AI NSFW filtering for content moderation
- **🏷️ Convenience** - AI auto-tagging, OCR text extraction, semantic search
- **📈 Real-time** - Live trending feed via WebSocket streaming
- **📱 Cross-platform** - Flutter app for iOS, Android, and Web

### 🏗️ Architecture

```
memehub/
├── memehub_server/     # Serverpod Backend
│   ├── lib/src/
│   │   ├── endpoints/  # API endpoints
│   │   ├── protocol/   # Data models (YAML)
│   │   ├── services/   # Gemini AI service
│   │   └── future_calls/ # Background processing
│   └── config/         # Server configuration
├── memehub_client/     # Auto-generated client library
└── memehub_flutter/    # Flutter mobile/web app
    └── lib/screens/    # UI screens
```

### 🛠️ Tech Stack

| Layer | Technology | Purpose |
|-------|------------|---------|
| **Backend** | Serverpod 3.1.1 | Dart-based backend framework |
| **Database** | PostgreSQL + pgvector | Relational DB with vector search |
| **Cache** | Redis | Session and cache management |
| **AI** | Gemini API | NSFW check, OCR, auto-tagging |
| **Storage** | Google Cloud Storage | Image/GIF file storage |
| **Frontend** | Flutter 3.32+ | Cross-platform UI |
| **Real-time** | WebSocket | Live trending updates |

### 🚀 Quick Start

#### Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [Dart SDK](https://dart.dev/get-dart) 3.8+
- [Flutter SDK](https://flutter.dev/docs/get-started/install) 3.32+
- [Serverpod CLI](https://pub.dev/packages/serverpod_cli)

#### 1. Clone and Setup

```bash
git clone <repository-url>
cd memehub
```

#### 2. Start Database Services

```bash
cd memehub_server
docker compose up --build --detach
```

#### 3. Configure API Keys

Create `memehub_server/config/passwords.yaml`:

```yaml
development:
  geminiApiKey: 'YOUR_GEMINI_API_KEY'
```

#### 4. Run Server

```bash
cd memehub_server
dart bin/main.dart --apply-migrations
```

#### 5. Run Flutter App

```bash
cd memehub_flutter
flutter run
```

### 📡 API Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `meme.createUploadUrl` | POST | Generate upload URL |
| `meme.completeUpload` | POST | Complete upload & trigger AI |
| `meme.search` | GET | Semantic search memes |
| `meme.getTrending` | GET | Get trending memes |
| `meme.getLatest` | GET | Get latest memes |
| `collection.create` | POST | Create collection |
| `collection.getMemes` | GET | Get memes in collection |
| `trending.streamTrending` | WS | Real-time trending stream |

### 🧠 AI Pipeline

```
Upload → NSFW Check → OCR → Auto-tagging → Vector Embedding → Approved
           ↓
        Rejected (if NSFW)
```

### 📱 App Screens

| Screen | Description |
|--------|-------------|
| **Home** | Trending/Latest meme grid with tabs |
| **Search** | Semantic search with tag suggestions |
| **Upload** | Image picker with upload progress |
| **Collections** | Saved meme folders |
| **Profile** | User stats and uploads |

### 🔧 Development Commands

```bash
# Generate Serverpod code
cd memehub_server
serverpod generate

# Create database migration
serverpod create-migration --force

# Run with migration
dart bin/main.dart --apply-migrations

# Flutter analyze
cd memehub_flutter
flutter analyze

# Build Android APK
flutter build apk --debug

# Build iOS
flutter build ios --debug
```

### 📦 Project Structure

See individual README files:
- [memehub_server/README.md](./memehub_server/README.md) - Backend documentation
- [memehub_client/README.md](./memehub_client/README.md) - Client library documentation
- [memehub_flutter/README.md](./memehub_flutter/README.md) - Flutter app documentation

---

## 한국어

### 📖 개요

MemeHub는 메신저 앱에서 짤(Meme)을 쉽게 탐색, 저장, 공유할 수 있는 플랫폼입니다. Serverpod의 강력한 기능과 Gemini AI를 통합하여 지능형 짤 관리를 제공합니다:

- **🔒 안전** - Gemini AI NSFW 필터링으로 콘텐츠 모더레이션
- **🏷️ 편리** - AI 자동 태깅, OCR 텍스트 추출, 시맨틱 검색
- **📈 실시간** - WebSocket을 통한 실시간 트렌딩 피드
- **📱 크로스 플랫폼** - iOS, Android, Web용 Flutter 앱

### 🛠️ 기술 스택

| 레이어 | 기술 | 용도 |
|--------|------|------|
| **백엔드** | Serverpod 3.1.1 | Dart 기반 백엔드 프레임워크 |
| **데이터베이스** | PostgreSQL + pgvector | 벡터 검색 지원 관계형 DB |
| **캐시** | Redis | 세션 및 캐시 관리 |
| **AI** | Gemini API | NSFW 체크, OCR, 자동 태깅 |
| **스토리지** | Google Cloud Storage | 이미지/GIF 파일 저장소 |
| **프론트엔드** | Flutter 3.32+ | 크로스 플랫폼 UI |
| **실시간** | WebSocket | 실시간 트렌딩 업데이트 |

### 🚀 빠른 시작

#### 사전 요구사항

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [Dart SDK](https://dart.dev/get-dart) 3.8+
- [Flutter SDK](https://flutter.dev/docs/get-started/install) 3.32+
- [Serverpod CLI](https://pub.dev/packages/serverpod_cli)

#### 1. 데이터베이스 시작

```bash
cd memehub_server
docker compose up --build --detach
```

#### 2. API 키 설정

`memehub_server/config/passwords.yaml` 생성:

```yaml
development:
  geminiApiKey: 'YOUR_GEMINI_API_KEY'
```

#### 3. 서버 실행

```bash
cd memehub_server
dart bin/main.dart --apply-migrations
```

#### 4. Flutter 앱 실행

```bash
cd memehub_flutter
flutter run
```

### 🔧 개발 명령어

```bash
# Serverpod 코드 생성
cd memehub_server
serverpod generate

# 데이터베이스 마이그레이션 생성
serverpod create-migration --force

# 마이그레이션과 함께 실행
dart bin/main.dart --apply-migrations

# Flutter 분석
cd memehub_flutter
flutter analyze

# Android APK 빌드
flutter build apk --debug
```

---

## 📄 License

MIT License

## 🤝 Contributing

Contributions are welcome! Please read the contributing guidelines first.

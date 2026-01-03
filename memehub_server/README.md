# MemeHub Server 🖥️

> Serverpod backend for MemeHub - AI-powered meme management platform

[English](#english) | [한국어](#한국어)

---

## English

### 📖 Overview

The MemeHub Server is built with Serverpod, providing a robust backend with:

- **ORM** - Type-safe database operations
- **Future Calls** - Background AI processing
- **Real-time Streaming** - WebSocket-based live updates
- **Cloud Storage** - GCS integration for image storage

### 🏗️ Project Structure

```
memehub_server/
├── bin/
│   └── main.dart           # Entry point
├── lib/
│   ├── server.dart         # Server configuration
│   └── src/
│       ├── endpoints/      # API endpoints
│       │   ├── meme_endpoint.dart
│       │   ├── collection_endpoint.dart
│       │   └── trending_endpoint.dart
│       ├── protocol/       # Data models (YAML)
│       │   ├── meme.yaml
│       │   ├── collection.yaml
│       │   └── ...
│       ├── services/       # Business logic
│       │   └── gemini_service.dart
│       └── future_calls/   # Background tasks
│           └── process_meme_future_call.dart
├── config/
│   ├── development.yaml    # Dev configuration
│   ├── production.yaml     # Prod configuration
│   └── passwords.yaml      # API keys (git-ignored)
├── migrations/             # Database migrations
└── docker-compose.yaml     # PostgreSQL + Redis
```

### 🛠️ Tech Stack

| Component | Technology | Version |
|-----------|------------|---------|
| Framework | Serverpod | 3.1.1 |
| Database | PostgreSQL | 16 (pgvector) |
| Cache | Redis | Latest |
| AI SDK | google_generative_ai | 0.4.6 |
| Storage | serverpod_cloud_storage_gcp | 2.3.0 |

### 📊 Data Models

| Model | Description |
|-------|-------------|
| `Meme` | Core meme entity with AI metadata |
| `Collection` | User-created meme folders |
| `CollectionMeme` | Many-to-many join table |
| `MemeUsage` | Usage tracking for trending |
| `TrendingUpdate` | Real-time update DTO |
| `UploadDescription` | Upload URL response |

### 📡 API Endpoints

#### MemeEndpoint

| Method | Parameters | Description |
|--------|------------|-------------|
| `createUploadUrl` | fileName, fileType, fileSize | Get GCS upload URL |
| `completeUpload` | storagePath, storageUrl, ... | Confirm upload & trigger AI |
| `search` | query, limit, offset | Semantic search |
| `getTrending` | limit, offset | Get trending memes |
| `getLatest` | limit, offset | Get latest memes |
| `recordUsage` | memeId, source | Track meme usage |
| `getMeme` | memeId | Get single meme |
| `getMyMemes` | limit, offset | Get user's memes |
| `deleteMeme` | memeId | Delete meme |

#### CollectionEndpoint

| Method | Parameters | Description |
|--------|------------|-------------|
| `create` | name | Create new collection |
| `getMyCollections` | - | List user's collections |
| `update` | collectionId, name | Rename collection |
| `delete` | collectionId | Delete collection |
| `addMeme` | collectionId, memeId | Add meme to collection |
| `removeMeme` | collectionId, memeId | Remove meme |
| `getMemes` | collectionId, offset, limit | Get memes in collection |

#### TrendingEndpoint

| Method | Parameters | Description |
|--------|------------|-------------|
| `streamTrending` | - | WebSocket streaming |
| `getTrendingSnapshot` | limit | Get current trending list |

### 🧠 AI Processing Pipeline

```dart
// Future Call: ProcessMemeFutureCall
1. Download image from storage
2. NSFW Check → Reject if unsafe
3. OCR Text Extraction
4. AI Description & Tag Generation
5. Update meme status to 'approved'
6. Broadcast trending update
```

### 🚀 Setup & Commands

#### Prerequisites

```bash
# Install Serverpod CLI
dart pub global activate serverpod_cli
```

#### Start Services

```bash
# Start PostgreSQL and Redis
docker compose up --build --detach

# Check running containers
docker compose ps
```

#### Configuration

Create `config/passwords.yaml`:

```yaml
development:
  geminiApiKey: 'YOUR_GEMINI_API_KEY'
  gcsAccessKey: 'YOUR_GCS_ACCESS_KEY'    # Optional
  gcsSecretKey: 'YOUR_GCS_SECRET_KEY'    # Optional
```

#### Development Commands

```bash
# Generate protocol code
serverpod generate

# Create new migration
serverpod create-migration --force

# Run server with migrations
dart bin/main.dart --apply-migrations

# Run without migrations
dart bin/main.dart

# Repair migration (if database mismatch)
dart bin/main.dart --apply-repair-migration

# Run tests
dart test

# Analyze code
dart analyze
```

#### Database Commands

```bash
# Connect to PostgreSQL
docker exec -it memehub_server-postgres-1 psql -U postgres -d memehub

# View tables
\dt

# Stop services
docker compose down

# Remove volumes (reset data)
docker compose down -v
```

### 🔧 Environment Configuration

| File | Purpose |
|------|---------|
| `config/development.yaml` | Local development settings |
| `config/staging.yaml` | Staging environment |
| `config/production.yaml` | Production settings |
| `config/passwords.yaml` | Secrets (git-ignored) |

### 📝 Adding New Endpoints

1. Create YAML model in `lib/src/protocol/`
2. Run `serverpod generate`
3. Create endpoint in `lib/src/endpoints/`
4. Run `serverpod create-migration --force`
5. Restart server with `--apply-migrations`

---

## 한국어

### 📖 개요

MemeHub Server는 Serverpod로 구축된 백엔드로, 다음 기능을 제공합니다:

- **ORM** - 타입 안전 데이터베이스 작업
- **Future Calls** - 백그라운드 AI 처리
- **실시간 스트리밍** - WebSocket 기반 라이브 업데이트
- **클라우드 스토리지** - GCS 이미지 저장 연동

### 🚀 설정 및 명령어

#### 사전 요구사항

```bash
# Serverpod CLI 설치
dart pub global activate serverpod_cli
```

#### 서비스 시작

```bash
# PostgreSQL, Redis 시작
docker compose up --build --detach
```

#### 설정

`config/passwords.yaml` 생성:

```yaml
development:
  geminiApiKey: 'YOUR_GEMINI_API_KEY'
```

#### 개발 명령어

```bash
# 프로토콜 코드 생성
serverpod generate

# 새 마이그레이션 생성
serverpod create-migration --force

# 마이그레이션과 함께 서버 실행
dart bin/main.dart --apply-migrations

# 테스트 실행
dart test

# 코드 분석
dart analyze
```

### 📊 데이터 모델

| 모델 | 설명 |
|------|------|
| `Meme` | AI 메타데이터를 포함한 핵심 짤 엔티티 |
| `Collection` | 사용자 생성 짤 폴더 |
| `CollectionMeme` | 다대다 조인 테이블 |
| `MemeUsage` | 트렌딩용 사용 추적 |
| `TrendingUpdate` | 실시간 업데이트 DTO |

### 🧠 AI 처리 파이프라인

```
업로드 → NSFW 체크 → OCR → 자동 태깅 → 벡터 임베딩 → 승인됨
           ↓
        거부됨 (NSFW인 경우)
```

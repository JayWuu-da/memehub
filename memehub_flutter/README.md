# MemeHub Flutter 📱

> Cross-platform Flutter app for MemeHub - iOS, Android, and Web

[English](#english) | [한국어](#한국어)

---

## English

### 📖 Overview

MemeHub Flutter is a modern, cross-platform mobile application featuring:

- **Clean Design** - Minimalist white/blue theme
- **Real-time Updates** - Live trending feed
- **AI-Powered** - Auto-tagging and OCR search
- **Cross-Platform** - iOS, Android, and Web support

### 🏗️ Project Structure

```
memehub_flutter/
├── lib/
│   ├── main.dart              # App entry point & theme
│   ├── config/
│   │   └── app_config.dart    # Server URL config
│   └── screens/
│       ├── home_screen.dart       # Trending/Latest tabs
│       ├── search_screen.dart     # Semantic search
│       ├── upload_screen.dart     # Image upload
│       ├── collections_screen.dart # Saved collections
│       ├── profile_screen.dart    # User profile
│       └── meme_detail_sheet.dart # Detail view
├── android/                   # Android native config
├── ios/                       # iOS native config
└── web/                       # Web config
```

### 🎨 Design System

#### Color Palette

| Name | Hex | Usage |
|------|-----|-------|
| Primary Blue | `#2563EB` | Main accent, buttons |
| Blue Light | `#EFF6FF` | Tag chips, highlights |
| White | `#FFFFFF` | Cards, backgrounds |
| Background | `#F9FAFB` | Page background |
| Gray 900 | `#111827` | Primary text |
| Gray 400 | `#9CA3AF` | Secondary text |

#### Components

- **Cards** - White background, 16px radius, subtle shadow
- **Buttons** - Solid blue (primary), outlined (secondary)
- **Tags** - Light blue chips with blue text
- **Navigation** - Bottom bar with 5 tabs

### 📱 Screens

| Screen | Features |
|--------|----------|
| **Home** | Trending/Latest tabs, pull-to-refresh, meme grid |
| **Search** | Tag suggestions, semantic search, results grid |
| **Upload** | Gallery/camera picker, 5-step progress, status feedback |
| **Collections** | Create folders, add/remove memes |
| **Profile** | Upload stats, meme grid, status badges |
| **Detail** | Share/copy/save actions, AI tags, OCR text |

### 🚀 Setup & Commands

#### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) 3.32+
- Xcode (for iOS)
- Android Studio (for Android)

#### Install Dependencies

```bash
cd memehub_flutter
flutter pub get
```

#### Run Development

```bash
# List available devices
flutter devices

# Run on specific device
flutter run -d chrome      # Web
flutter run -d macos       # macOS
flutter run -d <device-id> # iOS/Android

# Run with hot reload
flutter run
```

#### Build Commands

```bash
# Android APK (debug)
flutter build apk --debug

# Android APK (release)
flutter build apk --release

# Android App Bundle
flutter build appbundle

# iOS (requires Mac)
flutter build ios --debug
flutter build ios --release

# Web
flutter build web
```

#### Development Tools

```bash
# Analyze code
flutter analyze

# Format code
dart format lib/

# Run tests
flutter test

# Generate app icons
flutter pub run flutter_launcher_icons

# Clean build
flutter clean
```

### 🔧 Configuration

#### Server URL

Edit `lib/config/app_config.dart` or use environment variable:

```bash
flutter run --dart-define=SERVER_URL=https://api.memehub.com/
```

#### Android Permissions

Located in `android/app/src/main/AndroidManifest.xml`:

- `INTERNET` - API calls
- `CAMERA` - Photo capture
- `READ_MEDIA_IMAGES` - Gallery access

#### iOS Permissions

Add to `ios/Runner/Info.plist`:

```xml
<key>NSCameraUsageDescription</key>
<string>MemeHub needs camera access to take photos</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>MemeHub needs photo library access to select images</string>
```

### 📦 Dependencies

| Package | Purpose |
|---------|---------|
| `memehub_client` | Server API client |
| `serverpod_flutter` | Serverpod integration |
| `serverpod_auth_idp_flutter` | Authentication |
| `image_picker` | Image selection |

---

## 한국어

### 📖 개요

MemeHub Flutter는 다음 기능을 갖춘 크로스 플랫폼 모바일 앱입니다:

- **클린 디자인** - 미니멀리스트 화이트/블루 테마
- **실시간 업데이트** - 라이브 트렌딩 피드
- **AI 기반** - 자동 태깅 및 OCR 검색
- **크로스 플랫폼** - iOS, Android, Web 지원

### 📱 화면

| 화면 | 기능 |
|------|------|
| **홈** | 트렌딩/최신 탭, 당겨서 새로고침, 짤 그리드 |
| **검색** | 태그 제안, 시맨틱 검색, 결과 그리드 |
| **업로드** | 갤러리/카메라 선택, 5단계 진행, 상태 피드백 |
| **보관함** | 폴더 생성, 짤 추가/제거 |
| **프로필** | 업로드 통계, 짤 그리드, 상태 배지 |
| **상세** | 공유/복사/저장 액션, AI 태그, OCR 텍스트 |

### 🚀 설정 및 명령어

#### 의존성 설치

```bash
cd memehub_flutter
flutter pub get
```

#### 개발 실행

```bash
# 사용 가능한 기기 목록
flutter devices

# 특정 기기에서 실행
flutter run -d chrome      # 웹
flutter run -d <device-id> # iOS/Android
```

#### 빌드 명령어

```bash
# Android APK (디버그)
flutter build apk --debug

# Android APK (릴리즈)
flutter build apk --release

# iOS (Mac 필요)
flutter build ios --debug

# 웹
flutter build web
```

#### 개발 도구

```bash
# 코드 분석
flutter analyze

# 코드 포맷팅
dart format lib/

# 테스트 실행
flutter test

# 빌드 정리
flutter clean
```

### 🎨 디자인 시스템

| 이름 | Hex | 용도 |
|------|-----|------|
| Primary Blue | `#2563EB` | 메인 액센트, 버튼 |
| Blue Light | `#EFF6FF` | 태그 칩, 하이라이트 |
| White | `#FFFFFF` | 카드, 배경 |
| Background | `#F9FAFB` | 페이지 배경 |

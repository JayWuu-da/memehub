import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memehub_client/memehub_client.dart';
import '../main.dart';

/// 업로드 화면 - 웹/모바일 크로스 플랫폼 지원
class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  XFile? _selectedFile;
  Uint8List? _imageBytes; // 웹용 이미지 바이트
  bool _isUploading = false;
  int _currentStep = 0;
  String? _statusMessage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 1920,
        maxHeight: 1920,
        imageQuality: 90,
      );

      if (pickedFile != null) {
        // 웹/모바일 모두 지원하기 위해 바이트로 읽기
        final bytes = await pickedFile.readAsBytes();
        
        setState(() {
          _selectedFile = pickedFile;
          _imageBytes = bytes;
          _currentStep = 1;
          _statusMessage = null;
        });
      }
    } catch (e) {
      _showError('Failed to pick image: $e');
    }
  }

  Future<void> _uploadMeme() async {
    if (_selectedFile == null) return;

    setState(() {
      _isUploading = true;
      _currentStep = 2;
      _statusMessage = 'Preparing upload...';
    });

    try {
      final fileName = _selectedFile!.name;
      final fileSize = _imageBytes?.length ?? 0;
      final fileType = fileName.split('.').last.toLowerCase();

      setState(() => _statusMessage = 'Getting upload URL...');

      final uploadDesc = await client.meme.createUploadUrl(
        fileName,
        fileType,
        fileSize,
      );

      setState(() => _statusMessage = 'Uploading image...');

      // TODO: Actual upload to GCS here using _imageBytes

      setState(() {
        _statusMessage = 'Starting AI analysis...';
        _currentStep = 3;
      });

      final meme = await client.meme.completeUpload(
        storagePath: uploadDesc.storagePath,
        storageUrl: uploadDesc.uploadUrl,
        fileType: fileType,
        fileSize: fileSize,
        width: 500,
        height: 500,
      );

      setState(() {
        _isUploading = false;
        _currentStep = 4;
        _statusMessage = 'Upload complete!';
      });

      _showSuccessDialog(meme);
    } catch (e) {
      setState(() {
        _isUploading = false;
        _statusMessage = 'Upload failed';
      });
      _showError('Upload failed: $e');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.error,
      ),
    );
  }

  void _showSuccessDialog(Meme meme) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.success.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.check_circle, color: AppColors.success),
            ),
            const SizedBox(width: 12),
            const Text('Upload Complete'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your meme has been uploaded and is being processed by our AI.',
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.blueLight,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.auto_awesome, color: AppColors.primary, size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'AI Analysis in Progress',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'NSFW check, OCR, auto-tagging',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.gray600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _resetUpload();
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  void _resetUpload() {
    setState(() {
      _selectedFile = null;
      _imageBytes = null;
      _currentStep = 0;
      _statusMessage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              color: AppColors.white,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Upload',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.gray900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Share your favorite memes',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.gray400,
                    ),
                  ),
                ],
              ),
            ),

            // Progress indicator
            Container(
              color: AppColors.white,
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
              child: _buildProgressIndicator(),
            ),

            const SizedBox(height: 8),

            // Content
            Expanded(
              child: _imageBytes != null
                  ? _buildImagePreview()
                  : _buildImagePicker(),
            ),

            // Upload button
            if (_imageBytes != null && !_isUploading)
              Container(
                color: AppColors.white,
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _uploadMeme,
                    icon: const Icon(Icons.cloud_upload_outlined),
                    label: const Text('Upload Meme'),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    final steps = ['Select', 'Preview', 'Upload', 'AI', 'Done'];

    return Row(
      children: List.generate(steps.length, (index) {
        final isCompleted = index < _currentStep;
        final isCurrent = index == _currentStep;

        return Expanded(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: isCompleted
                            ? AppColors.primary
                            : isCurrent
                                ? AppColors.blueLight
                                : AppColors.gray100,
                        shape: BoxShape.circle,
                        border: isCurrent
                            ? Border.all(color: AppColors.primary, width: 2)
                            : null,
                      ),
                      child: isCompleted
                          ? const Icon(Icons.check, size: 14, color: AppColors.white)
                          : Center(
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: isCurrent ? AppColors.primary : AppColors.gray400,
                                ),
                              ),
                            ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      steps[index],
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: isCurrent ? FontWeight.w600 : FontWeight.w400,
                        color: isCompleted || isCurrent
                            ? AppColors.primary
                            : AppColors.gray400,
                      ),
                    ),
                  ],
                ),
              ),
              if (index < steps.length - 1)
                Expanded(
                  child: Container(
                    height: 2,
                    margin: const EdgeInsets.only(bottom: 16),
                    color: isCompleted ? AppColors.primary : AppColors.gray200,
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildImagePicker() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.gray200,
            width: 2,
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: AppColors.blueLight,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add_photo_alternate_outlined,
                size: 48,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Select an image',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.gray900,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'GIF, PNG, JPG supported',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.gray400,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _pickImage(ImageSource.gallery),
                  icon: const Icon(Icons.photo_library_outlined),
                  label: const Text('Gallery'),
                ),
                // 카메라는 모바일에서만 표시
                if (!kIsWeb) ...[
                  const SizedBox(width: 12),
                  OutlinedButton.icon(
                    onPressed: () => _pickImage(ImageSource.camera),
                    icon: const Icon(Icons.camera_alt_outlined),
                    label: const Text('Camera'),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePreview() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 20,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    // 크로스 플랫폼: Image.memory 사용
                    child: Image.memory(
                      _imageBytes!,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                if (!_isUploading)
                  Positioned(
                    top: 12,
                    right: 12,
                    child: GestureDetector(
                      onTap: _resetUpload,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: const Icon(Icons.close, size: 20, color: AppColors.gray600),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (_isUploading || _statusMessage != null) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  if (_isUploading)
                    const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.primary,
                      ),
                    )
                  else
                    Icon(
                      _currentStep >= 4 ? Icons.check_circle : Icons.info_outline,
                      color: _currentStep >= 4 ? AppColors.success : AppColors.primary,
                      size: 20,
                    ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      _statusMessage ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.gray600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

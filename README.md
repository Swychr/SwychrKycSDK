# Verification Photo Upload for Flutter

A lightweight Flutter plugin that makes it easy to capture or pick photos for KYC, identity verification, or document upload flows.  
Handles camera & gallery permissions automatically with clear messages.

## Features

- Open camera or photo gallery
- Automatic permission requests
- Image compression
- Simple one-line API

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  verification_photo_upload: ^1.0.0
Then run:
Bashflutter pub get
Required Permission Setup
iOS – Info.plist
Add these keys to ios/Runner/Info.plist:
XML<key>NSCameraUsageDescription</key>
<string>The camera is used to take and upload photos and image for verification.</string>

<key>NSPhotoLibraryUsageDescription</key>
<string>Allow access to photo library to upload photos and image for verification</string>

<!-- Recommended -->
<key>NSPhotoLibraryAddUsageDescription</key>
<string>The app needs to save the captured photo for verification.</string>
iOS – Podfile (Required!)
Open ios/Podfile and add this block inside the target 'Runner' section:
Rubytarget 'Runner' do
  use_frameworks!
  use_modular_headers!

  flutter_install_all_ios_pods File.dirname(File.realpath(__FILE__))

  # ADD THIS EXACT BLOCK
  target.build_configurations.each do |config|
    config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
      '$(inherited)',
      ## dart: PermissionGroup.camera
      'PERMISSION_CAMERA=1',
      ## dart: PermissionGroup.photos (iOS) & storage (Android)
      'PERMISSION_PHOTOS=1',
      'PERMISSION_STORAGE=1'
    ]
  end
end
After saving, run:
Bashcd ios
pod install --repo-update
Android – AndroidManifest.xml
Add inside the <manifest> tag (outside <application>):
XML<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
<uses-permission android:name="android.permission.CAMERA"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>

<!-- Recommended for Android 13+ -->
<uses-permission android:name="android.permission.READ_MEDIA_IMAGES"/>
Usage Example
Dartimport 'package:verification_photo_upload/verification_photo_upload.dart';

Future<void> getVerificationPhoto() async {
  try {
    final image = await VerificationPhotoUpload.capture(
      source: PhotoSource.camera, // or PhotoSource.gallery
      title: "Take photo for verification",
      maxWidth: 1200,
      imageQuality: 90,
    );

    if (image != null) {
      // Upload or process the file
      print("Photo path: ${image.path}");
    }
  } catch (e) {
    print("Error or permission denied: $e");
  }
}
Important Notes

Always test permissions on real devices
iOS simulator sometimes skips permission dialogs
For Android 13+ you can remove READ/WRITE_EXTERNAL_STORAGE if you only use READ_MEDIA_IMAGES

Support
Found a bug or need help? Open an issue on the GitHub repository.

Ready for production verification flows – just install and go!
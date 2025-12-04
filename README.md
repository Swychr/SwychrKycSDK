📄 Swychr KYC SDK (Flutter)

A Flutter package that enables seamless KYC verification flows including:

📸 Document capture

🧾 Document upload

🙂 Liveliness checks

🔐 Secure API communication

This SDK handles the complete KYC experience with minimal setup by the developer.

🚀 Installation

Add the SDK to your app’s pubspec.yaml.

From Pub.dev
dependencies:
  swychr_kyc_sdk: ^1.0.0

From GitHub
dependencies:
  swychr_kyc_sdk:
    git:
      url: https://github.com/Swychr/SwychrKycSDK.git
      ref: main


Then run:

flutter pub get

🛠 Platform Setup (REQUIRED)

The SDK uses camera, gallery, and file storage.
Each platform must include the following permissions.

📱 iOS Setup
1. Add Permissions to Info.plist

Open ios/Runner/Info.plist and add:

<key>NSCameraUsageDescription</key>
<string>The camera is used to take and upload photos and images for verification.</string>

<key>NSPhotoLibraryUsageDescription</key>
<string>Allow access to photo library to upload photos and images for verification.</string>


These descriptions appear in the system permission prompts.

2. Add Required Flags in ios/Podfile

Inside your Podfile, within the target 'Runner' do block:

target.build_configurations.each do |config|
  config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
    '$(inherited)',

    ## dart: PermissionGroup.camera
    'PERMISSION_CAMERA=1',
  ]
end


Then install pods:

cd ios
pod install
cd ..

🤖 Android Setup
Add Permissions to AndroidManifest.xml

Open android/app/src/main/AndroidManifest.xml and add these inside <manifest>:

<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.CAMERA"/>


NOTE:
For Android 13+ (API 33+), consider adding:

<uses-permission android:name="android.permission.READ_MEDIA_IMAGES"/>

🔑 Runtime Permissions (Recommended)

This SDK requires camera and photo library/storage access at runtime.

Install permission_handler:

dependencies:
  permission_handler: ^10.4.0


Example:

final status = await Permission.camera.request();
if (!status.isGranted) {
  // Show message or redirect to settings
}

🧩 Usage Example
import 'package:swychr_kyc_sdk/swychr_kyc_sdk.dart';

SwychrKycScreen(
  email: "user@example.com",
  primaryColor: Colors.blue,
  apiKey: "YOUR_API_KEY_HERE",
);


Embed the screen in any page or trigger from a button:

Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => SwychrKycScreen(
      email: "user@example.com",
      primaryColor: Colors.blue,
      apiKey: "YOUR_API_KEY",
    ),
  ),
);

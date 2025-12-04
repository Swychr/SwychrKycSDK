# Swychr KYC SDK

A lightweight Flutter plugin that makes it easy to capture or pick photos for KYC, identity verification, or document upload flows.  
Handles camera & gallery permissions automatically with clear messages.

## Features

- Open camera or photo gallery
- Automatic permission requests
- Image compression
- Simple one-line API

## Installation
From Github
```yaml

dependencies:
  swychr_kyc_sdk:
    git:
      url: https://github.com/Swychr/SwychrKycSDK.git
      ref: main
```

Then run:
```yaml
flutter pub get
```
## ⚙️ Required Platform Configuration

Because this SDK uses the camera, gallery, and file storage, each platform requires specific permissions.<br/><br/>
🍎 iOS Setup<br/><br/>
1️⃣ Add required permission keys to ios/Runner/Info.plist:
```yaml
<key>NSCameraUsageDescription</key>
<string>The camera is used to take and upload photos and images for verification.</string>

<key>NSPhotoLibraryUsageDescription</key>
<string>Allow access to photo library to upload photos and images for verification.</string>

```
2️⃣ Enable camera permission in Podfile <br/><br/>
Inside ios/Podfile, under the target 'Runner' do block, add:
```yaml
target.build_configurations.each do |config|
  config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
    '$(inherited)',

    ## dart: PermissionGroup.camera
    'PERMISSION_CAMERA=1',
  ]
end
```
Then apply changes:
```yaml
cd ios
pod install
cd ..
```
🤖 Android Setup<br/>
Add the following permissions inside android/app/src/main/AndroidManifest.xml:<br/>
```yaml
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.CAMERA"/>
```
Note: For Android 13+ replace storage permissions with:
```yaml
<uses-permission android:name="android.permission.READ_MEDIA_IMAGES" />
```
##🧪 Usage Example
```yaml
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => SwychrKycScreen(
      email: "user@example.com",
      apiKey: "YOUR_API_KEY",
      primaryColor: "YOUR_TEPLATE_PRIMARY_COLOR",
    ),
  ),
);
```
API-KEY will given by the Swychr Team.

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

// import 'package:permission_handler/permission_handler.dart';

import '../core/route_generator.dart';
import '../widgets/appbar_widget.dart';

/// add to menifest file
// <uses-permission android:name="android.permission.CAMERA" />
// <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />

/// add to infoPList file
// <key>NSCameraUsageDescription</key>
// <string>Need camera access to take pictures</string>
// <key>NSPhotoLibraryUsageDescription</key>
// <string>Need library access to pick images</string>

///permission type
///allow
///deney : android
//deney forever--> user need redirect setting option and user need to manually toggle the button

/// to upload image on server/API
/// 1. get image path
/// 2. image compress : 60 MB -> 0-100% reduced by 50%  30MB 1: 2 min
/// 3. image quality: 0- 100% 20 MB 10 MB
/// 4. pass to API 5-10 sec to upload

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  // Function to pick image from camera
  Future<void> _getImageFromCamera() async {
    try {
      _picker.pickImage(source: ImageSource.camera);
      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);//will open camera
      if (photo != null) {
        setState(() {
          _image = File(photo.path);
          //path: location of captured image form user device
        });
      }
    }catch(e){
      print("permission_error $e");
      if(e.toString().contains("camera_access_denied")){
        _requestCameraPermission();
      }
    }
  }

  // Function to pick image from gallery
  Future<void> _getImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
        print("gallery path: $_image \n path: ${image.path}");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: 'Camera/Gallery Permission Example',
        onMenuPressed: () {
          Navigator.pushNamed(context, RouteGeneratorsNames.topicScreen);
        }, onSearchPressed: () {  },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display selected image
            _image != null
                ? Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Image.file(
                _image!,
                fit: BoxFit.cover,
              ),
            )
                : Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: const Icon(
                Icons.image,
                size: 100,
              ),
            ),
            const SizedBox(height: 20),
            // Camera button
            ElevatedButton.icon(
              onPressed: _getImageFromCamera,
              icon: const Icon(Icons.camera),
              label: const Text('Take Photo'),
            ),
            const SizedBox(height: 10),
            // Gallery button
            ElevatedButton.icon(
              onPressed: _getImageFromGallery,
              icon: const Icon(Icons.photo_library),
              label: const Text('Pick from Gallery'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to request camera permission
  Future<bool> _requestCameraPermission() async {
    PermissionStatus cameraStatus = await Permission.camera.status;

    print("permission_log:: $cameraStatus");
    if (cameraStatus.isDenied) {
      print("permission_log::1 $cameraStatus");

      // Request permission
      cameraStatus = await Permission.camera.request();
    }else{
      print("permission_log::2 $cameraStatus");

    }

    if (cameraStatus.isPermanentlyDenied) {
      // Show dialog to open app settings
      // _showSettingsDialog('Camera');
      openAppSettings();
      return false;
    }

    return cameraStatus.isGranted;
  }

  // Function to request camera permission
  Future<bool> _requestGalleryPermission() async {
    PermissionStatus cameraStatus = await Permission.storage.status;

    print("permission_log:: $cameraStatus");
    if (cameraStatus.isDenied) {
      // Request permission
      cameraStatus = await Permission.storage.request();
    }

    if (cameraStatus.isPermanentlyDenied) {
      // Show dialog to open app settings
      // _showSettingsDialog('Camera');
      openAppSettings();
      return false;
    }

    return cameraStatus.isGranted;
  }

  // // Function to show settings dialog
  // Future<void> _showSettingsDialog(String permissionType){
  //
  //
  // }
}
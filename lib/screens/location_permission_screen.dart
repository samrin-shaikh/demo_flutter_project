import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import '../core/route_generator.dart';
import '../widgets/appbar_widget.dart';
import 'package:app_settings/app_settings.dart';

class LocationPermissionScreen extends StatefulWidget {
  const LocationPermissionScreen({super.key});

  @override
  State<LocationPermissionScreen> createState() => _LocationPermissionScreenState();
}

class _LocationPermissionScreenState extends State<LocationPermissionScreen> with WidgetsBindingObserver {
  bool _isActive = true;
  bool _isLoading = true;
  Position? _currentPosition;
  bool _locationFetched = false;
  bool isFromSetting = false;
  bool isInSettingCalled = false;
  String? formattedAddress;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _getCurrentPosition();
    });
  }

  /// pause -> settings -> enable -> back our app-> resume  && true
  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (!mounted) return;

    if (state == AppLifecycleState.resumed && isInSettingCalled) {

      LocationPermission permission = await Geolocator.checkPermission();
      /// will return current location
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        if (isFromSetting) {
          ///true
          _getCurrentPosition();
        }
      } else {
        if (!isFromSetting) {
          _showLocationPermissionDialog(context);
        }
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _isActive = false;
    super.dispose();
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      // Test if location services are enabled
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        if (!mounted) return false;
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location services are disabled. Please enable the services'))
        );
        return false;
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          if (!mounted) return false;
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Location permissions are denied'))
          );
          return false;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        if (!mounted) return false;
        _showLocationPermissionDialog(context);
        return false;
      }

      return true;
    } catch (e) {
      debugPrint('Error handling location permission: $e');
      return false;
    }
  }

  Future<void> _getCurrentPosition() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final hasPermission = await _handleLocationPermission();
      if (!hasPermission) {
        setState(() {
          _isLoading = false;
        });
        return;
      }

      final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high
      );

      /// position will return current location lat lng
      if (!mounted) return;

      setState(() {
        _currentPosition = position;
        _isLoading = false;
        _locationFetched = true;
      });

      /// we have current location infomation lat lng
      _updateAddressFromLatLng(_currentPosition!);
      debugPrint('Location: ${position.latitude}, ${position.longitude}');

    } catch (e) {
      debugPrint('Error getting location: $e');
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
    }
  }
  Future<void> _updateAddressFromLatLng(Position position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    if (!_isActive) return;

    Placemark place = placemarks[0];
    setState(() {
      formattedAddress = '';
      formattedAddress = "${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}";
    });
  }

  void _showLocationPermissionDialog(BuildContext context) {
    if (!mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Location Permission Required'),
        content: const Text('Please enable location permissions in settings to use this feature.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                isFromSetting = true;
              });
              Navigator.pop(context);
              _goToSettings();
            },
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  Future<void> _goToSettings() async {
    isInSettingCalled = true;
    if (Platform.isAndroid) {
      await openAppSettings();
    } else if (Platform.isIOS) {
      await AppSettings.openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: 'Location Permission Example',
        onMenuPressed: () {
          Navigator.pushNamed(context, RouteGeneratorsNames.topicScreen);
        },
        onSearchPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  if (_isLoading)
                    const Center(child: CircularProgressIndicator())
                  else if (_currentPosition != null)
                    Center(
                      child: Text(
                        'Current location:\nLat: ${_currentPosition?.latitude}\nLng: ${_currentPosition?.longitude}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  const SizedBox(height: 20,),
                  Center(
                    child: Text(
                      'Current address: ${formattedAddress}',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            _buildLocateButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildLocateButton() {
    return GestureDetector(
      onTap: _getCurrentPosition,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                "LOCATE ME ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                )
            ),
            Icon(Icons.my_location, size: 24, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
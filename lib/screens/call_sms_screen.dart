import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

import '../core/route_generator.dart';
import '../widgets/appbar_widget.dart';

/// menifest
//   <uses-permission android:name="android.permission.CALL_PHONE" />
//     <uses-permission android:name="android.permission.SEND_SMS" />
//     <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />

///infoplist
// <key>LSApplicationQueriesSchemes</key>
//     <array>
//         <string>tel</string>
//         <string>sms</string>
//     </array>

/// dependency : URL_LAUNCHER


class CallSmsScreen extends StatefulWidget {
  const CallSmsScreen({super.key});

  @override
  State<CallSmsScreen> createState() => _CallSmsScreenState();
}

class _CallSmsScreenState extends State<CallSmsScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _shareTextController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _messageController.dispose();
    _shareTextController.dispose();
    super.dispose();
  }

  // Make a phone call
  Future<void> _makePhoneCall(String phoneNumber) async {
    try {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      await launchUrl(launchUri);
    } catch (e) {
      _showErrorDialog('Could not launch phone call: $e');
    }
  }

  // Send SMS
  Future<void> _sendSMS(String phoneNumber, String message) async {
    try {
      final Uri launchUri = Uri(
        scheme: 'sms',
        path: phoneNumber,
        queryParameters: {'body': message},
      );
      await launchUrl(launchUri);
    } catch (e) {
      _showErrorDialog('Could not launch SMS: $e');
    }
  }

  // Share content
  Future<void> _shareContent(String text) async {
    try {
      await Share.share(
        text,
        subject: 'Check this out!',
      );
    } catch (e) {
      _showErrorDialog('Could not share content: $e');
    }
  }

  // Request phone permissions
  Future<bool> _requestPhonePermission() async {
    var status = await Permission.phone.status;
    if (status.isDenied) {
      status = await Permission.phone.request();
    }
    return status.isGranted;
  }

  // Show error dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: 'Call/SMS Permission Example',
        onMenuPressed: () {
          Navigator.pushNamed(context, RouteGeneratorsNames.topicScreen);
        },
        onSearchPressed: () {},
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Phone Call Section
            const Text(
              'Make a Phone Call',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () async {
                if (await _requestPhonePermission()) {
                  if (_phoneController.text.isNotEmpty) {
                    _makePhoneCall(_phoneController.text);
                  }
                } else {
                  _showErrorDialog('Phone permission denied');
                }
              },
              icon: const Icon(Icons.call),
              label: const Text('Make Call'),
            ),

            const SizedBox(height: 30),

            // SMS Section
            const Text(
              'Send SMS',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _messageController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Message',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.message),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                if (_phoneController.text.isNotEmpty &&
                    _messageController.text.isNotEmpty) {
                  _sendSMS(_phoneController.text, _messageController.text);
                }
              },
              icon: const Icon(Icons.send),
              label: const Text('Send SMS'),
            ),

            const SizedBox(height: 30),

            // Share Section
            const Text(
              'Share Content',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _shareTextController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Content to Share',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.share),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                if (_shareTextController.text.isNotEmpty) {
                  _shareContent(_shareTextController.text);
                }
              },
              icon: const Icon(Icons.share),
              label: const Text('Share Content'),
            ),

          ],
        ),
      ),
    );
  }
}
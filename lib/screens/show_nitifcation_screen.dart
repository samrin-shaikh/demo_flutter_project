import '../popups/nitification_service.dart';
import 'package:flutter/material.dart';
class ShowNitifcationScreen extends StatelessWidget {
  const ShowNitifcationScreen({super.key});

  void _showNotification() {
    print("eydgwdhcbsdcdn");
    NotificationService.showNotification(
      id: 1,
      title: "Hello!",
      body: "This is a local notification example.",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Local Notification')),
      body: Center(
        child: ElevatedButton(
          onPressed: _showNotification,
          child: const Text("Show Notification"),
        ),
      ),
    );
  }
}
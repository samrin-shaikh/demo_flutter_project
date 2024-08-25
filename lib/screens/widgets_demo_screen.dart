import 'package:flutter/material.dart';

class WidegtDemoScreen extends StatelessWidget {
  const WidegtDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("data");
  }
}

class WidgetDemoStateful extends StatefulWidget {
  const WidgetDemoStateful({super.key});

  @override
  State<WidgetDemoStateful> createState() => _WidgetDemoStatefulState();
}

class _WidgetDemoStatefulState extends State<WidgetDemoStateful> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


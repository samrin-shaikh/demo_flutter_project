import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/route_generator.dart';
import '../widgets/appbar_widget.dart';

class LifecycleExampleScreen extends StatefulWidget {
  LifecycleExampleScreen({super.key});

  @override
  State<LifecycleExampleScreen> createState() => _LifecycleExampleScreenState();
}

class _LifecycleExampleScreenState extends State<LifecycleExampleScreen> with WidgetsBindingObserver{
 String testVar = "";
 ///first time ini
 ///one time inti - > second time value will not be update
 ///
 AppLifecycleState? _appLifecycleState;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("on init");
    testVar = "updated to resume ";
    WidgetsBinding.instance.addObserver(this);
  }

  ///called when object is removed from the lifecycle (tree) permanently
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("on dispose");
    WidgetsBinding.instance.removeObserver(this);
    // video running -> stop
  }

 ///didChangeAppLifecycleState
 ///  paused-> resumed

 @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    setState(() {
      _appLifecycleState = state;
    });
    switch(state){
      case AppLifecycleState.resumed:
        onResumed();
        break;
      case AppLifecycleState.inactive:
        onInactive();
        break;
      case AppLifecycleState.paused:
        onPaused();
        break;
      case AppLifecycleState.detached:
        onDetached();
        break;
      case AppLifecycleState.hidden:
        // TODO: Handle this case.
    }
  }

 ///if some state object values are updated/changed this method will inform you
 @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies");
  }


  /// called when your widget configuration/ styles/ values
  @override
  void didUpdateWidget(covariant LifecycleExampleScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  /// deactivate
 @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("deactivate");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
      title: 'Widget Example',
      onMenuPressed: () {
        Navigator.pushNamed(context, RouteGeneratorsNames.topicScreen);
      },
      onSearchPressed: () {
      },
    ),
      body: TextField(

      ),
    );
  }


  ///start example

  void onResumed(){
    print("calling on resumed: Became visible & user can interact with app");
  }

  void onPaused(){
    print("calling on onPaused: Not visible & user can't interact with app");
  }

  void onInteract(){
    print("calling on onInteract: user can interact with app");
  }
  void onInactive(){
    print("calling on onInactive: App is inactive, user can't interact with app");

  }
  void onDetached(){
    print("calling on onDetached: App suspended/closed");

  }
}

// stateless widget: lifecycle method build()

///steteful widget: lifecycle
///1. initState()
///2. dispose()
///3. didChangeAppLifecycleState
///4. build()
///5. didDipndecnyChange()
///6. didUpdateWidget()
///7. setsState()
///8. deactivate()

///example : music player app for app lifecycle

/// inactive
/// active
/// paused -> background - > resumed
/// resumned
/// detched ( stop)(remove)

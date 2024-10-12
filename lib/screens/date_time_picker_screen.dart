import 'package:flutter/material.dart';

import '../core/route_generator.dart';
import '../widgets/appbar_widget.dart';
class DateTimePickerScreen extends StatefulWidget {
  const DateTimePickerScreen({super.key});

  @override
  State<DateTimePickerScreen> createState() => _DateTimePickerScreenState();
}

class _DateTimePickerScreenState extends State<DateTimePickerScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selecetdTime = TimeOfDay.now();

  /// dd/mm/yy
  /// DD/MM/YY
  /// dd/mm/yyyy

  Future<void> _selectDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2023),
        lastDate: DateTime(2025));


    if(pickedDate != null && pickedDate != selectedDate){
      setState(() {
        selectedDate = pickedDate;
        print("picked date: $selectedDate");
      });
    }
  }
  Future<void> _selectTimePicker(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: selecetdTime);


    if(pickedTime != null && pickedTime != selecetdTime){
      setState(() {
        selecetdTime = pickedTime;
        print("picked time: $selecetdTime");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: 'Date Time Picker Example',
        onMenuPressed: () {
          Navigator.pushNamed(context, RouteGeneratorsNames.topicScreen);
        },
        onSearchPressed: () {
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Date picker"),
          Text("Show Selected Date: ${selectedDate.toLocal()}"),
          ElevatedButton(onPressed: (){
            _selectDatePicker(context);
          }, child: const Text("Open Date Picker")),
          const SizedBox(height: 30,),
          const Text("Time picker"),
          Text("Show Selected Time: ${selecetdTime.format(context)}"),
          ElevatedButton(onPressed: (){
            _selectTimePicker(context);
          }, child: const Text("Open Time Picker"))

        ],
      ),
    );
  }
}

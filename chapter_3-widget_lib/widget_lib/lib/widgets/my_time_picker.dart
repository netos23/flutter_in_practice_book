import 'package:flutter/material.dart';

class MyDatePicker extends StatefulWidget {
  const MyDatePicker({Key? key}) : super(key: key);

  @override
  _MyDatePickerState createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  DateTime _pickedDate = DateTime.now();
  TimeOfDay _pickedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2002),
      lastDate: DateTime(2027),
    );

    setState(() {
      _pickedDate = date != null ? date : _pickedDate;
    });
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    setState(() {
      _pickedTime = time != null ? time : _pickedTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_dateToString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton(
                    onPressed: () => _selectDate(context),
                    tooltip: 'Pick date when you last time watch tv series',
                    name: 'Pick date'),
                _buildButton(
                  onPressed: () => _selectTime(context),
                  tooltip: 'Pick time when you last time watch tv series',
                  name: 'Pick time',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  String _dateToString() {
    return 'Last view: '
        '${_pickedDate.day}.${_pickedDate.month}.${_pickedDate.year} '
        '${_pickedTime.hour}:${_pickedTime.minute}';
  }

  Padding _buildButton({
    required void Function() onPressed,
    required String tooltip,
    required String name,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Tooltip(
        message: tooltip,
        child: OutlinedButton(
          onPressed: onPressed,
          child: Text(name),
        ),
      ),
    );
  }
}

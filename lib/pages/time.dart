import 'package:flutter/material.dart';

class Time extends StatefulWidget {
  const Time({Key? key}) : super(key: key);

  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Time Picker'),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.greenAccent,
              ),
              onPressed: () {
                _getTime(context);
              },
            ),
            SizedBox(
              height: 15,
            ),
            Text('Time Value :' + _selectedTime.format(context),
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  _getTime(context) async {
    final _timePick = await showTimePicker(
        context: context,
        initialTime: _selectedTime,
        builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                alwaysUse24HourFormat: true,
              ),
              child: child!,
          );
        });

    if(_timePick != null) {
      setState(() {
        _selectedTime = _timePick;
      });
    }
  }
}
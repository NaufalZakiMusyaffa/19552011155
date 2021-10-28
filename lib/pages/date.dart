import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Date extends StatefulWidget {
  const Date({Key? key}) : super(key: key);

  @override
  _DateState createState() => _DateState();
}

class _DateState extends State<Date> {
  DateTime _selectedDate = DateTime.now();
  final DateFormat _dateFormat = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Date Picker'),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.redAccent,
              ),
              onPressed: () {
                _getDate(context);
              },
            ),
            SizedBox(
              height: 15,
            ),
            Text('Date Value : '+_dateFormat.format(_selectedDate),
              style: TextStyle(color: Colors.white),
            ),
          ],
        )
      ),
    );
  }

  _getDate(context) async {
    final _datePick = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: _selectedDate.subtract(Duration(days: 30)
        ),
        lastDate: DateTime(_selectedDate.year + 1),
    );

    if(_datePick != null) {
      setState(() {
        _selectedDate = _datePick;
      });
    }
  }
}
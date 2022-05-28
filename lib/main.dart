import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date Picker"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            selectDate.toString(),
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              showDatePicker(
                  context: context,
                  initialDate: selectDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2025),
                  //initialEntryMode: DatePickerEntryMode.calendar,
                  //initialDatePickerMode: DatePickerMode.day,
                  helpText: "Tolong",
                  cancelText: "nagk jadi",
                  textDirection: TextDirection.rtl,
                  fieldHintText: "Tanggal berapa lu lahir",
                  errorFormatText: "Error Njing",
                  errorInvalidText: "Masukin yg bener Kontol",
                  fieldLabelText: "seriuslah",
                  confirmText: "Yakin lu",
                  builder: (context, index) {
                    return Theme(data: ThemeData.dark(), child: index!);
                  },
                  selectableDayPredicate: (day) {
                    if ((day.isAfter(DateTime.now().subtract(Duration(
                          days: 2,
                        )))) &&
                        (day.isBefore(DateTime.now().add(Duration(days: 2))))) {
                      return true;
                    }
                    return false;
                  }).then(
                (value) {
                  setState(() {
                    selectDate = value!;
                  });
                },
              );
            },
            child: Text("Date Picker"),
          ),
        ],
      )),
    );
  }
}

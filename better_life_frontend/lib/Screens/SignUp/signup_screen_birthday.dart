import 'package:better_life_frontend/Screens/SignUp/try.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/cupertino.dart';

class RegiterDateOfBirth extends StatefulWidget {
  const RegiterDateOfBirth({super.key});

  @override
  State<RegiterDateOfBirth> createState() => _RegiterDateOfBirthState();
}

class _RegiterDateOfBirthState extends State<RegiterDateOfBirth> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 7),
              child: LinearProgressIndicator(
                value: 0.3,
                backgroundColor: Colors.grey,
                color: Colors.green,
              ),
            ),
            const Text(
              'Make your life better!',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 35, top: 30),
                child: const Text(
                  'Chose your birthday',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(
                height: 300,
                child: CupertinoTheme(
                  data: CupertinoThemeData(
                      textTheme: CupertinoTextThemeData(
                          dateTimePickerTextStyle: TextStyle(
                    fontSize: 30,
                    height: 1,
                  ))),
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: DateTime.now(),
                    minimumYear: 1950,
                    maximumDate: DateTime.now(),
                    onDateTimeChanged: (DateTime newDate) {
                      setState(() {
                        _selectedDate = newDate;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 120,
            left: 30,
            right: 10,
            child: const Text(
                'We use this data to provide correct infomation with you'),
          ),
          Positioned(
            height: 50,
            bottom: 50,
            left: 10,
            right: 10,
            child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'NEXT',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
          ),
        ],
      ),
    );
  }
}

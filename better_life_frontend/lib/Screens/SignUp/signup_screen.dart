import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:io';

class GenderRegisterScreen extends StatefulWidget {
  const GenderRegisterScreen({super.key});

  @override
  State<GenderRegisterScreen> createState() => _GenderRegisterScreenState();
}

class _GenderRegisterScreenState extends State<GenderRegisterScreen> {
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
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 35, top: 20),
                child: const Text(
                  'What\'s your gender?',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                elevation: 2.0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: Center(
                    child: const Text(
                      'Female',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                elevation: 2.0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: Center(
                    child: const Text(
                      'Male',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 120,
            left: 30,
            right: 10,
            child: const Text('We use this data to provide correct infomation with you'),
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

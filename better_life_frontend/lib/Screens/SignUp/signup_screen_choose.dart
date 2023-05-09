import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ChooseRegisterMethods extends StatelessWidget {
  const ChooseRegisterMethods({super.key});

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
          Positioned(
            top: 20,
            left: 33,
            right: 10,
            child: const Text(
                'We will provide you your personalized health plan!',
                style: TextStyle(fontSize: 30)),
          ),
          Positioned(
            bottom: 400,
            left: 20,
            right: 20,
            height: 60,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Signup with Apple',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            bottom: 320,
            left: 20,
            right: 20,
            height: 60,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Signup with Google',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            bottom: 240,
            left: 20,
            right: 20,
            height: 60,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Continue with email',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
              bottom: 80,
              left: 33,
              right: 20,
              height: 60,
              child: const Text(
                'By continuing, you agree to BetterLife\'s Terms&Conditions and Privacy Policy',
                style: TextStyle(fontSize: 20),
              )),
        ],
      ),
    );
  }
}

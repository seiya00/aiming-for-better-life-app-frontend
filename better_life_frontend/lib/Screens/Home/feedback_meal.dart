import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FeedbackMeal extends StatefulWidget {
  const FeedbackMeal({super.key});

  @override
  State<FeedbackMeal> createState() => _FeedbackMealState();
}

class _FeedbackMealState extends State<FeedbackMeal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 50,
            height: 500,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                splashColor: Colors.green.withAlpha(50),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FeedbackMeal()));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      '食事についてのフィードバック',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text('今日もその調子でいきましょう！'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

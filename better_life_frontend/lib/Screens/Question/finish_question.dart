import 'package:better_life_frontend/Screens/Home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class Celebration extends StatefulWidget {
  const Celebration({super.key});

  @override
  State<Celebration> createState() => _CelebrationState();
}

class _CelebrationState extends State<Celebration> {
  ConfettiController _confettiController = ConfettiController();

  @override
  void initState() {
    _confettiController = ConfettiController();
    _confettiController.play();
    super.initState();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        if (platform == TargetPlatform.iOS)
          CupertinoPageScaffold(
              child: Center(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Home())
                  );
                },
                child: SizedBox(
                  width: 300,
                  height: 170,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          '🎉質問を完了しました🎉',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          '回答を元に必要な情報を提供いたします',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'タップして終了します',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                ),
              ),
            ),
          )),
        if (platform == TargetPlatform.android)
          Scaffold(
            body: Center(
              child: Card(
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home())
                    );
                  },
                  child: SizedBox(
                    width: 300,
                    height: 170,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          '🎉質問を完了しました🎉',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          '回答を元に必要な情報を提供いたします',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'タップして終了します',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ConfettiWidget(
          confettiController: _confettiController,
          shouldLoop: false,
          blastDirectionality: BlastDirectionality.explosive,
        )
      ],
    );
  }
}

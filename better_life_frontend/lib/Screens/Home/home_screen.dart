import 'package:better_life_frontend/Screens/Home/feedback_meal.dart';
import 'package:better_life_frontend/Screens/Question/meal_question.dart';
import 'package:better_life_frontend/Screens/Question/sleep_question.dart';
import 'package:better_life_frontend/Screens/Question/exercise_question.dart';
import 'package:better_life_frontend/global_state.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:confetti/confetti.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  bool _isTappedPlusButton = false;
  double _scale = 0.1;
  late AnimationController _animationController;
  int _currentBottomNavigationBarIndex = 0;
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

  void isTappedBottomNavigationBar(int index) {
    setState(() {
      _currentBottomNavigationBarIndex = index;
      if (_isTappedPlusButton) {
        _isTappedPlusButton = false;
      }
    });
  }

  Widget _buildContent() {
    var globalState = Provider.of<GlobalState>(context);
    bool isFinishedMealQuestion = globalState.isFinishedMealQuestion;
    bool isFinishedSleepQuestion = globalState.isFinishedSleepQuestion;
    bool isFinishedExerciseQuestion = globalState.isFinishedExerciseQuestion;
    bool isFinishedAllQuestion = false;
    if (isFinishedMealQuestion == true && isFinishedSleepQuestion == true) {
      setState(() {
        isFinishedAllQuestion = true;
      });
    }

    if (_isTappedPlusButton) {
      return Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isFinishedMealQuestion == false)
              Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MealQuestion()));
                    },
                    child: Container(
                      width: 300,
                      alignment: Alignment.center,
                      height: 170,
                      child: Stack(children: [
                        ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.5),
                                BlendMode.srcOver),
                            child: Image.asset(
                              'assets/images/lily-banse--YHSwy6uqvk-unsplash.jpg',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            )),
                        const Center(
                          child: Text(
                            '食事',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ]),
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
            // if (isFinishedExerciseQuestion == false)
            //   Card(
            //       elevation: 3,
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(20)),
            //       clipBehavior: Clip.hardEdge,
            //       child: InkWell(
            //         splashColor: Colors.blue.withAlpha(30),
            //         onTap: () {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => const ExerciseQuestion()));
            //         },
            //         child: Container(
            //           alignment: Alignment.center,
            //           width: 300,
            //           height: 170,
            //           child: Stack(children: [
            //             ColorFiltered(
            //                 colorFilter: ColorFilter.mode(
            //                     Colors.black.withOpacity(0.5),
            //                     BlendMode.srcOver),
            //                 child: Image.asset(
            //                   'assets/images/brian-erickson-XFneC_rHR48-unsplash.jpg',
            //                   fit: BoxFit.cover,
            //                   width: double.infinity,
            //                   height: double.infinity,
            //                 )),
            //             const Center(
            //               child: Text(
            //                 '運動',
            //                 style: TextStyle(
            //                     fontSize: 24,
            //                     fontWeight: FontWeight.bold,
            //                     color: Colors.white),
            //               ),
            //             ),
            //           ]),
            //         ),
            //       )),
            //   const SizedBox(
            //     height: 20,
            //   ),
            if (isFinishedSleepQuestion == false)
              Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SleepQuestion()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 300,
                      height: 170,
                      child: Stack(children: [
                        ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.3),
                                BlendMode.srcOver),
                            child: Image.asset(
                              'assets/images/gregory-pappas-rUc9hVE-L-E-unsplash.jpg',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            )),
                        const Center(
                          child: Text(
                            '睡眠',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ]),
                    ),
                  )),
            if (isFinishedAllQuestion)
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Center(
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
                                '🎉全ての質問を完了しました🎉',
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
                                'タップしてホームに戻ります',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
          ],
        ),
      );
    } else {
      if (_currentBottomNavigationBarIndex == 0) {
        return SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                // GestureDetector(
                //   onVerticalDragUpdate: (details) {
                //     setState(() {
                //       _scale += details.delta.dy * 0.001;
                //     });
                //   },
                //   onVerticalDragEnd: (details) {
                //     _animationController.reverse();
                //   },
                //   child: Positioned(
                //     top: 0,
                //     left: 0,
                //     right: 0,
                //     bottom: null,
                //     child: Align(
                //       alignment: Alignment.topCenter,
                //       child: Transform.scale(
                //         scale: _scale * _animationController.value,
                //         child: Container(
                //           width: 350,
                //           height: 500,
                //           decoration: BoxDecoration(
                //               shape: BoxShape.circle,
                //               color: Colors.orange.withOpacity(0.3)),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                const Positioned(
                    top: 100,
                    left: 0,
                    right: 0,
                    bottom: null,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '今日の調子はどうですか？',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )),
                Positioned(
                  top: 200,
                  left: 10,
                  right: 10,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // SizedBox(
                          //     height: 200,
                          //     width: 350,
                          //     child: Card(
                          //       elevation: 5,
                          //       shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(24),
                          //       ),
                          //       child: Column(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         crossAxisAlignment: CrossAxisAlignment.center,
                          //         children: const [
                          //           Text(
                          //             '昨日は素晴らしかったです',
                          //             style: TextStyle(
                          //                 fontSize: 18,
                          //                 fontWeight: FontWeight.bold),
                          //           ),
                          //           SizedBox(
                          //             height: 30,
                          //           ),
                          //           Text('今日もその調子でいきましょう！'),
                          //         ],
                          //       ),
                          //     )),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          SizedBox(
                            height: 200,
                            width: 350,
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
                                      MaterialPageRoute(builder: (context) => const FeedbackMeal())
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Text(
                                        '食事についてのフィードバック',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text('今日もその調子でいきましょう！'),
                                    ],
                                  ),
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              height: 200,
                              width: 350,
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      '睡眠についてのフィードバック',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text('今日もその調子でいきましょう！'),
                                  ],
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              height: 200,
                              width: 350,
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      '運動についてのフィードバック',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text('今日もその調子でいきましょう！'),
                                  ],
                                ),
                              )),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        return SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                // GestureDetector(
                //   onVerticalDragUpdate: (details) {
                //     setState(() {
                //       _scale += details.delta.dy * 0.001;
                //     });
                //   },
                //   onVerticalDragEnd: (details) {
                //     _animationController.reverse();
                //   },
                //   child: Positioned(
                //     top: 0,
                //     left: 0,
                //     right: 0,
                //     bottom: null,
                //     child: Align(
                //       alignment: Alignment.topCenter,
                //       child: Transform.scale(
                //         scale: _scale * _animationController.value,
                //         child: Container(
                //           width: 350,
                //           height: 500,
                //           decoration: BoxDecoration(
                //               shape: BoxShape.circle,
                //               color: Colors.orange.withOpacity(0.3)),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                const Positioned(
                    top: 100,
                    left: 0,
                    right: 0,
                    bottom: null,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '今日の調子はどうですか？',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )),
                Positioned(
                  top: 200,
                  left: 10,
                  right: 10,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 200,
                              width: 350,
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      '昨日はあまり良くなかったですね',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text('今日は健康に気を使いましょう！'),
                                  ],
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              height: 200,
                              width: 350,
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      '食事についてのフィードバック',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text('今日もその調子でいきましょう！'),
                                  ],
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              height: 200,
                              width: 350,
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      '睡眠についてのフィードバック',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text('今日もその調子でいきましょう！'),
                                  ],
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              height: 200,
                              width: 350,
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      '運動についてのフィードバック',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text('今日もその調子でいきましょう！'),
                                  ],
                                ),
                              )),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Better Life',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: _buildContent(),
      bottomNavigationBar: Stack(children: [
        BottomNavigationBar(
          currentIndex: _currentBottomNavigationBarIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 35,
          selectedItemColor: Colors.green,
          onTap: isTappedBottomNavigationBar,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.assessment), label: 'Analysis')
          ],
        ),
        Positioned(
          bottom: 40,
          left: MediaQuery.of(context).size.width / 2 - 28,
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                _isTappedPlusButton = true;
              });
            },
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),
          ),
        )
      ]),
    );
  }
}

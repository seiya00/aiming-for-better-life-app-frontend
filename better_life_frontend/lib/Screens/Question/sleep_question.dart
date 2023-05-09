import 'package:better_life_frontend/Screens/Question/finish_question.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:better_life_frontend/global_state.dart';
import 'package:provider/provider.dart';
import 'package:better_life_frontend/Screens/Home/api.dart';

class SleepQuestion extends StatefulWidget {
  const SleepQuestion({super.key});

  @override
  State<SleepQuestion> createState() => _SleepQuestionState();
}

class _SleepQuestionState extends State<SleepQuestion> {
  List<dynamic> mealQuestionsList = [];
  String currentMealQuestion = '';
  int currentQuestionIndex = 0;
  List filterdAnswersList = [];
  List<String> excludeKeys = [
    'id',
    'question',
    'question_type',
    'answer_type',
    'is_neccessary',
  ];
  Map<String, dynamic> currentMealQuestionMapIncludeOtherFields = {};
  Map<String, bool> isSelected = {};
  dynamic selectedAnswer;
  bool isLoading = false;
  String answer = '';
  // これより下はpost用のデータ
  int? questionId;
  int? vegetableId;
  String answerType = '';
  String? answerChoice;
  bool? answerBool;
  int? answerInt;

  Future<void> _enterData(inputData) async {
    final token = await getToken();
    setState(() {
      if (mealQuestionsList.any((element) => element.containsKey('question'))) {
        questionId = mealQuestionsList[currentQuestionIndex]['id'];
        vegetableId = null;
        answerType = mealQuestionsList[currentQuestionIndex]['answer_type'];
        print(answerType);
        print(currentQuestionIndex);
        if (answerType == '選択式') {
          answerChoice = inputData;
          answerBool = null;
          answerInt = null;
        } else if (answerType == '真偽値') {
          answerChoice = null;
          answerBool = inputData;
          answerInt = null;
        } else if (answerType == '数字') {
          answerChoice = null;
          answerBool = null;
          answerInt = inputData;
        }
      }
    });
    var uri = Uri.parse('http://127.0.0.1:8000/api/answer/');
    var response = await http.post(uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token',
        },
        body: jsonEncode({
          'question': questionId,
          'vegetable': vegetableId,
          'answer_type': answerType,
          'answer_choice': answerChoice,
          'answer_int': answerInt,
          'answer_bool': answerBool,
        }));
    if (response.statusCode == 201) {
      print('Data posted successfully');
    } else {
      throw Exception('Failed to post Data');
    }
  }

  // Future<String> _getCurrentQuestion() async {
  //   questionsList = await _getQuestions();
  //   questionsMealList = questionsList.where((map) => map['question_type'] == '食事').toList();
  //   return questionsMealList[currentQuestionIndex]['question'];
  // }

  @override
  void initState() {
    super.initState();
    isLoading = true;
    getQuestions().then((fetchedData) {
      setState(() {
        currentQuestionIndex = 0;
        mealQuestionsList =
            fetchedData.where((map) => map['question_type'] == '睡眠').toList();
        // print('mealQuestionsList');
        // print(mealQuestionsList);
        currentMealQuestion =
            mealQuestionsList[currentQuestionIndex]['question'];
        currentMealQuestionMapIncludeOtherFields =
            mealQuestionsList[currentQuestionIndex];
        filterdAnswersList = currentMealQuestionMapIncludeOtherFields.entries
            .where((entry) =>
                !excludeKeys.contains(entry.key) &&
                entry.value != null &&
                entry.value != '')
            .toList();
        filterdAnswersList.forEach((entry) {
          if (!excludeKeys.contains(entry.key) &&
              !isSelected.containsKey(entry.key)) {
            isSelected[entry.key] = false;
          }
        });
        isLoading = false;
      });
    });
  }

  void _nextQuestion(inputData, BuildContext context) async {
    await _enterData(inputData);
    setState(() {
      if (currentQuestionIndex < mealQuestionsList.length - 1) {
        currentQuestionIndex++;
        isSelected.clear();
        selectedAnswer = '';
        currentMealQuestion =
            mealQuestionsList[currentQuestionIndex]['question'];
        currentMealQuestionMapIncludeOtherFields =
            mealQuestionsList[currentQuestionIndex];
        filterdAnswersList = currentMealQuestionMapIncludeOtherFields.entries
            .where((entry) =>
                !excludeKeys.contains(entry.key) &&
                entry.value != null &&
                entry.value != '')
            .toList();
        filterdAnswersList.forEach((entry) {
          if (!excludeKeys.contains(entry.key) &&
              !isSelected.containsKey(entry.key)) {
            isSelected[entry.key] = false;
          }
        });
      } else {
        final globalState = Provider.of<GlobalState>(context, listen: false);
        globalState.setIsFinishedSleepQuestion(true);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Celebration())
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 50),
                      child: Text(
                        currentMealQuestion,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: filterdAnswersList.length,
                          itemBuilder: (context, index) {
                            final entry = filterdAnswersList[index];
                            if (entry.value == true) {
                              answer = 'はい';
                            } else if (entry.value == false) {
                              answer = 'いいえ';
                            } else {
                              answer = entry.value;
                            }
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 13),
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isSelected.forEach((key, value) {
                                        isSelected[key] = false;
                                      });
                                      isSelected[entry.key] = true;
                                      selectedAnswer = entry.value;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          isSelected[entry.key] == true
                                              ? Colors.green
                                              : Colors.grey,
                                      minimumSize:
                                          const Size(double.infinity, 95)),
                                  child: Text(
                                    answer,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  )),
                            );
                          }),
                    ),
                    // const Spacer(flex: 1),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30, right: 10, left: 10),
                      child: ElevatedButton(
                          onPressed: () {
                            if (!isSelected.values.any((value) => value)) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('エラー！'),
                                    content: const Text('選択肢を必ず一つ選択してください！'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('閉じる'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              _nextQuestion(selectedAnswer, context);
                            }
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green, minimumSize: const Size(double.infinity, 70)),
                          child: const Text(
                            'NEXT',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                )),
    );
  }
}

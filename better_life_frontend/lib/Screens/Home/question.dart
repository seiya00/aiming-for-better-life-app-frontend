// import 'dart:ffi';
// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class Question extends StatefulWidget {
//   const Question({super.key});

//   @override
//   State<Question> createState() => _QuestionState();
// }


// class _QuestionState extends State<Question> {
//   late Future<String> currentQuestion = _getCurrentQuestion();
//   late Future<Widget> answer;
//   List<dynamic> currentQuestionAnswers = [];
//   List<dynamic> questionsMealList = [];
//   List<dynamic> recievedData = [];
//   Map<String, dynamic> currentQuestionList = {};
//   int currentQuestionIndex = 0;
//   String selectedAnswer = '';
//   int atAnswer = 1;
//   List<dynamic> answers = [];
//   List<dynamic> questionsList = [];
//   // String currentQuestion = '';
//   List<MapEntry<String, dynamic>> filteredAnswers = [];
//   int answerCount = 0;
//   List<String> extractKeys = [
//     'id',
//     'question',
//     'question_type',
//     'answer_type',
//     'is_neccessary',
//   ];
//   Map<String, bool> isSelected = {};
//   String answer = '';
//   // ここから下がhttp.post用のデータ
//   dynamic questionId = 0;
//   dynamic vegetableId = 0;
//   String answerType = '';
//   dynamic answerChoice = '';
//   dynamic answerBool = false;
//   dynamic answerInt = 1;

//   Future<String> _getToken() async {
//     var uri = Uri.parse('http://127.0.0.1:8000/api/user/token/');
//     var response = await http.post(uri,
//         body: {'email': 'test@example.com', 'password': 'Testpass123'});
//     if (response.statusCode == 200) {
//       print('successed to get token');
//     } else {
//       throw Exception('Failed to get token');
//     }
//     var data = jsonDecode(response.body);
//     return data['token'];
//   }

//   Future<List<dynamic>> _getQuestions() async {
//     String token = await _getToken();
//     var uri = Uri.parse('http://127.0.0.1:8000/api/questions/');
//     var response =
//         await http.get(uri, headers: {'Authorization': 'Token $token'});
//     if (response.statusCode == 200) {
//       final data = jsonDecode(const Utf8Decoder().convert(response.bodyBytes));
//       // print(data);
//       return data;
//     } else {
//       throw Exception('Failed to load questions');
//     }
//   }

//   Future<String> _getCurrentQuestion() async {
//     questionsList = await _getQuestions();
//     questionsMealList = questionsList.where((map) => map['question_type'] == '食事').toList();
//     return questionsMealList[currentQuestionIndex]['question'];
//   }

//   Future<String> _getCurrentQuestionAnswers() async {
//     questionsList = await _getQuestions();
//     questionsMealList = questionsList.where((map) => map['question_type'] == '食事').toList();
//     filteredAnswers = currentQuestionList.entries
//       .where((entry) =>
//           !extractKeys.contains(entry.key) &&
//           entry.value != null &&
//           entry.value != '')
//       .toList();
//     return
//   }

//   Future<void> _enterData(inputData) async {
//     String token = await _getToken();
//     questionsList = await _getQuestions();
//     // print(questions.any((element) => element.containsKey('question')));
//     if (questionsList.any((element) => element.containsKey('question'))) {
//       questionId = questionsList[currentQuestionIndex]['id'];
//       vegetableId = null;
//       answerType = questionsList[currentQuestionIndex]['answer_type'];
//       if (answerType == '選択式') {
//         answerChoice = inputData;
//         answerBool = null;
//         answerInt = null;
//       } else if (answerType == '真偽値') {
//         answerChoice = null;
//         answerBool = inputData;
//         answerInt = null;
//       } else if (answerType == '数字') {
//         answerChoice = null;
//         answerBool = null;
//         answerInt = inputData;
//       }
//     }
//     // print(questionId);
//     // print(vegetableId);
//     // print(answerType);
//     // print(answerChoice);
//     // print(answerInt);
//     // print(answerBool);
//     var uri = Uri.parse('http://127.0.0.1:8000/api/answer/');
//     var response = await http.post(uri,
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Token $token',
//         },
//         body: jsonEncode({
//           'question': questionId,
//           'vegetable': vegetableId,
//           'answer_type': answerType,
//           'answer_choice': answerChoice,
//           'answer_int': answerInt,
//           'answer_bool': answerBool,
//         }));
//     if (response.statusCode == 201) {
//       print('Data posted successfully');
//     } else {
//       throw Exception('Failed to post Data');
//     }
//   }

//   Widget _buildAnswerButton(String answer) {
//     return ElevatedButton(
//       onPressed: () {
//         setState(() {
//           selectedAnswer = answer;
//         });
//       },
//       style: ElevatedButton.styleFrom(
//         backgroundColor: selectedAnswer == answer ? Colors.blue : Colors.grey,
//       ),
//       child: Text(answer),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     _getQuestions().then((fetchedQuestions) {
//       questionsMealList = fetchedQuestions
//         .where((map) => map['question_type'] == '食事')
//         .toList();
//       currentQuestionList = questionsMealList[currentQuestionIndex];
//       currentQuestion = _getCurrentQuestion();
//       filteredAnswers = currentQuestionList.entries
//         .where((entry) =>
//             !extractKeys.contains(entry.key) &&
//             entry.value != null &&
//             entry.value != '')
//         .toList();
//       print('filterAnswer');
//       print(filteredAnswers);
//       filteredAnswers.forEach((entry) {
//         if (!extractKeys.contains(entry.key) &&
//             !isSelected.containsKey(entry.key)) {
//           isSelected[entry.key] = false;
//         }
//         print('isSelected');
//         print(isSelected);
//       });
//     });
//   }

//   void _nextQuestion() {
//     setState(() {
//       if (currentQuestionIndex < questionsMealList.length - 1) {
//         currentQuestionIndex++;
//       } else {
//         currentQuestionIndex = 0;
//       }
//       filteredAnswers.forEach((entry) {
//         if (!extractKeys.contains(entry.key) &&
//             !isSelected.containsKey(entry.key)) {
//           isSelected[entry.key] = false;
//         }
//         print('isSelected');
//         print(isSelected);
//       });
//       selectedAnswer = '';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Expanded(
//               flex: 1,
//               child: Center(
//                 child: Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: FutureBuilder(
//                       future: currentQuestion,
//                       builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//                         if (snapshot.connectionState == ConnectionState.waiting) {
//                           return const CircularProgressIndicator();
//                         } else if (snapshot.hasData) {
//                           return Text(
//                             snapshot.data!,
//                             style: const TextStyle(fontSize: 29),
//                           );
//                         } else {
//                           return const Text('No data available!');
//                         }
//                       }
//                     )),
//               ),
//             ),
//             Expanded(
//                 flex: 6,
//                 child: Center(
//                   child: FutureBuilder<List<MapEntry<String, dynamic>>>(
//                     future: ,
//                     builder: (BuildContext context, AsyncSnapshot<List<MapEntry<String, dynamic>>> snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return const CircularProgressIndicator();
//                       } else if (snapshot.hasData) {
//                         filteredAnswers = snapshot.data!;
//                       } else {
//                         return const Text('No data available!');
//                       }
//                     },
//                   )
//                     child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: filteredAnswers.length,
//                         itemBuilder: (context, index) {
//                           final entry = filteredAnswers[index];
//                           if (entry.value == true) {
//                             answer = 'はい';
//                           } else if (entry.value == false) {
//                             answer = 'いいえ';
//                           } else {
//                             answer = entry.value;
//                           }
//                           return Container(
//                             padding: const EdgeInsets.only(
//                                 bottom: 30, right: 20, left: 20),
//                             height: 120,
//                             child: ElevatedButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     isSelected.forEach((key, value) {
//                                       isSelected[key] = false;
//                                     });
//                                     isSelected[entry.key] = true;
//                                     selectedAnswer = entry.value;
//                                   });
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: isSelected[entry.key] == true
//                                       ? Colors.green
//                                       : Colors.grey,
//                                 ),
//                                 child: Text(answer,
//                                     style: const TextStyle(fontSize: 25))),
//                           );
//                         }),
//                   ],
//                 ))),
//             Expanded(
//                 flex: 1,
//                 child: Container(
//                   padding:
//                       const EdgeInsets.only(left: 20, right: 20, bottom: 30),
//                   child: ElevatedButton(
//                       onPressed: () {
//                         if (!isSelected.values.any((value) => value)) {
//                           showDialog(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return AlertDialog(
//                                 title: const Text('エラー！'),
//                                 content: const Text('選択肢を必ず一つ選択してください！'),
//                                 actions: <Widget>[
//                                   TextButton(
//                                     child: const Text('閉じる'),
//                                     onPressed: () {
//                                       Navigator.of(context).pop();
//                                     },
//                                   ),
//                                 ],
//                               );
//                             },
//                           );
//                         } else {
//                           if (selectedAnswer == 'はい') {
//                             _enterData(true);
//                           } else if (selectedAnswer == 'いいえ') {
//                             _enterData(false);
//                           } else {
//                             _enterData(selectedAnswer);
//                           }
//                           _nextQuestion();
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.green),
//                       child: const Text(
//                         'NEXT',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       )),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }

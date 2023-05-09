import 'package:flutter/material.dart';

class Mismatch extends StatefulWidget {
  const Mismatch({super.key});

  @override
  State<Mismatch> createState() => _MismatchState();
}

class _MismatchState extends State<Mismatch> {
  Widget _buildCard(String enterText) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 30,
      height: 150,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
            splashColor: Colors.green.withAlpha(30),
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    enterText,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '現代環境と遺伝子の悲しいすれ違い',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 70,
                ),
                _buildCard('今の人間は現代環境に適応できていない'),
                const SizedBox(
                  height: 15,
                ),
                _buildCard('食のミスマッチ'),
                const SizedBox(
                  height: 15,
                ),
                _buildCard('睡眠のミスマッチ'),
                const SizedBox(
                  height: 15,
                ),
                _buildCard('運動のミスマッチ')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
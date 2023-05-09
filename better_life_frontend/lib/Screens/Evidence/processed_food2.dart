import 'package:flutter/material.dart';

class ProcessedFoodVersionTwo extends StatefulWidget {
  const ProcessedFoodVersionTwo({super.key});

  @override
  State<ProcessedFoodVersionTwo> createState() =>
      _ProcessedFoodVersionTwoState();
}

class _ProcessedFoodVersionTwoState extends State<ProcessedFoodVersionTwo> {
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
                        color: Colors.red),
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
          '超加工食品の危険性について',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                _buildCard('超加工食品の中毒性について'),
                const SizedBox(
                  height: 15,
                ),
                _buildCard('超加工食品が体や脳に与えるダメージについて'),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

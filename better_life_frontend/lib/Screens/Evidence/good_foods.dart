import 'package:flutter/material.dart';

class GoodFoods extends StatefulWidget {
  const GoodFoods({super.key});

  @override
  State<GoodFoods> createState() => _GoodFoodsState();
}

class _GoodFoodsState extends State<GoodFoods> {
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
          '科学的に証明された食べ物',
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                _buildCard('野菜'),
                const SizedBox(
                  height: 15,
                ),
                _buildCard('肉'),
                const SizedBox(
                  height: 15,
                ),
                _buildCard('魚介類')
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:greentick_assesment/widgets/connectUs/connectUs.dart';
import 'package:greentick_assesment/widgets/Favourites/favSection.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            SizedBox(height: 20),
            RecommendationsWidget(),
            SizedBox(height: 20),
            ConnectUsWidget(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greentick_assesment/home.dart';

void main() {
  runApp(const GreenTickApp());
}

class GreenTickApp extends StatelessWidget {
  const GreenTickApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GreenTick Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      home: const MyHomePage(
        title: 'GreenTick',
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:greentick_assesment/utils/fontStyle.dart';

class ConnectUsWidget extends StatelessWidget {
  const ConnectUsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          const Text(
            "Any Suggestions?",
            style: aHeadingText,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Connect Us"),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:greentick_assesment/utils/colors.dart';
import 'package:greentick_assesment/utils/fontStyle.dart';

class Titlebar extends StatelessWidget {
  const Titlebar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        Expanded(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: const [
              Icon(
                Icons.thumb_up,
                color: aRedColor,
              ),
              SizedBox(width: 15),
              Text(
                'Recommended for You',
                style: aHeadingText,
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Products List"),
              ),
            );
          },
          child: const Text(
            "View All",
            style: TextStyle(
              color: aRedColor,
            ),
          ),
        )
      ],
    );
  }
}

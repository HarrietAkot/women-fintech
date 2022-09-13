import 'package:flutter/material.dart';
import 'package:jebajeba_beta/theme/colors.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String bodyText;
  final IconData icon;
  final Color? color;
  final VoidCallback confirmationAction;

  const CustomDialog({
    Key? key,
    required this.title,
    required this.bodyText,
    required this.icon,
    this.color,
    required this.confirmationAction,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              size: 15,
              color: color ?? kBrandMain,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.bold,
              color: color ?? kBrandMain,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      content: Text(
        bodyText,
        style: const TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "CANCEL",
            style: TextStyle(
              fontSize: 12,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        TextButton(
          onPressed: confirmationAction,
          child: const Text(
            "PROCEED",
            style: TextStyle(
              fontSize: 12,
              color: kBrandMain,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

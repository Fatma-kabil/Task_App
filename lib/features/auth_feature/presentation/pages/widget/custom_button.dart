import 'package:flutter/material.dart';
import 'package:task_app/core/constants.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          padding: EdgeInsets.zero,
          backgroundColor: kPrimaryColor,
          elevation: 3,
        ),
        child: Ink(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              buttonText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

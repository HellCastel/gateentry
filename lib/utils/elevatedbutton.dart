import 'package:flutter/material.dart';
import 'package:ge_process/utils/fonts.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CommonButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black, // button color
        foregroundColor: Colors.white, // text color
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: CommonText.textDataBlock12Bgrey().copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}

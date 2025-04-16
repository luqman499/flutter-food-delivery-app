import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String letter; // "f" for Facebook, "G" for Google
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.letter,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.pink),
        child: Center(
          child: Text(
            letter,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

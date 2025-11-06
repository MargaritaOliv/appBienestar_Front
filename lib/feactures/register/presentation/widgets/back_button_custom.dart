import 'package:flutter/material.dart';

class BackButtonCustom extends StatelessWidget {
  final VoidCallback? onPressed;

  const BackButtonCustom({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? () => Navigator.pop(context),
      icon: const Icon(
        Icons.arrow_back,
        color: Color(0xFF2C2C2C),
        size: 24,
      ),
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
    );
  }
}
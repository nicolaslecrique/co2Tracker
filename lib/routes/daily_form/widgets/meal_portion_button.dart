import 'package:flutter/material.dart';

class MealPortionButton extends StatelessWidget {
  final String sizeText;

  const MealPortionButton({Key? key, required this.sizeText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () => {}, child: Text(sizeText));
  }
}

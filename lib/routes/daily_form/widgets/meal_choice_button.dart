import 'package:flutter/material.dart';

/*
TODO NICO: Bouger FoodChoice et faire le mapping type=>string ici
comme ça ici on a footType et MealType, et on peut appeler le model.updateMealChoice(mealtype, foodtype)
avec un consumer:
=> pas de callback a passer au parent, la gui d'un boutton et dans le boutton
=> on peut appliquer ça partout comme ça c'est clair et coherent
*/
class MealChoiceButton extends StatelessWidget {
  final List<String> foodList;
  final bool isSelected;

  const MealChoiceButton({Key? key, required this.foodList, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Column(
        children: List<Text>.unmodifiable(foodList.map((e) => Text(e))),
      ),
    );
  }
}

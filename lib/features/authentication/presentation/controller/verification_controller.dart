import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tibobit_flutter/core/calculators/card_position_calculator.dart';
import 'package:tibobit_flutter/core/calculators/content_height_calculator.dart';

class VerificationCardController extends GetxController {
  var selectedCard = (-1).obs;
  late final CardPositionCalculator positionCalculator;

  @override
  void onInit() {
    super.onInit();
    positionCalculator = CardPositionCalculator(selectedCard: -1);
  }

  void toggleCard(int index) {
    selectedCard.value = (selectedCard.value == index) ? -1 : index;
    positionCalculator.selectedCard = selectedCard.value;
  }

  double calculateContentHeight(BuildContext context) {
    return ContentHeightCalculator(
      context: context,
      positionCalculator: positionCalculator,
      selectedCard: selectedCard.value,
    ).calculate();
  }
}

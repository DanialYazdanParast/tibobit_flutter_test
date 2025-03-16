import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import 'card_position_calculator.dart';

class ContentHeightCalculator {
  static const double _defaultHeightRatio = 0.7;
  static const double _extraPadding = 100.0;
  static const int _lastCardIndex = 2;

  final BuildContext context;
  final CardPositionCalculator positionCalculator;
  final int selectedCard;

  const ContentHeightCalculator({
    required this.context,
    required this.positionCalculator,
    required this.selectedCard,
  });

  double calculate() {
    return selectedCard == -1
        ? _calculateDefaultHeight()
        : _calculateExpandedHeight();
  }

  double _calculateDefaultHeight() {
    return MediaQuery.of(context).size.height * _defaultHeightRatio;
  }

  double _calculateExpandedHeight() {
    final lastCardPosition = positionCalculator.getCardPosition(_lastCardIndex);
    return lastCardPosition + AppConstants.cardBaseHeight + _extraPadding;
  }
}

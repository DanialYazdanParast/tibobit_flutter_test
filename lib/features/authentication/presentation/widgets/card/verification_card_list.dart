import 'package:flutter/material.dart';
import 'package:tibobit_flutter/core/calculators/card_position_calculator.dart';
import 'package:tibobit_flutter/core/calculators/content_height_calculator.dart';
import 'package:tibobit_flutter/core/constants/app_constants.dart';
import 'package:tibobit_flutter/models/card_data.dart';
import 'identity_card.dart';

class VerificationCardList extends StatefulWidget {
  const VerificationCardList({super.key});

  @override
  State<VerificationCardList> createState() => _VerificationCardListState();
}

class _VerificationCardListState extends State<VerificationCardList> {
  int selectedCard = -1;
  late final CardPositionCalculator _positionCalculator;

  @override
  void initState() {
    super.initState();
    _positionCalculator = CardPositionCalculator(selectedCard: -1);
  }

  void toggleCard(int index, bool isSelected) {
    setState(() {
      _positionCalculator.selectedCard = isSelected ? -1 : index;
      selectedCard = isSelected ? -1 : index;
    });
  }

  double _calculateContentHeight(BuildContext context) {
    return ContentHeightCalculator(
      context: context,
      positionCalculator: _positionCalculator,
      selectedCard: selectedCard,
    ).calculate();
  }

  @override
  Widget build(BuildContext context) {
    final cards = [0, 1, 2];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final contentHeight = _calculateContentHeight(context);

          return SingleChildScrollView(
            physics:
                contentHeight > constraints.maxHeight
                    ? const ClampingScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
            child: SizedBox(
              height: contentHeight,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned.fill(
                    child: Stack(
                      alignment: Alignment.topCenter,
                      clipBehavior: Clip.none,
                      children:
                          cards
                              .map((index) => _buildPositionedCard(index))
                              .toList(),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPositionedCard(int index) {
    final cardData = CardData.fromIndex(index);
    final isSelected = selectedCard == index;

    return AnimatedPositioned(
      duration: AppConstants.animationDuration,
      curve: Curves.easeInOut,
      top: _positionCalculator.getCardPosition(index),
      left: 0,
      right: 0,
      child: GestureDetector(
        onTap: () => toggleCard(index, isSelected),
        child: IdentityCard(
          title: cardData.title,
          amount: cardData.amount,
          selected: isSelected,
          expanded: isSelected,
        ),
      ),
    );
  }
}

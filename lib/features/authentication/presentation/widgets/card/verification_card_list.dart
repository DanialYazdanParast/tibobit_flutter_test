import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tibobit_flutter/core/constants/app_constants.dart';
import 'package:tibobit_flutter/features/authentication/presentation/controller/verification_controller.dart';
import 'package:tibobit_flutter/features/authentication/presentation/widgets/card/identity_card_expandable.dart';
import 'package:tibobit_flutter/models/card_data.dart';
import 'identity_card.dart';

class VerificationCardList extends StatelessWidget {
  const VerificationCardList({super.key});

  @override
  Widget build(BuildContext context) {
    final VerificationCardController controller = Get.put(
      VerificationCardController(),
    );
    final cards = [0, 1, 2];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Obx(() {
            final contentHeight = controller.calculateContentHeight(context);
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
                                .map(
                                  (index) =>
                                      _buildPositionedCard(controller, index),
                                )
                                .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }

  Widget _buildPositionedCard(
    VerificationCardController controller,
    int index,
  ) {
    final cardData = CardData.fromIndex(index);
    return Obx(() {
      final isSelected = controller.selectedCard.value == index;
      return AnimatedPositioned(
        duration: AppConstants.animationDuration,
        curve: Curves.easeInOut,
        top: controller.positionCalculator.getCardPosition(index),
        left: 0,
        right: 0,
        child: GestureDetector(
          onTap: () => controller.toggleCard(index),
          child: IdentityCard(
            //     controller: controller,
            title: cardData.title,
            amount: cardData.amount,
            selected: isSelected,
            expanded: isSelected,
            //   index: index,
          ),
        ),
      );
    });
  }
}

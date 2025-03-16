import 'package:tibobit_flutter/core/builders/expanded_content_builder.dart';
import 'package:tibobit_flutter/core/constants/app_constants.dart';
import 'package:tibobit_flutter/models/card_data.dart';

/// محاسبه‌گر موقعیت کارت‌ها
///
/// این کلاس مسئول محاسبه موقعیت عمودی هر کارت در صفحه است.
/// با توجه به وضعیت انتخاب کارت‌ها، موقعیت هر کارت را به صورت پویا محاسبه می‌کند.
class CardPositionCalculator {
  /// شماره کارت انتخاب شده
  /// اگر هیچ کارتی انتخاب نشده باشد، مقدار -1 خواهد داشت
  int selectedCard;

  /// سازنده کلاس محاسبه‌گر موقعیت کارت
  ///
  /// [selectedCard] شماره کارت انتخاب شده را مشخص می‌کند
  CardPositionCalculator({required this.selectedCard});

  /// محاسبه موقعیت عمودی کارت
  ///
  /// [index] شماره کارت مورد نظر
  ///
  /// مقدار برگشتی موقعیت عمودی کارت را به پیکسل مشخص می‌کند
  ///
  /// این متد سه حالت مختلف را در نظر می‌گیرد:
  /// 1. وقتی هیچ کارتی انتخاب نشده (selectedCard == -1)
  /// 2. وقتی کارت قبل از کارت انتخاب شده است
  /// 3. وقتی کارت بعد از کارت انتخاب شده است
  double getCardPosition(int index) {
    final basePosition = index * AppConstants.normalCardHeight;

    if (selectedCard == -1) {
      return basePosition;
    }

    if (index < selectedCard) {
      return basePosition;
    } else if (index == selectedCard) {
      return basePosition;
    } else {
      final selectedCardData = CardData.fromIndex(selectedCard);

      // محاسبه ارتفاع محتوای کارت انتخاب شده
      final contentHeight =
          (ExpandedContentBuilder.build(selectedCardData.title).length * 32.0) +
          (25.0) +
          AppConstants.cardBaseHeight;

      // محاسبه فضای اضافی برای کارت‌های بعدی
      final extraSpace = (contentHeight - AppConstants.normalCardHeight) * 0.8;
      final additionalOffset = (index - selectedCard - 1) * 5.0;

      return basePosition + extraSpace + additionalOffset;
    }
  }
}

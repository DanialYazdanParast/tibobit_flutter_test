import 'package:flutter/material.dart';
import 'package:tibobit_flutter/core/builders/expanded_content_builder.dart';
import 'package:tibobit_flutter/core/constants/app_constants.dart';

import 'card_header.dart';

/// ویجت نمایش کارت هویت
///
/// این ویجت مسئول نمایش اطلاعات هر سطح احراز هویت است
/// و قابلیت تغییر حالت بین حالت عادی و گسترش یافته را دارد
class IdentityCard extends StatelessWidget {
  /// عنوان کارت (مثلاً "احراز هویت سطح یک")
  final String title;

  /// مقدار نمایشی کارت (مثلاً "۱۰۰ میلیون تومان")
  final String amount;

  /// وضعیت انتخاب کارت
  final bool selected;

  /// وضعیت گسترش کارت
  final bool expanded;

  /// سازنده ویجت کارت هویت
  ///
  /// [title] عنوان کارت را مشخص می‌کند
  /// [amount] مقدار نمایشی کارت را مشخص می‌کند
  /// [selected] وضعیت انتخاب کارت را مشخص می‌کند
  /// [expanded] وضعیت گسترش کارت را مشخص می‌کند (پیش‌فرض: false)
  const IdentityCard({
    super.key,
    required this.title,
    required this.amount,
    required this.selected,
    this.expanded = false,
  });

  @override
  Widget build(BuildContext context) {
    // تعیین رنگ کارت بر اساس سطح و وضعیت انتخاب
    final isLevelOne = title.contains('سطح یک');
    final cardColor =
        isLevelOne
            ? AppConstants.levelOneCardColor
            : (selected
                ? AppConstants.selectedCardColor
                : AppConstants.defaultCardColor);

    return AnimatedContainer(
      duration: AppConstants.animationDuration,
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(
        horizontal: AppConstants.cardHorizontalPadding,
      ),
      padding: const EdgeInsets.all(AppConstants.cardVerticalPadding),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(AppConstants.cardBorderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            blurRadius: 20,
            spreadRadius: 5,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      // انیمیشن تغییر حالت بین عادی و گسترش یافته
      child: AnimatedCrossFade(
        duration: AppConstants.animationDuration,
        crossFadeState:
            expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        // نمایش حالت عادی
        firstChild: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [CardHeader(title: title, amount: amount)],
        ),
        // نمایش حالت گسترش یافته
        secondChild: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardHeader(title: title, amount: amount),
            const SizedBox(height: 16),
            ...ExpandedContentBuilder.build(title),
          ],
        ),
      ),
    );
  }
}

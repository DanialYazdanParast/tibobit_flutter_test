import 'package:flutter/material.dart';

import 'package:tibobit_flutter/features/authentication/presentation/widgets/verification_item.dart';

class ExpandedContentBuilder {
  static List<Widget> build(String title) {
    if (title.contains('سطح یک')) {
      return _buildLevelOneContent();
    } else if (title.contains('سطح دو')) {
      return _buildLevelTwoContent();
    } else {
      return _buildLevelThreeContent();
    }
  }

  static List<Widget> _buildLevelOneContent() {
    return [
      const VerificationItem(text: 'مدارک مورد نیاز سطح یک'),
      const VerificationItem(text: 'تصویر کارت ملی'),
      const VerificationItem(text: 'ویدیو چهره و تطبیق'),
      const SizedBox(height: 12),
      const VerificationItem(text: 'دسترسی ها و محدودیت های سطح یک'),
      const VerificationItem(text: 'سقف برداشت روزانه ۱۰۰ میلیون تومان'),
      const VerificationItem(text: 'سقف برداشت ماهیانه ۱۰۰ میلیون تومان'),
      const VerificationItem(text: 'سقف موجودی حساب ۱۰۰ میلیون تومان'),
    ];
  }

  static List<Widget> _buildLevelTwoContent() {
    return [
      const VerificationItem(text: 'مدارک مورد نیاز سطح دو'),
      const VerificationItem(text: 'تصویر کارت ملی'),
      const VerificationItem(text: 'ویدیو چهره و تطبیق'),
      const VerificationItem(text: 'تصویر شناسنامه'),
      const SizedBox(height: 12),
      const VerificationItem(text: 'دسترسی ها و محدودیت های سطح دو'),
      const VerificationItem(text: 'سقف برداشت روزانه ۴۰۰ میلیون تومان'),
      const VerificationItem(text: 'سقف برداشت ماهیانه ۲۵۰ میلیون تومان'),
      const VerificationItem(text: 'سقف موجودی حساب ۴۰۰ میلیون تومان'),
      const SizedBox(height: 12),
      const VerificationItem(text: 'دسترسی ها و محدودیت های سطح دو'),
      const VerificationItem(text: 'سقف برداشت روزانه ۴۰۰ میلیون تومان'),
      const VerificationItem(text: 'سقف برداشت ماهیانه ۲۵۰ میلیون تومان'),
      const VerificationItem(text: 'سقف موجودی حساب ۴۰۰ میلیون تومان'),
    ];
  }

  static List<Widget> _buildLevelThreeContent() {
    return [
      const VerificationItem(text: 'مدارک مورد نیاز سطح سه'),
      const VerificationItem(text: 'تصویر کارت ملی'),
      const VerificationItem(text: 'ویدیو چهره و تطبیق'),
      const VerificationItem(text: 'تصویر شناسنامه'),
      const VerificationItem(text: 'مدارک شغلی و درآمدی'),
      const SizedBox(height: 12),
      const VerificationItem(text: 'دسترسی ها و محدودیت های سطح سه'),
      const VerificationItem(text: 'سقف برداشت روزانه ۱ میلیارد تومان'),
      const VerificationItem(text: 'سقف برداشت ماهیانه نامحدود'),
      const VerificationItem(text: 'سقف موجودی حساب نامحدود'),
    ];
  }
}

class CardData {
  final String title;
  final String amount;

  const CardData({required this.title, required this.amount});

  // Factory method برای ساخت کارت‌ها بر اساس ایندکس
  factory CardData.fromIndex(int index) {
    switch (index) {
      case 0:
        return const CardData(
          title: 'احراز هویت سطح سه',
          amount: '۱ میلیارد تومان',
        );
      case 1:
        return const CardData(
          title: 'احراز هویت سطح دو',
          amount: '۴۰۰ میلیون تومان',
        );
      case 2:
        return const CardData(
          title: 'احراز هویت سطح یک',
          amount: '۱۰۰ میلیون تومان',
        );
      default:
        throw Exception('Invalid card index');
    }
  }

  // // برای مقایسه دو کارت
  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is CardData &&
  //         runtimeType == other.runtimeType &&
  //         title == other.title &&
  //         amount == other.amount;

  // @override
  // int get hashCode => title.hashCode ^ amount.hashCode;

  // // برای نمایش اطلاعات کارت به صورت رشته
  // @override
  // String toString() => 'CardData(title: $title, amount: $amount)';
}

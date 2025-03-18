// import 'package:flutter/material.dart';

// import 'package:expandable/expandable.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:tibobit_flutter/core/builders/expanded_content_builder.dart';
// import 'package:tibobit_flutter/core/constants/app_constants.dart';
// import 'package:tibobit_flutter/features/authentication/presentation/controller/verification_controller.dart';
// import 'package:tibobit_flutter/features/authentication/presentation/widgets/card/card_header.dart';

// class IdentityCardExpandable extends StatefulWidget {
//   final String title;
//   final String amount;
//   final bool selected;
//   final bool expanded;
//   final int index;
//   const IdentityCardExpandable({
//     super.key,
//     required this.index,
//     required this.title,
//     required this.amount,
//     required this.selected,
//     this.expanded = false,
//   });

//   @override
//   State<IdentityCardExpandable> createState() => _IdentityCardExpandableState();
// }

// class _IdentityCardExpandableState extends State<IdentityCardExpandable> {
//   final VerificationCardController controllerr =
//       Get.find<VerificationCardController>();

//   final ExpandableController _controller = ExpandableController();

//   @override
//   void initState() {
//     super.initState();
//     _controller.addListener(() {
//       if (_controller.expanded) {
//         _onExpanded();
//       } else {
//         _onCollapsed();
//       }
//     });
//   }

//   void _onExpanded() {
//     controllerr.toggleCard(widget.index);
//   }

//   void _onCollapsed() {
//     controllerr.toggleCard(-1);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isLevelOne = widget.title.contains('سطح یک');
//     final cardColor =
//         isLevelOne
//             ? AppConstants.levelOneCardColor
//             : (widget.selected
//                 ? AppConstants.selectedCardColor
//                 : AppConstants.defaultCardColor);

//     return ExpandableNotifier(
//       controller: _controller,
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: ScrollOnExpand(
//           child: Container(
//             clipBehavior: Clip.antiAlias,
//             margin: const EdgeInsets.symmetric(
//               horizontal: AppConstants.cardHorizontalPadding,
//             ),
//             padding: const EdgeInsets.all(AppConstants.cardVerticalPadding),
//             decoration: BoxDecoration(
//               color: cardColor,
//               borderRadius: BorderRadius.circular(
//                 AppConstants.cardBorderRadius,
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.8),
//                   blurRadius: 20,
//                   spreadRadius: 5,
//                   offset: const Offset(0, 8),
//                 ),
//               ],
//             ),
//             child: Column(
//               children: <Widget>[
//                 ExpandablePanel(
//                   theme: const ExpandableThemeData(
//                     headerAlignment: ExpandablePanelHeaderAlignment.center,
//                     tapBodyToExpand: true,
//                     tapBodyToCollapse: true,
//                     hasIcon: false,
//                   ),
//                   header: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: CardHeader(
//                             title: widget.title,
//                             amount: widget.amount,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   collapsed: Container(),
//                   expanded: Column(
//                     children: ExpandedContentBuilder.build(widget.title),
//                   ),

//                   // controller: _controller,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// //     // AnimatedContainer(
// //     //   duration: AppConstants.animationDuration,
// //     //   curve: Curves.easeInOut,
// //     //   margin: const EdgeInsets.symmetric(
// //     //     horizontal: AppConstants.cardHorizontalPadding,
// //     //   ),
// //     //   padding: const EdgeInsets.all(AppConstants.cardVerticalPadding),
// //     //   decoration: BoxDecoration(
// //     //     color: cardColor,
// //     //     borderRadius: BorderRadius.circular(AppConstants.cardBorderRadius),
// //     //     boxShadow: [
// //     //       BoxShadow(
// //     //         color: Colors.black.withOpacity(0.8),
// //     //         blurRadius: 20,
// //     //         spreadRadius: 5,
// //     //         offset: const Offset(0, 8),
// //     //       ),
// //     //     ],
// //     //   ),
// //     //   // انیمیشن تغییر حالت بین عادی و گسترش یافته
// //     //   child: AnimatedCrossFade(
// //     //     duration: AppConstants.animationDuration,
// //     //     crossFadeState:
// //     //         expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
// //     //     // نمایش حالت عادی
// //     //     firstChild: Column(
// //     //       mainAxisAlignment: MainAxisAlignment.start,
// //     //       mainAxisSize: MainAxisSize.min,
// //     //       crossAxisAlignment: CrossAxisAlignment.start,
// //     //       children: [CardHeader(title: title, amount: amount)],
// //     //     ),
// //     //     // نمایش حالت گسترش یافته
// //     //     secondChild: Column(
// //     //       children: [
// //     //         Column(
// //     //           mainAxisAlignment: MainAxisAlignment.start,
// //     //           mainAxisSize: MainAxisSize.min,
// //     //           crossAxisAlignment: CrossAxisAlignment.start,
// //     //           children: [
// //     //             CardHeader(title: title, amount: amount),
// //     //             const SizedBox(height: 16),
// //     //             ...ExpandedContentBuilder.build(title),
// //     //           ],
// //     //         ),
// //     //       ],
// //     //     ),
// //     //   ),
// //     // );
// //   }
// // }


// // class Card3 extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     buildItem(String label) {
// //       return Padding(padding: const EdgeInsets.all(10.0), child: Text(label));
// //     }

// //     buildList() {
// //       return Column(
// //         children: <Widget>[
// //           for (var i in [1, 2, 3, 4]) buildItem("Item ${i}"),
// //         ],
// //       );
// //     }

// //     return ExpandableNotifier(
// //       child: Padding(
// //         padding: const EdgeInsets.all(10),
// //         child: ScrollOnExpand(
// //           child: Card(
// //             clipBehavior: Clip.antiAlias,
// //             child: Column(
// //               children: <Widget>[
// //                 ExpandablePanel(
// //                   theme: const ExpandableThemeData(
// //                     headerAlignment: ExpandablePanelHeaderAlignment.center,
// //                     tapBodyToExpand: true,
// //                     tapBodyToCollapse: true,
// //                     hasIcon: false,
// //                   ),
// //                   header: Container(
// //                     color: Colors.indigoAccent,
// //                     child: Padding(
// //                       padding: const EdgeInsets.all(10.0),
// //                       child: Row(
// //                         children: [
// //                           ExpandableIcon(
// //                             theme: const ExpandableThemeData(
// //                               expandIcon: Icons.arrow_right,
// //                               collapseIcon: Icons.arrow_drop_down,
// //                               iconColor: Colors.white,
// //                               iconSize: 28.0,
// //                               // iconRotationAngle: math.pi / 2,
// //                               iconPadding: EdgeInsets.only(right: 5),
// //                               hasIcon: false,
// //                             ),
// //                           ),
// //                           Expanded(child: Text("Items")),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                   collapsed: Container(),
// //                   expanded: buildList(),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
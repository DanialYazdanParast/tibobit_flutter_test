import 'package:flutter/material.dart';
import 'package:tibobit_flutter/features/authentication/presentation/widgets/card/verification_card_list.dart';
import 'package:tibobit_flutter/features/authentication/presentation/widgets/custom_app_bar.dart';
import 'package:tibobit_flutter/features/authentication/presentation/widgets/verification_button.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: VerificationButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.black,
      appBar: CustomAppBar(),
      body: VerificationCardList(),
    );
  }
}

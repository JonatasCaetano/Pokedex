import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/enuns/screens.dart';
import 'package:pokedex/services/routes.dart';

import '../../controllers/main_app_screen_controller.dart';
import '../widgets/text_form_field_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final email = TextEditingController();
  final password = TextEditingController();
  final keyTextFormField = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mainAppScreenController = Get.find<MainAppScreenController>();
    return Scaffold(
      body: Form(
        key: keyTextFormField,
        child: ListView(
          children: [
            TextFormFieldWidget(label: 'Email', controller: email),
            TextFormFieldWidget(label: 'Senha', controller: password),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (keyTextFormField.currentState!.validate()) {
                    mainAppScreenController.login(
                      email: email.text,
                      password: password.text,
                    );
                  }
                },
                child: const Text('entrar'),
              ),
            ),
            const Text(
              'ou',
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  maximumSize: const Size.fromWidth(100.0),
                ),
                onPressed: () {
                  Routes.toScreen(
                      screens: Screens.createAccount, context: context);
                },
                child: const Text('criar conta'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

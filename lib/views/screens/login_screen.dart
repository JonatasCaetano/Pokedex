import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/enuns/screens.dart';
import 'package:pokedex/services/routes.dart';

import '../../controllers/main_app_screen_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final email = TextEditingController();
  final password = TextEditingController();
  final keyTextFormField = GlobalKey<FormState>();

  String? validator({required String? text}) {
    if (text == null || text.isEmpty || text.length < 6) {
      return "coloque seu nome verdadeiro";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final mainAppScreenController = Get.find<MainAppScreenController>();
    return Scaffold(
      body: Form(
        key: keyTextFormField,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  label: Text('Email'),
                ),
                validator: (text) {
                  if (text == null || text.isEmpty || !text.contains('@')) {
                    return "coloque um email valido";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: password,
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                  label: Text('Senha'),
                ),
                validator: (text) {
                  if (text == null || text.isEmpty || text.length < 6) {
                    return "coloque uma senha pelo menos 6 caracteres";
                  } else {
                    return null;
                  }
                },
              ),
            ),
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

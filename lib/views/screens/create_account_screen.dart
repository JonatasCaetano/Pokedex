import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/main_app_screen_controller.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({super.key});

  final name = TextEditingController();
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: name,
                decoration: const InputDecoration(
                  label: Text('Senha'),
                ),
                validator: (text) {
                  if (text == null || text.isEmpty || text.length < 6) {
                    return "coloque uma seu nome";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: email,
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
                    mainAppScreenController.createAccount(
                      name: name.text,
                      email: email.text,
                      password: password.text,
                    );
                  }
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

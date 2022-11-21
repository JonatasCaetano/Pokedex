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
            const SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: name,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  label: Text('Nome'),
                ),
                validator: (text) {
                  if (text == null || text.isEmpty || text.length < 6) {
                    return "coloque seu nome";
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
                style: ElevatedButton.styleFrom(
                  maximumSize: const Size.fromWidth(100.0),
                  backgroundColor: const Color(0xffEa686D),
                ),
                onPressed: () async {
                  if (keyTextFormField.currentState!.validate()) {
                    await mainAppScreenController
                        .createAccount(
                          name: name.text,
                          email: email.text,
                          password: password.text,
                        )
                        .then((value) => Navigator.pop(context));
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

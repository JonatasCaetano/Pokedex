import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/views/widgets/text_form_field_widget.dart';

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
            TextFormFieldWidget(label: 'Nome', controller: name),
            TextFormFieldWidget(label: 'Email', controller: email),
            TextFormFieldWidget(label: 'Senha', controller: password),
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

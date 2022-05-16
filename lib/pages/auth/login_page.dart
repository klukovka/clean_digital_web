import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../l10n/clean_digital_localizations.dart';
import '../../utils/validators.dart';
import '../../views/buttons/primary_button.dart';
import '../../views/rounded_container.dart';

enum _LoginFields { email, password }

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValue => _fbState?.value ?? {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RoundedContainer(
          child: FormBuilder(
            key: _fbKey,
            onChanged: _fbState?.save,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                FormBuilderTextField(
                  name: _LoginFields.email.name,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Typicons.mail),
                    labelText: CleanDigitalLocalizations.of(context).email,
                  ),
                  validator: FormBuilderValidators.email(
                    context,
                    errorText:
                        CleanDigitalLocalizations.of(context).emailIsNotValid,
                  ),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                  name: _LoginFields.password.name,
                  obscureText: true,
                  validator: passwordValidator(context),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Typicons.key_outline),
                    labelText: CleanDigitalLocalizations.of(context).password,
                    suffixIcon: IconButton(
                      icon: const Icon(FontAwesome5.eye_slash),
                      onPressed: () {},
                    ),
                  ),
                ),
                const SizedBox(height: 64),
                PrimaryButton(
                  title: CleanDigitalLocalizations.of(context).login,
                  onPressed: () {},
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      CleanDigitalLocalizations.of(context).forgetPassword,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

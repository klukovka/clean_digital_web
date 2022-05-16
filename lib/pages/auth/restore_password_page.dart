import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../l10n/clean_digital_localizations.dart';
import '../../views/buttons/primary_button.dart';
import '../../views/rounded_container.dart';

enum _RestorePasswordFields { email }

class RestorePasswordPage extends StatefulWidget {
  const RestorePasswordPage({Key? key}) : super(key: key);

  @override
  State<RestorePasswordPage> createState() => _RestorePasswordPageState();
}

class _RestorePasswordPageState extends State<RestorePasswordPage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValue => _fbState?.value ?? {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(),
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
                  name: _RestorePasswordFields.email.name,
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
                const SizedBox(height: 64),
                PrimaryButton(
                  title: CleanDigitalLocalizations.of(context).restorePassword,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

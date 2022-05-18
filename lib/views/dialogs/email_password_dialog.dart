import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../l10n/clean_digital_localizations.dart';
import '../../router/clean_digital_router.dart';
import '../../utils/validators.dart';
import '../buttons/primary_button.dart';

enum _EmailPasswordDialogFields {
  email,
  password,
}

class EmailPasswordDialog extends StatefulWidget {
  final void Function(String, String) onSave;

  const EmailPasswordDialog({
    Key? key,
    required this.onSave,
  }) : super(key: key);

  @override
  State<EmailPasswordDialog> createState() => _EmailPasswordDialogState();
}

class _EmailPasswordDialogState extends State<EmailPasswordDialog> {
  final _fbKey = GlobalKey<FormBuilderState>();

  bool _obscurePasswordText = true;

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValue => _fbState?.value ?? {};

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _fbKey,
      child: Column(
        children: [
          const Spacer(),
          const SizedBox(height: 16),
          _buildEmailField(),
          const SizedBox(height: 16),
          _buildPasswordField(),
          const SizedBox(height: 16),
          const Spacer(),
          PrimaryButton(
            title: CleanDigitalLocalizations.of(context).save,
            onPressed: () {
              if (_fbState?.saveAndValidate() ?? false) {
                widget.onSave(
                  _fbValue[_EmailPasswordDialogFields.email.name],
                  _fbValue[_EmailPasswordDialogFields.password.name],
                );
                router.pop();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return FormBuilderTextField(
      name: _EmailPasswordDialogFields.email.name,
      decoration: InputDecoration(
        prefixIcon: const Icon(Typicons.mail),
        labelText: CleanDigitalLocalizations.of(context).email,
      ),
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(
            context,
            errorText: CleanDigitalLocalizations.of(context).requiredField,
          ),
          FormBuilderValidators.email(
            context,
            errorText: CleanDigitalLocalizations.of(context).emailIsNotValid,
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField() {
    return FormBuilderTextField(
      name: _EmailPasswordDialogFields.password.name,
      obscureText: _obscurePasswordText,
      validator: passwordValidator(context),
      decoration: InputDecoration(
        prefixIcon: const Icon(Typicons.key_outline),
        labelText: CleanDigitalLocalizations.of(context).password,
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePasswordText ? FontAwesome5.eye_slash : FontAwesome5.eye,
          ),
          onPressed: () {
            setState(() {
              _obscurePasswordText = !_obscurePasswordText;
            });
          },
        ),
      ),
    );
  }
}

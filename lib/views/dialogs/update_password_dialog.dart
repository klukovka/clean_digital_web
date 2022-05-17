import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/typicons_icons.dart';

import '../../l10n/clean_digital_localizations.dart';
import '../../router/clean_digital_router.dart';
import '../../utils/validators.dart';
import '../buttons/primary_button.dart';

enum _UpdatePasswordDialogFields {
  newPassword,
  password,
}

class UpdatePasswordDialog extends StatefulWidget {
  final void Function(String, String) onSave;

  const UpdatePasswordDialog({
    Key? key,
    required this.onSave,
  }) : super(key: key);

  @override
  State<UpdatePasswordDialog> createState() => _UpdatePasswordDialogState();
}

class _UpdatePasswordDialogState extends State<UpdatePasswordDialog> {
  final _fbKey = GlobalKey<FormBuilderState>();

  bool obscurePasswordText = true;
  bool obscureNewPasswordText = true;

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
          _buildPasswordField(),
          const SizedBox(height: 16),
          _buildNewPasswordField(),
          const SizedBox(height: 16),
          const Spacer(),
          PrimaryButton(
            title: CleanDigitalLocalizations.of(context).save,
            onPressed: () {
              if (_fbState?.saveAndValidate() ?? false) {
                widget.onSave(
                  _fbValue[_UpdatePasswordDialogFields.password.name],
                  _fbValue[_UpdatePasswordDialogFields.newPassword.name],
                );
                router.pop();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField() {
    return FormBuilderTextField(
      name: _UpdatePasswordDialogFields.password.name,
      obscureText: obscurePasswordText,
      validator: passwordValidator(context),
      decoration: InputDecoration(
        prefixIcon: const Icon(Typicons.key_outline),
        labelText: CleanDigitalLocalizations.of(context).password,
        suffixIcon: IconButton(
          icon: Icon(
            obscurePasswordText ? FontAwesome5.eye_slash : FontAwesome5.eye,
          ),
          onPressed: () {
            setState(() {
              obscurePasswordText = !obscurePasswordText;
            });
          },
        ),
      ),
    );
  }

  Widget _buildNewPasswordField() {
    return FormBuilderTextField(
      name: _UpdatePasswordDialogFields.newPassword.name,
      obscureText: obscureNewPasswordText,
      validator: passwordValidator(context),
      decoration: InputDecoration(
        prefixIcon: const Icon(Typicons.key_outline),
        labelText: CleanDigitalLocalizations.of(context).newPassword,
        suffixIcon: IconButton(
          icon: Icon(
            obscureNewPasswordText ? FontAwesome5.eye_slash : FontAwesome5.eye,
          ),
          onPressed: () {
            setState(() {
              obscureNewPasswordText = !obscureNewPasswordText;
            });
          },
        ),
      ),
    );
  }
}

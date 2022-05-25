import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../api/models/create_update_requests/create_update_employee.dart';
import '../../l10n/clean_digital_localizations.dart';
import '../../models/employee.dart';
import '../../router/clean_digital_router.dart';
import '../../utils/validators.dart';
import '../buttons/primary_button.dart';

enum _CreateUpdateEmployeeDialogFields {
  email,
  password,
  name,
  birthday,
  phone,
}

class CreateUpdateEmployeeDialog extends StatefulWidget {
  final ValueSetter<CreateUpdateEmployeeRequest> onSave;
  final Employee? employee;

  const CreateUpdateEmployeeDialog({
    Key? key,
    required this.onSave,
    this.employee,
  }) : super(key: key);

  @override
  State<CreateUpdateEmployeeDialog> createState() =>
      _CreateUpdateEmployeeDialogState();
}

class _CreateUpdateEmployeeDialogState
    extends State<CreateUpdateEmployeeDialog> {
  final _fbKey = GlobalKey<FormBuilderState>();

  bool _obscurePasswordText = true;

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValue => _fbState?.value ?? {};

  void _onSave() {
    if (_fbState?.saveAndValidate() ?? false) {
      widget.onSave(
        CreateUpdateEmployeeRequest(
          email: _fbValue[_CreateUpdateEmployeeDialogFields.email.name],
          name: _fbValue[_CreateUpdateEmployeeDialogFields.name.name],
          phone: _fbValue[_CreateUpdateEmployeeDialogFields.phone.name],
          birthday: _fbValue[_CreateUpdateEmployeeDialogFields.birthday.name],
          password: _fbValue[_CreateUpdateEmployeeDialogFields.password.name],
        ),
      );
      router.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _fbKey,
      child: Column(
        children: [
          const Spacer(),
          const SizedBox(height: 16),
          _buildEmailField(),
          if (widget.employee == null) ...[
            const SizedBox(height: 16),
            _buildPasswordField(),
          ],
          const SizedBox(height: 16),
          _buildNameField(),
          const SizedBox(height: 16),
          _buildBirthdayField(),
          const SizedBox(height: 16),
          _buildPhoneField(),
          const SizedBox(height: 16),
          const Spacer(),
          PrimaryButton(
            title: CleanDigitalLocalizations.of(context).save,
            onPressed: _onSave,
          ),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return FormBuilderTextField(
      name: _CreateUpdateEmployeeDialogFields.email.name,
      initialValue: widget.employee?.user.email,
      decoration: InputDecoration(
        errorMaxLines: 4,
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
      name: _CreateUpdateEmployeeDialogFields.password.name,
      obscureText: _obscurePasswordText,
      validator: passwordValidator(context),
      decoration: InputDecoration(
        errorMaxLines: 4,
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

  Widget _buildNameField() {
    return FormBuilderTextField(
      name: _CreateUpdateEmployeeDialogFields.name.name,
      initialValue: widget.employee?.name,
      decoration: InputDecoration(
        errorMaxLines: 4,
        prefixIcon: const Icon(Typicons.user),
        labelText: CleanDigitalLocalizations.of(context).name,
      ),
      validator: FormBuilderValidators.required(
        context,
        errorText: CleanDigitalLocalizations.of(context).requiredField,
      ),
    );
  }

  Widget _buildBirthdayField() {
    return FormBuilderDateTimePicker(
      name: _CreateUpdateEmployeeDialogFields.birthday.name,
      initialValue: widget.employee?.birthday,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      decoration: InputDecoration(
        errorMaxLines: 4,
        prefixIcon: const Icon(Typicons.address),
        labelText: CleanDigitalLocalizations.of(context).birthday,
      ),
      validator: FormBuilderValidators.required(
        context,
        errorText: CleanDigitalLocalizations.of(context).requiredField,
      ),
    );
  }

  Widget _buildPhoneField() {
    return FormBuilderTextField(
      name: _CreateUpdateEmployeeDialogFields.phone.name,
      initialValue: widget.employee?.phone,
      decoration: InputDecoration(
        errorMaxLines: 4,
        prefixIcon: const Icon(Typicons.phone_outline),
        labelText: CleanDigitalLocalizations.of(context).phone,
      ),
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(
            context,
            errorText: CleanDigitalLocalizations.of(context).requiredField,
          ),
          FormBuilderValidators.numeric(
            context,
            errorText: CleanDigitalLocalizations.of(context).mustBeFromNumbers,
          ),
          FormBuilderValidators.maxLength(
            context,
            10,
            errorText: '${CleanDigitalLocalizations.of(context).maxLenght} 10',
          ),
        ],
      ),
    );
  }
}

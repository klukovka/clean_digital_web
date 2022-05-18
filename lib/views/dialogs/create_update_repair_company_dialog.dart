import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../api/models/create_update_requests/create_update_repair_company.dart';
import '../../l10n/clean_digital_localizations.dart';
import '../../models/repair_company.dart';
import '../../router/clean_digital_router.dart';
import '../../utils/validators.dart';
import '../buttons/primary_button.dart';

enum _CreateUpdateRepairCompanyDialogFields {
  email,
  password,
  name,
  address,
  phone,
}

class CreateUpdateRepairCompanyDialog extends StatefulWidget {
  final ValueSetter<CreateUpdateRepairCompanyRequest> onSave;
  final RepairCompany? repairCompany;

  const CreateUpdateRepairCompanyDialog({
    Key? key,
    required this.onSave,
    this.repairCompany,
  }) : super(key: key);

  @override
  State<CreateUpdateRepairCompanyDialog> createState() =>
      _CreateUpdateRepairCompanyDialogState();
}

class _CreateUpdateRepairCompanyDialogState
    extends State<CreateUpdateRepairCompanyDialog> {
  final _fbKey = GlobalKey<FormBuilderState>();

  bool _obscurePasswordText = true;

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValue => _fbState?.value ?? {};

  void _onSave() {
    if (_fbState?.saveAndValidate() ?? false) {
      widget.onSave(
        CreateUpdateRepairCompanyRequest(
          email: _fbValue[_CreateUpdateRepairCompanyDialogFields.email.name],
          name: _fbValue[_CreateUpdateRepairCompanyDialogFields.name.name],
          phone: _fbValue[_CreateUpdateRepairCompanyDialogFields.phone.name],
          address:
              _fbValue[_CreateUpdateRepairCompanyDialogFields.address.name],
          password:
              _fbValue[_CreateUpdateRepairCompanyDialogFields.password.name],
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
          if (widget.repairCompany == null) ...[
            const SizedBox(height: 16),
            _buildPasswordField(),
          ],
          const SizedBox(height: 16),
          _buildNameField(),
          const SizedBox(height: 16),
          _buildAddressField(),
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
      name: _CreateUpdateRepairCompanyDialogFields.email.name,
      initialValue: widget.repairCompany?.user.email,
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
      name: _CreateUpdateRepairCompanyDialogFields.password.name,
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
      name: _CreateUpdateRepairCompanyDialogFields.name.name,
      initialValue: widget.repairCompany?.name,
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

  Widget _buildAddressField() {
    return FormBuilderTextField(
      name: _CreateUpdateRepairCompanyDialogFields.address.name,
      initialValue: widget.repairCompany?.address,
      decoration: InputDecoration(
        errorMaxLines: 4,
        prefixIcon: const Icon(Typicons.address),
        labelText: CleanDigitalLocalizations.of(context).address,
      ),
      validator: FormBuilderValidators.required(
        context,
        errorText: CleanDigitalLocalizations.of(context).requiredField,
      ),
    );
  }

  Widget _buildPhoneField() {
    return FormBuilderTextField(
      name: _CreateUpdateRepairCompanyDialogFields.phone.name,
      initialValue: widget.repairCompany?.phone,
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

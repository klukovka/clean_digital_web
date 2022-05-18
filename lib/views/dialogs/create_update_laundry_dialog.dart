import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../api/models/create_update_requests/create_update_laundry.dart';
import '../../l10n/clean_digital_localizations.dart';
import '../../models/laundry.dart';
import '../../router/clean_digital_router.dart';
import '../../utils/validators.dart';
import '../buttons/primary_button.dart';

enum _CreateUpdateLaundryDialogFields {
  email,
  password,
  name,
  address,
  phone,
  maxAmount,
}

class CreateUpdateLaundryDialog extends StatefulWidget {
  final ValueSetter<CreateUpdateLaundryRequest> onSave;
  final Laundry? laundry;

  const CreateUpdateLaundryDialog({
    Key? key,
    required this.onSave,
    this.laundry,
  }) : super(key: key);

  @override
  State<CreateUpdateLaundryDialog> createState() =>
      _CreateUpdateLaundryDialogState();
}

class _CreateUpdateLaundryDialogState extends State<CreateUpdateLaundryDialog> {
  final _fbKey = GlobalKey<FormBuilderState>();

  bool _obscurePasswordText = true;

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValue => _fbState?.value ?? {};

  void _onSave() {
    if (_fbState?.saveAndValidate() ?? false) {
      widget.onSave(
        CreateUpdateLaundryRequest(
          email: _fbValue[_CreateUpdateLaundryDialogFields.email.name],
          name: _fbValue[_CreateUpdateLaundryDialogFields.name.name],
          phone: _fbValue[_CreateUpdateLaundryDialogFields.phone.name],
          address: _fbValue[_CreateUpdateLaundryDialogFields.address.name],
          password: _fbValue[_CreateUpdateLaundryDialogFields.password.name],
          maxAmount: int.parse(
            _fbValue[_CreateUpdateLaundryDialogFields.maxAmount.name],
          ),
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
          if (widget.laundry == null) ...[
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
          _buildMaxField(),
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
      name: _CreateUpdateLaundryDialogFields.email.name,
      initialValue: widget.laundry?.user.email,
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
      name: _CreateUpdateLaundryDialogFields.password.name,
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
      name: _CreateUpdateLaundryDialogFields.name.name,
      initialValue: widget.laundry?.name,
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
      name: _CreateUpdateLaundryDialogFields.address.name,
      initialValue: widget.laundry?.address,
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
      name: _CreateUpdateLaundryDialogFields.phone.name,
      initialValue: widget.laundry?.phone,
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

  Widget _buildMaxField() {
    return FormBuilderTextField(
      name: _CreateUpdateLaundryDialogFields.maxAmount.name,
      initialValue: widget.laundry?.maxAmount.toString(),
      decoration: InputDecoration(
        errorMaxLines: 4,
        prefixIcon: const Icon(Icons.local_laundry_service),
        labelText: CleanDigitalLocalizations.of(context).maxWashMachines,
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
        ],
      ),
    );
  }
}

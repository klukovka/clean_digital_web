import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../api/models/create_update_requests/create_update_wash_machine.dart';
import '../../l10n/clean_digital_localizations.dart';
import '../../models/wash_machine.dart';
import '../../router/clean_digital_router.dart';
import '../buttons/primary_button.dart';

enum _CreateUpdateWashMachineDialogFields {
  model,
  manufacturer,
  capacity,
  powerUsage,
  spinningSpeed,
  maxTime,
}

class CreateUpdateWashMachineDialog extends StatefulWidget {
  final ValueSetter<CreateUpdateWashMachineRequest> onSave;
  final WashMachine? washMachine;

  const CreateUpdateWashMachineDialog({
    Key? key,
    required this.onSave,
    this.washMachine,
  }) : super(key: key);

  @override
  State<CreateUpdateWashMachineDialog> createState() =>
      _CreateUpdateWashMachineDialogState();
}

class _CreateUpdateWashMachineDialogState
    extends State<CreateUpdateWashMachineDialog> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValue => _fbState?.value ?? {};

  void _onSave() {
    if (_fbState?.saveAndValidate() ?? false) {
      widget.onSave(
        CreateUpdateWashMachineRequest(
          model: _fbValue[_CreateUpdateWashMachineDialogFields.model.name],
          manufacturer:
              _fbValue[_CreateUpdateWashMachineDialogFields.manufacturer.name],
          capacity:
              _fbValue[_CreateUpdateWashMachineDialogFields.capacity.name],
          powerUsage:
              _fbValue[_CreateUpdateWashMachineDialogFields.powerUsage.name],
          spinningSpeed:
              _fbValue[_CreateUpdateWashMachineDialogFields.spinningSpeed.name],
          maxTime: _fbValue[_CreateUpdateWashMachineDialogFields.maxTime.name],
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
          _buildModelField(),
          const SizedBox(height: 16),
          _buildManufacturerField(),
          const SizedBox(height: 16),
          _buildCapacityField(),
          const SizedBox(height: 16),
          _buildPowerUsageField(),
          const SizedBox(height: 16),
          _buildSpinningSpeedField(),
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

  Widget _buildModelField() {
    return FormBuilderTextField(
      name: _CreateUpdateWashMachineDialogFields.model.name,
      initialValue: widget.washMachine?.model,
      decoration: InputDecoration(
        errorMaxLines: 4,
        prefixIcon: const Icon(Icons.local_laundry_service_sharp),
        labelText: CleanDigitalLocalizations.of(context).model,
      ),
      validator: FormBuilderValidators.required(
        context,
        errorText: CleanDigitalLocalizations.of(context).requiredField,
      ),
    );
  }

  Widget _buildManufacturerField() {
    return FormBuilderTextField(
      name: _CreateUpdateWashMachineDialogFields.manufacturer.name,
      decoration: InputDecoration(
        errorMaxLines: 4,
        prefixIcon: const Icon(Typicons.compass),
        labelText: CleanDigitalLocalizations.of(context).password,
      ),
      validator: FormBuilderValidators.required(
        context,
        errorText: CleanDigitalLocalizations.of(context).requiredField,
      ),
    );
  }

  Widget _buildCapacityField() {
    return FormBuilderTextField(
      name: _CreateUpdateWashMachineDialogFields.capacity.name,
      initialValue: '${widget.washMachine?.capacity}',
      decoration: InputDecoration(
        errorMaxLines: 4,
        prefixIcon: const Icon(Typicons.user),
        labelText: CleanDigitalLocalizations.of(context).name,
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

  Widget _buildPowerUsageField() {
    return FormBuilderTextField(
      name: _CreateUpdateWashMachineDialogFields.powerUsage.name,
      initialValue: '${widget.washMachine?.powerUsage}',
      decoration: InputDecoration(
        errorMaxLines: 4,
        prefixIcon: const Icon(Typicons.power),
        labelText: CleanDigitalLocalizations.of(context).address,
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

  Widget _buildSpinningSpeedField() {
    return FormBuilderTextField(
      name: _CreateUpdateWashMachineDialogFields.spinningSpeed.name,
      initialValue: '${widget.washMachine?.spinningSpeed}',
      decoration: InputDecoration(
        errorMaxLines: 4,
        prefixIcon: const Icon(Typicons.dribbble_circled),
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
        ],
      ),
    );
  }

  Widget _buildMaxField() {
    return FormBuilderTextField(
      name: _CreateUpdateWashMachineDialogFields.maxTime.name,
      initialValue: widget.washMachine?.maxTime.toString(),
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

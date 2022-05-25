import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../api/models/create_update_requests/create_update_mode.dart';
import '../../l10n/clean_digital_localizations.dart';
import '../../models/mode.dart';
import '../../router/clean_digital_router.dart';
import '../../utils/validators.dart';
import '../buttons/primary_button.dart';

enum _CreateUpdateModeDialogFields {
  name,
  costs,
  time,
}

class CreateUpdateModeDialog extends StatefulWidget {
  final ValueSetter<CreateUpdateModeRequest> onSave;
  final Mode? mode;

  const CreateUpdateModeDialog({
    Key? key,
    required this.onSave,
    this.mode,
  }) : super(key: key);

  @override
  State<CreateUpdateModeDialog> createState() => _CreateUpdateModeDialogState();
}

class _CreateUpdateModeDialogState extends State<CreateUpdateModeDialog> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValue => _fbState?.value ?? {};

  void _onSave() {
    if (_fbState?.saveAndValidate() ?? false) {
      widget.onSave(
        CreateUpdateModeRequest(
          name: _fbValue[_CreateUpdateModeDialogFields.name.name],
          costs: int.parse(_fbValue[_CreateUpdateModeDialogFields.costs.name]),
          time: int.parse(
            _fbValue[_CreateUpdateModeDialogFields.time.name],
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
          _buildNameField(),
          const SizedBox(height: 16),
          _buildCostsField(),
          const SizedBox(height: 16),
          _buildTimeField(),
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

  Widget _buildNameField() {
    return FormBuilderTextField(
      name: _CreateUpdateModeDialogFields.name.name,
      initialValue: widget.mode?.name,
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

  Widget _buildCostsField() {
    return FormBuilderTextField(
      name: _CreateUpdateModeDialogFields.costs.name,
      initialValue: widget.mode?.costs.toString(),
      decoration: InputDecoration(
        errorMaxLines: 4,
        prefixIcon: const Icon(Icons.monetization_on),
        labelText: CleanDigitalLocalizations.of(context).costs,
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
            4,
            errorText: '${CleanDigitalLocalizations.of(context).maxLenght} 4',
          ),
        ],
      ),
    );
  }

  Widget _buildTimeField() {
    return FormBuilderTextField(
      name: _CreateUpdateModeDialogFields.time.name,
      initialValue: widget.mode?.time.toString(),
      decoration: InputDecoration(
        errorMaxLines: 4,
        prefixIcon: const Icon(Icons.access_alarm_sharp),
        labelText: CleanDigitalLocalizations.of(context).time,
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

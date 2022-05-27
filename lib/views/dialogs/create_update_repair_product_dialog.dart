import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../api/models/create_update_requests/create_update_repair_product.dart';
import '../../l10n/clean_digital_localizations.dart';
import '../../models/repair_product.dart';
import '../../models/repair_type.dart';
import '../../router/clean_digital_router.dart';
import '../buttons/primary_button.dart';

enum _CreateUpdateRepairProductDialogFields {
  description,
  costs,
  type,
}

class CreateUpdateRepairProductDialog extends StatefulWidget {
  final ValueSetter<CreateUpdateRepairProductRequest> onSave;
  final RepairProduct? repairProduct;

  const CreateUpdateRepairProductDialog({
    Key? key,
    required this.onSave,
    this.repairProduct,
  }) : super(key: key);

  @override
  State<CreateUpdateRepairProductDialog> createState() =>
      _CreateUpdateRepairProductDialogState();
}

class _CreateUpdateRepairProductDialogState
    extends State<CreateUpdateRepairProductDialog> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValue => _fbState?.value ?? {};

  void _onSave() {
    if (_fbState?.saveAndValidate() ?? false) {
      widget.onSave(
        CreateUpdateRepairProductRequest(
          description:
              _fbValue[_CreateUpdateRepairProductDialogFields.description.name],
          costs: int.parse(
              _fbValue[_CreateUpdateRepairProductDialogFields.costs.name]),
          type: _fbValue[_CreateUpdateRepairProductDialogFields.type.name],
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
      name: _CreateUpdateRepairProductDialogFields.description.name,
      initialValue: widget.repairProduct?.description,
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
      name: _CreateUpdateRepairProductDialogFields.costs.name,
      initialValue: widget.repairProduct?.costs.toString(),
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
    return FormBuilderDropdown<RepairType>(
      name: _CreateUpdateRepairProductDialogFields.type.name,
      items: RepairType.values.map((e) {
        return DropdownMenuItem<RepairType>(
          value: e,
          child: Text(e.getTitle(context)),
        );
      }).toList(),
      decoration: InputDecoration(
        errorMaxLines: 4,
        prefixIcon: const Icon(FontAwesome.wrench),
        labelText: CleanDigitalLocalizations.of(context).time,
      ),
      validator: FormBuilderValidators.required(
        context,
        errorText: CleanDigitalLocalizations.of(context).requiredField,
      ),
    );
  }
}

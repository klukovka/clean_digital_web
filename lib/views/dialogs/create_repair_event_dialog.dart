import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../api/models/create_update_requests/create_repair_event.dart';
import '../../l10n/clean_digital_localizations.dart';
import '../../models/repair_product.dart';
import '../../models/wash_machine.dart';
import '../../router/clean_digital_router.dart';
import '../buttons/primary_button.dart';
import '../entity_tiles/entity_label.dart';

class CreateRepairEventDialog extends StatefulWidget {
  final ValueSetter<CreateRepairEventRequest> onSave;

  const CreateRepairEventDialog({
    Key? key,
    required this.onSave,
  }) : super(key: key);

  @override
  State<CreateRepairEventDialog> createState() =>
      _CreateRepairEventDialogState();
}

class _CreateRepairEventDialogState extends State<CreateRepairEventDialog> {
  WashMachine? _washMachine;
  RepairProduct? _repairProduct;

  void Function()? get save {
    final washMachineId = _washMachine?.washMachineId;
    final repairProductId = _repairProduct?.repairProductId;
    if (washMachineId != null && repairProductId != null) {
      return () {
        widget.onSave(CreateRepairEventRequest(
          repairProductId: repairProductId,
          washMachineId: washMachineId,
        ));
        router.pop();
      };
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _washMachine != null
                ? _buildWashMachine()
                : _buildSelectWashingMachine(),
            const SizedBox(width: 24),
            _repairProduct != null ? _buildProduct() : _buildSelectProduct(),
          ],
        ),
        const Spacer(),
        PrimaryButton(
          title: CleanDigitalLocalizations.of(context).save,
          onPressed: save,
        )
      ],
    );
  }

  Widget _buildSelectWashingMachine() {
    return Column(
      children: [
        Text(
          CleanDigitalLocalizations.of(context).youDontSelectWashMachine,
        ),
        const SizedBox(height: 16),
        _buildSelectWashingMachineButton()
      ],
    );
  }

  Widget _buildSelectWashingMachineButton() {
    return PrimaryButton(
      fullWidth: false,
      title: CleanDigitalLocalizations.of(context).select,
      onPressed: () {
        router.pushSelectWashMachinePage((value) {
          setState(() {
            _washMachine = value;
          });
        });
      },
    );
  }

  Widget _buildSelectProduct() {
    return Column(
      children: [
        Text(
          CleanDigitalLocalizations.of(context).youDontSelectRepairProduct,
        ),
        const SizedBox(height: 16),
        _buildSelectProductButton(),
      ],
    );
  }

  Widget _buildSelectProductButton() {
    return PrimaryButton(
      fullWidth: false,
      title: CleanDigitalLocalizations.of(context).select,
      onPressed: () {
        router.pushSelectProductPage((value) {
          setState(() {
            _repairProduct = value;
          });
        });
      },
    );
  }

  Widget _buildProduct() {
    final localization = CleanDigitalLocalizations.of(context);

    return SizedBox(
      width: 200,
      height: 30.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EntityLabel(
              title: localization.repairType,
              value: _repairProduct?.type.getTitle(context)),
          EntityLabel(
              title: localization.description,
              value: _repairProduct?.description),
          EntityLabel(title: localization.costs, value: _repairProduct?.costs),
          const SizedBox(height: 16),
          _buildSelectProductButton(),
        ],
      ),
    );
  }

  Widget _buildWashMachine() {
    final localization = CleanDigitalLocalizations.of(context);

    return SizedBox(
      width: 200,
      height: 35.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EntityLabel(title: localization.model, value: _washMachine?.model),
          EntityLabel(
            title: localization.manufacturer,
            value: _washMachine?.manufacturer,
          ),
          EntityLabel(
            title: localization.capacity,
            value: _washMachine?.capacity,
          ),
          EntityLabel(
            title: localization.powerUsage,
            value: _washMachine?.powerUsage,
          ),
          EntityLabel(
            title: localization.maxTime,
            value: _washMachine?.maxTime,
          ),
          EntityLabel(
            title: localization.currentTime,
            value: _washMachine?.currentTime,
          ),
          EntityLabel(
            title: localization.isWorking,
            value: _washMachine?.isWorking,
          ),
          EntityLabel(
            title: localization.isWashing,
            value: _washMachine?.isWashing,
          ),
          const SizedBox(height: 16),
          _buildSelectWashingMachineButton(),
        ],
      ),
    );
  }
}

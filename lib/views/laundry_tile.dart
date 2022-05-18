import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../l10n/clean_digital_localizations.dart';
import '../models/laundry.dart';
import '../resources/app_image_assets.dart';
import 'buttons/primary_button.dart';

class LaundryTile extends StatefulWidget {
  final Laundry laundry;

  const LaundryTile({
    Key? key,
    required this.laundry,
  }) : super(key: key);

  @override
  State<LaundryTile> createState() => _LaundryTileState();
}

class _LaundryTileState extends State<LaundryTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Image.asset(
                AppImageAssets.laundryImage,
                width: 20.h,
              ),
              Expanded(child: _buildInfo()),
            ],
          ),
          PrimaryButton(
            title: CleanDigitalLocalizations.of(context).more,
          ),
        ],
      ),
    );
  }

  Widget _buildInfo() {
    final localization = CleanDigitalLocalizations.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLabel(localization.name, widget.laundry.name),
        _buildLabel(localization.phone, widget.laundry.phone),
        _buildLabel(localization.address, widget.laundry.address),
        _buildLabel(localization.email, widget.laundry.user.email),
        _buildLabel(
          localization.maxWashMachines,
          '${widget.laundry.maxAmount}',
        ),
      ],
    );
  }

  Widget _buildLabel(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Text(
            '$title:',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }
}

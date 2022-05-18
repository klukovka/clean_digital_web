import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../l10n/clean_digital_localizations.dart';
import '../models/laundry.dart';
import '../resources/app_image_assets.dart';
import '../utils/clean_digital_dialogs.dart';
import 'buttons/primary_button.dart';

class LaundryTile extends StatefulWidget {
  final Laundry laundry;
  final VoidCallback? onDeletePressed;
  final VoidCallback? onMorePressed;

  const LaundryTile({
    Key? key,
    required this.laundry,
    this.onDeletePressed,
    this.onMorePressed,
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
          _buildButtons(),
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
          Flexible(
            child: AutoSizeText(
              '$title:',
              style: Theme.of(context).textTheme.headline6,
              maxLines: 1,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: AutoSizeText(
              value,
              style: Theme.of(context).textTheme.headline5,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Row(
      children: [
        Expanded(
          child: PrimaryButton(
            title: CleanDigitalLocalizations.of(context).more,
            onPressed: widget.onMorePressed,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: PrimaryButton(
            title: CleanDigitalLocalizations.of(context).delete,
            isOutlined: true,
            onPressed: () {
              CleanDigitalDialogs.of(context).showConfirmNoDialog(
                title: CleanDigitalLocalizations.of(context)
                    .doYouWantToDeleteLaundry,
                onPressed: widget.onDeletePressed,
              );
            },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../resources/app_image_assets.dart';
import '../../../../../views/entity_tiles/entity_container_tile.dart';

class StatisticTile extends StatelessWidget {
  const StatisticTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EntityContainerTile(
      child: Text('ddd'),
      imageAsset: AppImageAssets.clientImage,
      onDeletePressed: null,
      onMorePressed: null,
    );
  }
}

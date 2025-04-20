import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medb/utils/datetime.dart';
import 'package:medb/widgets/svg.dart';

class ItemChip extends StatelessWidget {
  final String svg;
  final String label;
  final String? value;
  final double fontSize;

  const ItemChip({
    super.key,
    required this.svg,
    required this.label,
    this.value,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 2),
          child: SvgIcon(
            assetName: svg,
            size: fontSize,
            color: Get.theme.colorScheme.outline,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: fontSize,
            color: Get.theme.colorScheme.outline,
          ),
        ),
        if (value != null) ...[
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              svg == Svg.datetime ? dateTimeToString(value!) : value!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: fontSize,
                color: Get.theme.colorScheme.outline,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

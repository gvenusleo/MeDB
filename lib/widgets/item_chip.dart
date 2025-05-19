import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medb/common/datetime.dart';
import 'package:medb/widgets/svg.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ItemChip extends StatelessWidget {
  final String svg;
  final String label;
  final dynamic value;
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
            child:
                svg == Svg.hash
                    ? SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (final e in value!)
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Get.theme.colorScheme.outline,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              margin: EdgeInsets.only(right: 4),
                              padding: EdgeInsets.symmetric(horizontal: 2),
                              child: Text(
                                e.toString(),
                                style: TextStyle(fontSize: fontSize - 2),
                              ),
                            ),
                        ],
                      ),
                    )
                    : GestureDetector(
                      onTap:
                          svg == Svg.link
                              ? () => launchUrlString(value!.toString())
                              : null,
                      child: Text(
                        svg == Svg.datetime
                            ? dateTimeToString(value!.toString())
                            : value!.toString().replaceAll('\n', ''),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: fontSize),
                      ),
                    ),
          ),
        ],
      ],
    );
  }
}

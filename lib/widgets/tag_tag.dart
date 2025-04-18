import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medb/widgets/svg.dart';

class TagTag extends StatelessWidget {
  final String label;
  final List? value;
  final double fontSize;

  const TagTag({
    super.key,
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
          child: SvgIcon.hash(
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
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    value!
                        .map(
                          (e) => Container(
                            decoration: BoxDecoration(
                              color:
                                  Get.theme.colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            margin: EdgeInsets.only(right: 4),
                            padding: EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 2,
                            ),
                            child: Text(
                              e.toString(),
                              style: TextStyle(fontSize: fontSize - 2),
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

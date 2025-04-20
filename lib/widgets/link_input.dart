import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medb/widgets/item_chip.dart';
import 'package:medb/widgets/svg.dart';

class LinkInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hint = '请输入';

  const LinkInput({super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      mainAxisSize: MainAxisSize.min,
      children: [
        ItemChip(svg: Svg.link, label: label, fontSize: 14),
        const SizedBox(width: 4),
        Expanded(
          child: TextField(
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.end,
            textAlignVertical: TextAlignVertical.center,
            scrollPhysics: const BouncingScrollPhysics(),
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.all(0),
              fillColor: Get.theme.colorScheme.surfaceContainer,
              filled: false,
              hintText: hint,
              hintStyle: TextStyle(color: Get.theme.colorScheme.outline),
            ),
          ),
        ),
      ],
    );
  }
}

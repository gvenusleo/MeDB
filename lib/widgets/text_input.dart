import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:medb/widgets/text_tag.dart";

/// 文本输入组件
/// 文本框高度随文本增加
/// 当文本内容仅有一行时，icon、title 和文本框水平并排
/// 当文本内容超过一行时，文本框调整到 icon、title 下方
class TextInput extends StatelessWidget {
  final bool isSingleLine;
  final String label;
  final TextEditingController controller;
  final String hint = "请输入";
  final bool? enabled;

  const TextInput({
    super.key,
    required this.isSingleLine,
    required this.label,
    required this.controller,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    if (isSingleLine) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextTag(label: label, fontSize: 14),
          const SizedBox(width: 4),
          Expanded(
            child: TextField(
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.end,
              textAlignVertical: TextAlignVertical.center,
              scrollPhysics: const BouncingScrollPhysics(),
              controller: controller,
              enabled: enabled,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextTag(label: label, fontSize: 14),
        const SizedBox(height: 4),
        TextField(
          style: TextStyle(fontSize: 14),
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          maxLines: 300,
          minLines: 1,
          controller: controller,
          enabled: enabled,
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
      ],
    );
  }
}

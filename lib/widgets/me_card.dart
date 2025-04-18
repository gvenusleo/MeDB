import "package:flutter/material.dart";
import "package:get/get.dart";

class MeCard extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets margin;

  const MeCard({
    super.key,
    required this.children,
    this.margin = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: margin,
      decoration: BoxDecoration(
        color:
            Get.theme.brightness == Brightness.light
                ? Colors.white
                : Get.theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Get.theme.colorScheme.surfaceContainerHighest,
          width: 0.5,
        ),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: children,
      ),
    );
  }
}

import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:get/get.dart";

class Svg {
  static final Svg _instance = Svg._internal();

  factory Svg() => _instance;

  Svg._internal();

  static String get search => "assets/svg/search.svg";
  static String get menu => "assets/svg/menu.svg";
  static String get datetime => "assets/svg/datetime.svg";
  static String get edit => "assets/svg/edit.svg";
  static String get sort => "assets/svg/sort.svg";
  static String get layout => "assets/svg/layout.svg";
  static String get link => "assets/svg/link.svg";
  static String get atom => "assets/svg/atom.svg";
  static String get hash => "assets/svg/hash.svg";
  static String get text => "assets/svg/text.svg";
  static String get key => "assets/svg/key.svg";
  static String get back => "assets/svg/back.svg";
  static String get box => "assets/svg/box.svg";
  static String get add => "assets/svg/add.svg";
}

class SvgIcon extends StatelessWidget {
  final String assetName;
  final double? size;
  final Color? color;

  const SvgIcon({super.key, required this.assetName, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: size ?? 24,
      height: size ?? 24,
      colorFilter: ColorFilter.mode(
        color ?? Get.theme.colorScheme.onSurface,
        BlendMode.srcIn,
      ),
    );
  }
}

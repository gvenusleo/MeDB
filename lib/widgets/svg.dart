import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:get/get.dart";

class SvgIcon {
  static final SvgIcon _instance = SvgIcon._internal();

  factory SvgIcon() => _instance;

  SvgIcon._internal();

  static Widget search({double? size, Color? color}) =>
      _buildSvg("assets/svg/search.svg", size, color);

  static Widget menu({double? size, Color? color}) =>
      _buildSvg("assets/svg/menu.svg", size, color);

  static Widget datetime({double? size, Color? color}) =>
      _buildSvg("assets/svg/datetime.svg", size, color);

  static Widget edit({double? size, Color? color}) =>
      _buildSvg("assets/svg/edit.svg", size, color);

  static Widget sort({double? size, Color? color}) =>
      _buildSvg("assets/svg/sort.svg", size, color);

  static Widget layout({double? size, Color? color}) =>
      _buildSvg("assets/svg/layout.svg", size, color);

  static Widget link({double? size, Color? color}) =>
      _buildSvg("assets/svg/link.svg", size, color);

  static Widget atom({double? size, Color? color}) =>
      _buildSvg("assets/svg/atom.svg", size, color);

  static Widget hash({double? size, Color? color}) =>
      _buildSvg("assets/svg/hash.svg", size, color);

  static Widget text({double? size, Color? color}) =>
      _buildSvg("assets/svg/text.svg", size, color);

  static Widget key({double? size, Color? color}) =>
      _buildSvg("assets/svg/key.svg", size, color);

  static Widget back({double? size, Color? color}) =>
      _buildSvg("assets/svg/back.svg", size, color);

  static Widget box({double? size, Color? color}) =>
      _buildSvg("assets/svg/box.svg", size, color);

  static Widget add({double? size, Color? color}) =>
      _buildSvg("assets/svg/add.svg", size, color);

  static Widget _buildSvg(String assetName, double? size, Color? color) {
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

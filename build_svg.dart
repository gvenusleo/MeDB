// ignore_for_file: avoid_print

import "dart:io";

/// 读取 assets/svg 目录下的所有 svg 文件，并生成对应的 Widget 类
void main() {
  print("Generating svg.dart...");

  final svgDir = Directory("assets/svg");
  final svgFiles = svgDir.listSync().whereType<File>();
  final sb = StringBuffer();

  sb.writeln("import \"package:flutter/material.dart\";");
  sb.writeln("import \"package:flutter_svg/flutter_svg.dart\";");
  sb.writeln("import \"package:get/get.dart\";");
  sb.writeln("");
  sb.writeln("class SvgIcon {");
  sb.writeln("  static final SvgIcon _instance = SvgIcon._internal();");
  sb.writeln("");
  sb.writeln("  factory SvgIcon() => _instance;");
  sb.writeln("");
  sb.writeln("  SvgIcon._internal();");
  sb.writeln("");

  for (final svgFile in svgFiles) {
    final fileName = svgFile.path.split("/").last.split(".").first;

    print("Generating $fileName...");

    sb.writeln("  static Widget $fileName({double? size, Color? color}) =>");
    sb.writeln("      _buildSvg(\"assets/svg/$fileName.svg\", size, color);");
    sb.writeln("");
  }

  print("Generating ${svgFiles.length} svg files.");

  sb.writeln(
    "  static Widget _buildSvg(String assetName, double? size, Color? color) {",
  );
  sb.writeln("    return SvgPicture.asset(");
  sb.writeln("      assetName,");
  sb.writeln("      width: size ?? 24,");
  sb.writeln("      height: size ?? 24,");
  sb.writeln("      colorFilter: ColorFilter.mode(");
  sb.writeln("        color?? Get.theme.colorScheme.onSurface,");
  sb.writeln("        BlendMode.srcIn,");
  sb.writeln("      ),");
  sb.writeln("    );");
  sb.writeln("  }");
  sb.writeln("}");

  final outputFile = File("lib/widgets/svg.dart");
  outputFile.writeAsStringSync(sb.toString());

  print("Generated svg.dart successfully!");
}

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
  sb.writeln("class Svg {");
  sb.writeln("  static final Svg _instance = Svg._internal();");
  sb.writeln("");
  sb.writeln("  factory Svg() => _instance;");
  sb.writeln("");
  sb.writeln("  Svg._internal();");
  sb.writeln("");

  for (final svgFile in svgFiles) {
    final fileName = svgFile.path.split("/").last.split(".").first;

    print("Generating $fileName...");

    sb.writeln(
      "  static String get $fileName => \"assets/svg/$fileName.svg\";",
    );
  }

  sb.writeln("}");
  sb.writeln("");

  sb.writeln("class SvgIcon extends StatelessWidget {");
  sb.writeln("  final String assetName;");
  sb.writeln("  final double? size;");
  sb.writeln("  final Color? color;");
  sb.writeln("");
  sb.writeln("  const SvgIcon({");
  sb.writeln("    super.key,");
  sb.writeln("    required this.assetName,");
  sb.writeln("    this.size,");
  sb.writeln("    this.color,");
  sb.writeln("  });");
  sb.writeln("");
  sb.writeln("  @override");
  sb.writeln("  Widget build(BuildContext context) {");
  sb.writeln("    return SvgPicture.asset(");
  sb.writeln("      assetName,");
  sb.writeln("      width: size?? 24,");
  sb.writeln("      height: size?? 24,");
  sb.writeln("      colorFilter: ColorFilter.mode(");
  sb.writeln("        color?? Get.theme.colorScheme.onSurface,");
  sb.writeln("        BlendMode.srcIn,");
  sb.writeln("      ),");
  sb.writeln("    );");
  sb.writeln("  }");
  sb.writeln("}");
  sb.writeln("");

  print("Generating ${svgFiles.length} svg files.");

  final outputFile = File("lib/widgets/svg.dart");
  outputFile.writeAsStringSync(sb.toString());

  print("Generated svg.dart successfully!");
}

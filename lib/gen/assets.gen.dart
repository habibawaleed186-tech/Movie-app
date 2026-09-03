// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Language Switch.svg
  String get languageSwitch => 'assets/icons/Language Switch.svg';

  /// File path: assets/icons/arrow_back.svg
  String get arrowBack => 'assets/icons/arrow_back.svg';

  /// File path: assets/icons/phone.svg
  String get phone => 'assets/icons/phone.svg';

  /// File path: assets/icons/user.svg
  String get user => 'assets/icons/user.svg';

  /// List of all assets
  List<String> get values => [languageSwitch, arrowBack, phone, user];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/gamer (1) (1).png
  AssetGenImage get gamer11 =>
      const AssetGenImage('assets/images/gamer (1) (1).png');

  /// File path: assets/images/gamer (1) (2).png
  AssetGenImage get gamer12 =>
      const AssetGenImage('assets/images/gamer (1) (2).png');

  /// File path: assets/images/gamer (1) (3).png
  AssetGenImage get gamer13 =>
      const AssetGenImage('assets/images/gamer (1) (3).png');

  /// File path: assets/images/gamer (1) (4).png
  AssetGenImage get gamer14 =>
      const AssetGenImage('assets/images/gamer (1) (4).png');

  /// File path: assets/images/gamer (1) (5).png
  AssetGenImage get gamer15 =>
      const AssetGenImage('assets/images/gamer (1) (5).png');

  /// File path: assets/images/gamer (1) (6).png
  AssetGenImage get gamer16 =>
      const AssetGenImage('assets/images/gamer (1) (6).png');

  /// File path: assets/images/gamer (1) (7).png
  AssetGenImage get gamer17 =>
      const AssetGenImage('assets/images/gamer (1) (7).png');

  /// File path: assets/images/gamer (1)(8).png
  AssetGenImage get gamer18 =>
      const AssetGenImage('assets/images/gamer (1)(8).png');

  /// File path: assets/images/gamer (1).png
  AssetGenImage get gamer1 =>
      const AssetGenImage('assets/images/gamer (1).png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/primary2.png
  AssetGenImage get primary2 =>
      const AssetGenImage('assets/images/primary2.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    gamer11,
    gamer12,
    gamer13,
    gamer14,
    gamer15,
    gamer16,
    gamer17,
    gamer18,
    gamer1,
    logo,
    primary2,
  ];
}

abstract final class Assets {
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

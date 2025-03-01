library pre_image_view;

import 'dart:io';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class PreImageView extends StatelessWidget {
  // ignore_for_file: must_be_immutable
  String? imagePath;
  double? height; // Height of the Image
  double? width; // Width of the Image
  BoxFit? fit; // BoxFit of the Image
  String
      errorPlaceHolder; // Error Placeholder forIt is used when image is not found(You can pass image url, asset path , file ,lottie file)or svg also ),
  Alignment? alignment; // Alignment of the Image
  VoidCallback? onTap; // OnTap of the Image
  EdgeInsetsGeometry? margin, padding; // Margin and Padding of the Image
  BorderRadius? borderRadius; // BorderRadius of the Image
  BoxBorder? border; // Border of the Image
  List<BoxShadow>? boxShadow; // BoxShadow of the Image
  BoxShape shape; // Shape of the Image
  Widget? placeholder;
  Color? svgColor; // Color for SVG images
  BlendMode? blendMode; // Blend mode for the image
  ImageFilter? imageFilter; // Image filter for effects
  bool memoryCache; // Enable memory caching
  double? progressIndicatorSize; // Size of the progress indicator
  Color? progressIndicatorColor; // Color of the progress indicator
  Duration? fadeInDuration; // Duration for fade-in animation
  bool showLoadingProgress; // Show loading progress for network images

  ///a [PreImageView] it can be used for showing any type of images
  /// it will shows the placeholder image if image is not found on network image
  ///
  ///
  /// Constructs a [PreImageView] object.
  PreImageView(
    this.imagePath, {
    Key? key,
    this.height,
    this.width,
    this.fit,
    this.alignment,
    this.onTap,
    this.borderRadius,
    this.margin,
    this.padding,
    this.border,
    this.errorPlaceHolder = 'assets/not_found.png',
    this.boxShadow,
    this.shape = BoxShape.rectangle,
    this.svgColor,
    this.blendMode,
    this.imageFilter,
    this.memoryCache = true,
    this.progressIndicatorSize = 24.0,
    this.progressIndicatorColor,
    this.fadeInDuration = const Duration(milliseconds: 300),
    this.showLoadingProgress = false,
    this.placeholder,
  }) : super(key: key);

  /// Constructs a [PreImageView] object.

  ///a [PreImageView] it can be used for showing any type of images
  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent, // to set the focus color
      highlightColor: Colors.transparent, // to set the highlight color
      onTap: onTap, //to set the onTap function
      child: Container(
        alignment: alignment,
        //to set the alignment
        padding: padding,
        //to set the padding
        margin: margin,
        //to set the margin
        height: height,
        // to set the height
        width: width,
        // to set the width
        decoration: BoxDecoration(
          border: border,
          boxShadow: boxShadow,
          shape: shape,
        ),
        // to set the decoration
        child: imageFilter != null
            ? ClipRRect(
                borderRadius: borderRadius ?? BorderRadius.zero,
                child: ImageFiltered(
                  imageFilter: imageFilter!,
                  child: ClipRRect(
                    borderRadius: borderRadius ?? BorderRadius.zero,
                    child: imageTypeView(),
                  ),
                ),
              )
            : ClipRRect(
                borderRadius: borderRadius ?? BorderRadius.zero,
                // to set the borderRadius
                child: imageTypeView()), // to set the imageTypeView
      ),
    );
  }

  Widget imageTypeView() {
    if (imagePath != null) {
      switch (imagePath!.imageType) {
        case ImageType.svg:
          if (imagePath!.startsWith('http') || imagePath!.startsWith('https')) {
            return SvgPicture.network(
              imagePath!,
              height: height,
              width: width,
              fit: fit ?? BoxFit.contain,
              colorFilter: svgColor != null
                  ? ColorFilter.mode(svgColor!, BlendMode.srcIn)
                  : null,
              placeholderBuilder: (context) => _buildPlaceholder(),
            );
          } else {
            return SvgPicture.asset(
              imagePath!,
              height: height,
              width: width,
              fit: fit ?? BoxFit.contain,
              colorFilter: svgColor != null
                  ? ColorFilter.mode(svgColor!, BlendMode.srcIn)
                  : null,
            ); // to set the SvgPicture
          }
        case ImageType.json:
          return Lottie.asset(
            imagePath!,
            height: height,
            width: width,
            fit: fit ?? BoxFit.contain,
          ); // to set the Lottie.asset
        case ImageType.zip:
          return Lottie.asset(
            imagePath!,
            height: height,
            width: width,
            fit: fit ?? BoxFit.contain,
          ); // to set the Lottie.asset
        case ImageType.file:
          return Image.file(
            File(imagePath!),
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            color: svgColor,
            colorBlendMode: blendMode,
          ); // to set the Image.file
        case ImageType.network:
          return CachedNetworkImage(
            height: height,
            width: width,
            fit: fit,
            imageUrl: imagePath!,
            memCacheHeight: memoryCache ? (height?.toInt()) : null,
            memCacheWidth: memoryCache ? (width?.toInt()) : null,
            fadeInDuration: fadeInDuration!,
            color: svgColor,
            colorBlendMode: blendMode,
            progressIndicatorBuilder: showLoadingProgress
                ? (context, url, downloadProgress) {
                    return Center(
                      child: SizedBox(
                        width: progressIndicatorSize,
                        height: progressIndicatorSize,
                        child: CircularProgressIndicator.adaptive(
                          strokeWidth: 2,
                          value: downloadProgress.progress,
                          valueColor: progressIndicatorColor != null
                              ? AlwaysStoppedAnimation<Color>(
                                  progressIndicatorColor!)
                              : null,
                        ),
                      ),
                    );
                  }
                : null,
            placeholder: !showLoadingProgress
                ? (context, url) => _buildPlaceholder()
                : null,
            errorWidget: (context, url, error) => PreImageView(
              errorPlaceHolder,
              height: height,
              width: width,
              fit: fit ?? BoxFit.cover,
            ),
          ); // to set the CachedNetworkImage
        case ImageType.png:
        default:
          return Image.asset(
            imagePath!,
            height: height,
            width: width,
            color: svgColor,
            colorBlendMode: blendMode,
            errorBuilder: (context, error, stackTrace) => PreImageView(
              errorPlaceHolder,
              height: height,
              width: width,
              fit: fit ?? BoxFit.cover,
            ),
            fit: fit ?? BoxFit.cover,
          ); // to set the Image.asset
      }
    }
    return const SizedBox();
  }

  Widget _buildPlaceholder() {
    return SizedBox(
      width: width,
      height: height,
      child: Center(
        child: placeholder ??
            SizedBox(
              width: progressIndicatorSize,
              height: progressIndicatorSize,
              child: CircularProgressIndicator.adaptive(
                strokeWidth: 2,
                valueColor: progressIndicatorColor != null
                    ? AlwaysStoppedAnimation<Color>(progressIndicatorColor!)
                    : null,
              ),
            ),
      ),
    );
  }
}

///a [PreImageView] it can be used for showing any type of images

// Image Type Extension defines image type of the image path
extension ImageTypeExtension on String {
  ImageType get imageType {
    if (startsWith('http') || startsWith('https')) {
      if (endsWith('.svg')) {
        return ImageType.svg;
      } else if (endsWith('.json')) {
        return ImageType.json;
      } else if (endsWith('.zip')) {
        return ImageType.zip;
      } else {
        return ImageType.network;
      }
    } else if (endsWith('.svg')) {
      return ImageType.svg;
    } else if (endsWith('.json')) {
      return ImageType.json;
    } else if (endsWith('.zip')) {
      return ImageType.zip;
    } else if (startsWith('file://')) {
      return ImageType.file;
    } else {
      return ImageType.png;
    }
  }
}
// Image Type Extension defines image type of the image path

// Image Type Enums
enum ImageType { svg, png, network, json, zip, file, unknown }
// Image Type Enums

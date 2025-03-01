# PreImageView Documentation

# PreImageView

A versatile Flutter image widget that simplifies displaying various image types (PNG, SVG, Lottie animations) from different sources (assets, network, file) with advanced customization options.

[![Pub Version](https://img.shields.io/pub/v/pre_image_view.svg)](https://pub.dev/packages/pre_image_view)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Features

- **Multiple Image Types Support**: PNG, SVG, Lottie animations, and more
- **Multiple Sources**: Load from assets, network, or file system
- **Smart Type Detection**: Automatically detects image type based on path/URL
- **Advanced Styling**: Customize with borders, shadows, shapes, and more
- **Image Effects**: Apply blur, color filters, and blend modes
- **Loading Indicators**: Customizable loading indicators for network images
- **Error Handling**: Graceful fallback to placeholder when images fail to load
- **Performance Optimized**: Memory caching for better performance

![PreImageView Demo](https://raw.githubusercontent.com/username/pre_image_view/main/screenshots/demo.gif)

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  pre_image_view: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## Usage

### Basic Usage

```dart
// Asset Image
PreImageView(
  'assets/images/sample.png',
  height: 200,
  width: 200,
)

// Network Image
PreImageView(
  'https://example.com/image.jpg',
  height: 200,
  width: 200,
)

// SVG Image
PreImageView(
  'assets/images/icon.svg',
  height: 200,
  width: 200,
)

// Lottie Animation
PreImageView(
  'assets/animations/loading.json',
  height: 200,
  width: 200,
)
```

### Advanced Styling

```dart
PreImageView(
  'https://example.com/image.jpg',
  height: 200,
  width: 200,
  fit: BoxFit.cover,
  borderRadius: BorderRadius.circular(16),
  border: Border.all(color: Colors.blue, width: 2),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.2),
      spreadRadius: 2,
      blurRadius: 10,
      offset: Offset(0, 5),
    ),
  ],
)
```

### Image Effects

```dart
// Blur Effect
PreImageView(
  'https://example.com/image.jpg',
  height: 200,
  width: 200,
  imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
)

// Color Blend
PreImageView(
  'https://example.com/image.jpg',
  height: 200,
  width: 200,
  svgColor: Colors.blue.withOpacity(0.5),
  blendMode: BlendMode.colorBurn,
)
```

### Custom Loading

```dart
PreImageView(
  'https://example.com/image.jpg',
  height: 200,
  width: 200,
  showLoadingProgress: true,
  progressIndicatorColor: Colors.red,
  progressIndicatorSize: 40,
  placeholder: Icon(
    Icons.image,
    size: 50,
    color: Colors.grey,
  ),
)
```

## Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `imagePath` | `String?` | Path to the image (asset, network URL, or file path) |
| `height` | `double?` | Height of the image |
| `width` | `double?` | Width of the image |
| `fit` | `BoxFit?` | How the image should be inscribed into the space |
| `alignment` | `Alignment?` | Alignment of the image within its bounds |
| `onTap` | `VoidCallback?` | Function to call when the image is tapped |
| `borderRadius` | `BorderRadius?` | Border radius of the image |
| `margin` | `EdgeInsetsGeometry?` | Margin around the image |
| `padding` | `EdgeInsetsGeometry?` | Padding inside the image container |
| `border` | `BoxBorder?` | Border around the image |
| `errorPlaceHolder` | `String` | Image to show when the main image fails to load |
| `boxShadow` | `List<BoxShadow>?` | Shadow effects for the image |
| `shape` | `BoxShape` | Shape of the image (rectangle or circle) |
| `svgColor` | `Color?` | Color to apply to SVG images |
| `blendMode` | `BlendMode?` | Blend mode for the image |
| `imageFilter` | `ImageFilter?` | Filter to apply to the image (e.g., blur) |
| `memoryCache` | `bool` | Whether to cache network images in memory |
| `progressIndicatorSize` | `double?` | Size of the loading progress indicator |
| `progressIndicatorColor` | `Color?` | Color of the loading progress indicator |
| `fadeInDuration` | `Duration?` | Duration for fade-in animation of network images |
| `showLoadingProgress` | `bool` | Whether to show loading progress for network images |

## Image Type Detection

PreImageView automatically detects the image type based on the path or URL:

- URLs starting with `http` or `https` are treated as network images
- Paths ending with `.svg` are treated as SVG images
- Paths ending with `.json` or `.zip` are treated as Lottie animations
- Paths starting with `file://` are treated as file system images
- All other paths are treated as asset images

## Dependencies

This package depends on:
- [cached_network_image](https://pub.dev/packages/cached_network_image) for network image caching
- [flutter_svg](https://pub.dev/packages/flutter_svg) for SVG rendering
- [lottie](https://pub.dev/packages/lottie) for Lottie animations

<!-- ## Example

For a complete example, see the [example](https://github.com/username/pre_image_view/tree/main/example) directory. -->

## Contributing

Contributions are welcome! If you find a bug or want a feature, please open an issue.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

This README provides comprehensive documentation for your PreImageView package, including:

1. An overview of the package's features
2. Installation instructions
3. Usage examples for different scenarios
4. Detailed parameter descriptions
5. Explanation of image type detection
6. Dependencies information
7. Links to example code and license


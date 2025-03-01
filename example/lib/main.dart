import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pre_image_view/pre_image_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PreImageView Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const ExampleHomePage(),
    );
  }
}

class ExampleHomePage extends StatefulWidget {
  const ExampleHomePage({Key? key}) : super(key: key);

  @override
  State<ExampleHomePage> createState() => _ExampleHomePageState();
}

class _ExampleHomePageState extends State<ExampleHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PreImageView Examples'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Basic Usage'),
              _buildExampleGrid([
                _buildExample(
                  'Asset Image',
                  PreImageView(
                    'assets/images/sample.png',
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                _buildExample(
                  'Network Image',
                  PreImageView(
                    'https://picsum.photos/200',
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(12),
                    showLoadingProgress: true,
                  ),
                ),
              ]),
              _buildSectionTitle('SVG Images'),
              _buildExampleGrid([
                _buildExample(
                  'SVG Asset',
                  PreImageView(
                    'assets/images/icon.svg',
                    height: 120,
                    width: 120,
                    svgColor: Colors.blue,
                  ),
                ),
                _buildExample(
                  'SVG Network',
                  PreImageView(
                    'https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/android.svg',
                    height: 120,
                    width: 120,
                    svgColor: Colors.green,
                  ),
                ),
              ]),
              _buildSectionTitle('Lottie Animations'),
              _buildExampleGrid([
                _buildExample(
                  'JSON Animation',
                  PreImageView(
                    'assets/animations/loading.json',
                    height: 120,
                    width: 120,
                  ),
                ),
              ]),
              _buildSectionTitle('Image Effects'),
              _buildExampleGrid([
                _buildExample(
                  'Blur Effect',
                  PreImageView(
                    'https://picsum.photos/201',
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(12),
                    imageFilter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                  ),
                ),
                _buildExample(
                  'Color Blend',
                  PreImageView(
                    'https://picsum.photos/202',
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(12),
                    svgColor: Colors.red.withOpacity(0.5),
                    blendMode: BlendMode.colorBurn,
                  ),
                ),
              ]),
              _buildSectionTitle('Custom Styling'),
              _buildExampleGrid([
                _buildExample(
                  'With Border',
                  PreImageView(
                    'https://picsum.photos/203',
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.purple, width: 3),
                  ),
                ),
                _buildExample(
                  'With Shadow',
                  PreImageView(
                    'https://picsum.photos/204',
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                ),
              ]),
              _buildSectionTitle('Custom Loading'),
              _buildExampleGrid([
                _buildExample(
                  'Custom Progress',
                  PreImageView(
                    'https://picsum.photos/205',
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(12),
                    showLoadingProgress: true,
                    progressIndicatorColor: Colors.red,
                    progressIndicatorSize: 40,
                  ),
                ),
                _buildExample(
                  'Custom Placeholder',
                  PreImageView(
                    'https://picsum.photos/206',
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(12),
                    placeholder: const Icon(
                      Icons.image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ]),
              _buildSectionTitle('Shapes'),
              _buildExampleGrid([
                _buildExample(
                  'Circle Shape',
                  PreImageView(
                    'https://picsum.photos/207',
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                    shape: BoxShape.circle,
                  ),
                ),
                _buildExample(
                  'Rectangle Shape',
                  PreImageView(
                    'https://picsum.photos/208',
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ]),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildExampleGrid(List<Widget> examples) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: examples,
    );
  }

  Widget _buildExample(String title, Widget example) {
    return Column(
      children: [
        Expanded(child: example),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

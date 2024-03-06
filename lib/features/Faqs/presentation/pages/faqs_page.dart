import 'package:flutter/material.dart';
import 'package:tup_ar/features/Faqs/presentation/widgets/faqs_list.dart';
import 'package:url_launcher/url_launcher.dart';

class FaqsPage extends StatelessWidget {
  const FaqsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQs'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final url = Uri.parse('https://docs.google.com/forms/d/e/1FAIpQLSe0ycS_zJ4mNJYEP8wXCUw3MlTrMd2P0sbQCFJ-3tuROMqZtQ/viewform');
          launchUrl(url);
        },
        child: const Icon(
          Icons.send_rounded,
        ),
      ),
      body: const FaqsList(),
    );
  }
}

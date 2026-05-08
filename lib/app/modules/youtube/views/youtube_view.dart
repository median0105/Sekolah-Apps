import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/youtube_controller.dart';

import 'package:url_launcher/url_launcher.dart';

class YoutubeView extends GetView<YoutubeController> {
  const YoutubeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konten YouTube'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.videos.isEmpty) {
          return const Center(child: Text('Tidak ada video'));
        }

        return ListView.builder(
          itemCount: controller.videos.length,
          itemBuilder: (context, index) {
            final video = controller.videos[index];

            return Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: Image.network(
                  video['thumbnail'],
                  width: 100,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  video['title'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  video['description'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () async {
              final videoId = video['videoId'];

              final Uri url = Uri.parse(
                'https://www.youtube.com/watch?v=$videoId',
              );

              await launchUrl(
                url,
                mode: LaunchMode.inAppBrowserView,
              );
            },
              ),
            );
          },
        );
      }),
    );
  }
}
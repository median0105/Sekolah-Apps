import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class YoutubeController extends GetxController {
  final isLoading = false.obs;
  final videos = <Map<String, dynamic>>[].obs;

  final String apiKey = 'AIzaSyBy_3SqnmnLMoxdOb960FfHN7efP67NxGA';
  final String channelId = 'UC1dI4tO13ApuSX0QeX8pHng';

  @override
  void onInit() {
    super.onInit();
    ambilVideoYoutube();
  }

  Future<void> ambilVideoYoutube() async {
    try {
      isLoading.value = true;

      final url = Uri.parse(
        'https://www.googleapis.com/youtube/v3/search'
        '?part=snippet'
        '&channelId=$channelId'
        '&maxResults=10'
        '&order=date'
        '&type=video'
        '&key=$apiKey',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List items = data['items'];

        videos.value = items.map((item) {
          return {
            'title': item['snippet']['title'],
            'description': item['snippet']['description'],
            'thumbnail': item['snippet']['thumbnails']['medium']['url'],
            'videoId': item['id']['videoId'],
          };
        }).toList();
      } else {
        Get.snackbar('Error', 'Gagal mengambil data YouTube');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
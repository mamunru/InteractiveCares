import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoDetailsController extends GetxController {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  bool isVideoLoading = true;
  bool areDetailsLoading = false;
  bool areLessonsLoading = true;
  bool showDetails = true;

  int item = 0;

  Map<String, dynamic> coursesdetails = {};

  @override
  void onInit() {
    super.onInit();
    _initializeVideoPlayer();
    //showDetailsfun();
  }

  void _initializeVideoPlayer() async {
    coursesdetails = Get.arguments as Map<String, dynamic>;
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'));
    await videoPlayerController.initialize();
    isVideoLoading = false;

    update();
  }

  void showDetailsfun() {
    showDetails = true;
    areDetailsLoading = true;
    update();

    // Simulate loading time (replace with actual data fetching)
    Future.delayed(Duration(seconds: 2), () {
      areDetailsLoading = false;
      update();
    });
  }

  void showLessonList() {
    showDetails = false;
    areLessonsLoading = true;
    update();

    // Simulate loading time (replace with actual data fetching)
    Future.delayed(Duration(seconds: 2), () {
      areLessonsLoading = false;
      update();
    });
  }

  void changeintem(int i) {
    item = i;
    update();
  }
}

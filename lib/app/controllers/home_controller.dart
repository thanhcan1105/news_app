import 'package:get/get.dart';
import 'package:news_app/app/models/news_model.dart';
import 'package:news_app/app/services/home_services.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isLoadingMore = false.obs;
  RxBool isShowButton = true.obs;
  String url = '';
  RxList<NewsModel> result = <NewsModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getNewsLists();
    super.onInit();
  }

  void getNewsLists() async {
    isLoading.value = true;
    var response = await HomeService().getNewsLists();
    List<NewsModel> newsList = List.from(
      response['data'].map((element) => NewsModel.fromJson(element)).toList(),
    );
    url = response['next_page_url'];
    result.assignAll(newsList);
    isLoading.value = false;
  }

  void getMoreNews() async {
    isLoadingMore.value = true;
    var response = await HomeService().getMoreNews(url: url);
    List<NewsModel> newsList = List.from(
      response['data'].map((element) => NewsModel.fromJson(element)).toList(),
    );
    if (response['next_page_url'] == null) {
      url = '';
      isShowButton.value == false;
    } else {
      url = response['next_page_url'];
    }
    result.addAll(newsList);
    isLoadingMore.value = false;
  }

  void selectedBottomBar(value) {
    isLoading.value = true;
    selectedIndex.value = value;
    isLoading.value = false;
  }
}

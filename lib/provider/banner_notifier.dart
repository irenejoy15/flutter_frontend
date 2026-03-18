import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/models/banner_model.dart';

class BannerNotifier extends Notifier<List<BannerModel>>{
  @override
  List<BannerModel> build() {
    return [];
  }

  void setBanner(List<BannerModel> banners){
    state = banners;
  }
}

final bannerProvider = NotifierProvider<BannerNotifier, List<BannerModel>>(() => BannerNotifier());
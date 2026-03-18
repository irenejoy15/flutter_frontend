import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/controllers/banner_controller.dart';
import 'package:shop_app/models/banner_model.dart';
import 'package:shop_app/provider/banner_notifier.dart';

class AdsWidgets extends ConsumerStatefulWidget {
  const AdsWidgets({super.key});

  @override
  ConsumerState<AdsWidgets> createState() => _AdsWidgetsState();
}

class _AdsWidgetsState extends ConsumerState<AdsWidgets> {
  late Future<List<BannerModel>> _bannersFuture;
  @override
  
  // INITIALIZE THE FUTURE TO FETCH BANNERS
  void initState() {
    super.initState();
    // 
    BannerController().fetchBanners().then((banners){
      ref.read(bannerProvider.notifier).setBanner(banners);
    });
    // _bannersFuture = BannerController().fetchBanners();
  }
  Widget build(BuildContext context) {
      final banners = ref.watch(bannerProvider);
      if(banners.isEmpty){
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          child: Center(child: CircularProgressIndicator()),
        );
      }
      return CarouselSlider(items: banners.map((banner){
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05,vertical: MediaQuery.of(context).size.height * 0.01),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(banner.imageUrl, fit: BoxFit.cover, width: double.infinity,),
            ),
          );
      }).toList(), options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.25,
        autoPlay: true,
        aspectRatio: 16/9,
        viewportFraction: 0.9,
        autoPlayInterval: Duration(seconds: 3),
      ));
  }
}
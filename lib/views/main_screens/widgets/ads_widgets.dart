import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/controllers/banner_controller.dart';
import 'package:shop_app/models/banner_model.dart';

class AdsWidgets extends StatefulWidget {
  const AdsWidgets({super.key});

  @override
  State<AdsWidgets> createState() => _AdsWidgetsState();
}

class _AdsWidgetsState extends State<AdsWidgets> {
  late Future<List<BannerModel>> _bannersFuture;
  @override
  // INITIALIZE THE FUTURE TO FETCH BANNERS
  void initState() {
    super.initState();
    _bannersFuture = BannerController().fetchBanners();
  }
  Widget build(BuildContext context) {
    return FutureBuilder(future: _bannersFuture, builder: (contex, snapshot){
      if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),);
      }
      if(snapshot.hasError){
        return Center(child: Text('Error loading banners: ${snapshot.error}'),);
      }
      final banners = snapshot.data;
      return CarouselSlider(items: banners!.map((banner){
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
    },);
  }
}
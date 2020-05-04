import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeSlider extends StatefulWidget {
  @override
  _HomeSliderState createState() => _HomeSliderState();

}



class _HomeSliderState extends State<HomeSlider> {

  final List<String> imgList = [
    'https://cdn.shopify.com/s/files/1/0222/8430/4480/products/Moshions_Imigongo_Beaded_Cardigan_for_Ichyulu_2_1024x.jpg?v=1577395781',
    'https://lh3.googleusercontent.com/proxy/QfHqRet_08iW46GTO02cJa4e9y7h73yh5JjghCSN9SiKTEyr6JxMHlQ5Ec-eGeZ0pzM6KrtXCmRa7uJVGcGs_dPCLszhHLdf5xu1T3ibTfD6DOD7phG3CsR0JE-lp9E3Asjm',
    'https://www.slanted.de/wp-content/uploads/2019/12/ds19_Slanted_Rwanda_Moshions12941.jpg',
    'https://moshions.rw/wp-content/uploads/2017/11/DSC6550.jpg',
    'https://www.newtimes.co.rw/sites/default/files/2_65.jpg',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: <Widget>[
          Center(
            child: CarouselSlider(
              autoPlay: true,
              pauseAutoPlayOnTouch: Duration(seconds: 10),
              height: 350.0,
              viewportFraction: 1.0,
              items: imgList.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: i,
                          placeholder: (context, url) => Center(
                              child: CircularProgressIndicator()
                          ),
                          errorWidget: (context, url, error) => new Icon(Icons.error),
                        )
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

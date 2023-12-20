import 'package:api_integration/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Details extends StatelessWidget {
  const Details({super.key, required this.pro});
  final Product pro;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.blue,
        title: Center(
          child: pro.title.text.bold.white.size(30).make(),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              VxSwiper.builder(
                autoPlay: true,
                viewportFraction: 1.0,
                height: 350,
                aspectRatio: 16 / 9,
                itemCount: pro.images.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    pro.images[index],
                    width: double.infinity,
                    fit: BoxFit.contain,
                  );
                },
              ).box.make(),
            ],
          ),
        ),
      ),
    );
  }
}

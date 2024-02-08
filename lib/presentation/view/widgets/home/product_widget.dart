import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/data/models/categories/categories_model.dart';
import 'package:shop_app/presentation/view/widgets/home/gride_view_widget.dart';
import 'package:shop_app/presentation/view/widgets/home/item_builder_widget.dart';
import '../../../../data/models/home_model/home_model.dart';

class ProductsBuilderWidget extends StatelessWidget {
  const ProductsBuilderWidget(
      {super.key, required this.homeModel, required this.catModel});

  final HomeModel homeModel;
  final CategoriesModel catModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CarouselSlider(
          items: homeModel.data.banners
              .map(
                (e) => Image.network("${e.image}"),
              )
              .toList(),
          options: CarouselOptions(
            viewportFraction: 1.0,
            height: 250.0,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(seconds: 1),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Categories",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 100,
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ItemBuilderWidget(
                          catModel: catModel,
                          index: index,
                        ),
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                    itemCount: catModel.data.data.length),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "New Product",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.grey[300],
          child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 1 / 1.58,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
              homeModel.data.product.length,
              (index) => GridViewWidget(homeModel: homeModel, index: index),
            ),
          ),
        ),
      ]),
    );
  }
}
//
// Widget productsBuilderWidge(HomeModel? model, CategoriesModel? CatModel) =>
// SingleChildScrollView(
//       physics: const BouncingScrollPhysics(),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CarouselSlider(
//               items: model!.data.banners
//                   .map(
//                     (e) => Image.network("${e.image}"),
//                   )
//                   .toList(),
//               options: CarouselOptions(
//                 viewportFraction: 1.0,
//                 height: 250.0,
//                 initialPage: 0,
//                 enableInfiniteScroll: true,
//                 reverse: false,
//                 autoPlay: true,
//                 autoPlayInterval: const Duration(seconds: 3),
//                 autoPlayAnimationDuration: const Duration(seconds: 1),
//                 autoPlayCurve: Curves.fastOutSlowIn,
//                 scrollDirection: Axis.horizontal,
//               )),
//           const SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Categories",
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
//                 ),
//                 Container(
//                   height: 100,
//                   child: ListView.separated(
//                     physics: const BouncingScrollPhysics(),
//                     scrollDirection: Axis.horizontal,
//                       itemBuilder: (context, index) => ItemBuilderWidget(CatModel,index),
//                       separatorBuilder: (context, index) => const SizedBox(
//                             width: 10,
//                           ),
//                       itemCount: CatModel!.data.data.length),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   "New Product",
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             color: Colors.grey[300],
//             child: GridView.count(
//               crossAxisCount: 2,
//               shrinkWrap: true,
//               mainAxisSpacing: 5,
//               crossAxisSpacing: 5,
//               childAspectRatio: 1 / 1.58,
//               physics: const NeverScrollableScrollPhysics(),
//               children: List.generate(model.data.product.length,
//                   (index) => gridViewWidget(model, index)),
//             ),
//           ),
//         ],
//       ),
//     );

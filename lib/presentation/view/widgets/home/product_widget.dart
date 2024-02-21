import 'package:flutter/material.dart';
import 'package:shop_app/presentation/view/widgets/home/carousel_slider_section.dart';
import 'package:shop_app/presentation/view/widgets/home/product_component.dart';
import 'category_component.dart';

class ProductsBuilderWidget extends StatelessWidget {
  const ProductsBuilderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CarouselSliderSection(),
        SizedBox(height: 10),
        CategoryComponent(),
        ProductComponent(),
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

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../manager/shop_cubit/cubit/shop_cubit.dart';
import '../../../manager/shop_cubit/cubit/states.dart';

class CarouselSliderSection extends StatelessWidget {
  const CarouselSliderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ShopCubit cubit = ShopCubit.get(context);
    cubit.getHomeData();
    return BlocBuilder<ShopCubit, ShopStates>(
      // listener: (context, state) {},
      buildWhen: (previous, current) {
        return current is ShopSuccessHomeDataStates;
      },
      builder: (context, state) {
        if (state is ShopSuccessHomeDataStates) {
          return CarouselSlider(
            items: state.homeModel.data.banners
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
          );
        } else {
          //return const Center(child: CircularProgressIndicator());
          return Container();
        }
      },
    );
  }
}

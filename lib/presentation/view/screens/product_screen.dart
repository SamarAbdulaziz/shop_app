import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/presentation/manager/shop_cubit/cubit/cubit.dart';
import 'package:shop_app/presentation/manager/shop_cubit/cubit/states.dart';

import '../widgets/home/product_widget.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, ShopStates state) {
        ShopCubit cubit = ShopCubit.get(context);

        return ConditionalBuilder(
          condition: cubit.homeModel != null && cubit.catModel != null,
          builder: (context) =>
              //productsBuilderWidget(cubit.homeModel, cubit.catModel),
              productsBuilderWidget(
                  homeModel: cubit.homeModel!, catModel: cubit.catModel!),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

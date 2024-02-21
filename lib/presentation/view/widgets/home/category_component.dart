import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/presentation/manager/shop_cubit/cubit/shop_cubit.dart';
import 'package:shop_app/presentation/manager/shop_cubit/cubit/states.dart';

import 'item_builder_widget.dart';

class CategoryComponent extends StatelessWidget {
  const CategoryComponent({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    ShopCubit cubit = ShopCubit.get(context);
    cubit.getCatData();
    return BlocBuilder<ShopCubit, ShopStates>(
      //listener: (context, state) {},
      buildWhen: (previous, current) {
        return current is ShopSuccessCategoriesDataStates;
      },
      builder: (context, state) {
        if (state is ShopSuccessCategoriesDataStates) {
          return Padding(
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
                      catModel: state.categoriesModel,
                      index: index,
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemCount: state.categoriesModel.data.data.length,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // const Text(
                //   "New Product",
                //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                // ),
              ],
            ),
          );
        }
        if (state is ShopErrorCategoriesDataStates) {
          return Center(
            child: Text(
              state.error,
            ),
          );
        } else {
          // return const Center(
          //   child: CircularProgressIndicator(),
          // );
          return Container();

        }
      },
    );
  }
}

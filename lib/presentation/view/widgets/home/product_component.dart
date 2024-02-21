import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/presentation/manager/shop_cubit/cubit/shop_cubit.dart';
import 'package:shop_app/presentation/manager/shop_cubit/cubit/states.dart';
import 'gride_view_widget.dart';

class ProductComponent extends StatelessWidget {
  const ProductComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ShopCubit cubit = ShopCubit.get(context);
    cubit.getHomeData();
    return BlocBuilder<ShopCubit, ShopStates>(
      //listener: (context, state) {},
      buildWhen: (previous, current) {
        return current is ShopSuccessHomeDataStates;
      },
      builder: (context, state) {
        if (state is ShopSuccessHomeDataStates) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "New Product",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
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
                    state.homeModel.data.product.length,
                    (index) => ProductGridViewWidget(
                        homeModel: state.homeModel, index: index),
                  ),
                ),
              ),
            ],
          );
        }
        if (state is ShopErrorHomeDataStates) {
          return Center(child: Text(state.error));
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

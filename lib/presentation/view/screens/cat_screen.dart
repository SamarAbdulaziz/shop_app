import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/components.dart';
import 'package:shop_app/presentation/manager/shop_cubit/cubit/shop_cubit.dart';
import 'package:shop_app/presentation/manager/shop_cubit/cubit/states.dart';
import 'package:shop_app/presentation/view/widgets/categories/cat_widget.dart';

class CatScreen extends StatelessWidget {
  const CatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShopCubit cubit = ShopCubit.get(context);
    cubit.getCatData();
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (BuildContext context, ShopStates state) {
        if (state is ShopErrorCategoriesDataStates) {
          showToast(msg: state.error, state: ToastStates.error);
        }
      },
      buildWhen: (previous, current) {
        return current is ShopSuccessCategoriesDataStates;
      },
      builder: (BuildContext context, ShopStates state) {
        debugPrint('build catScreen');

        if (state is ShopSuccessCategoriesDataStates) {
          var catModel = state.categoriesModel;
          //debugPrint(catModel.status.toString());
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                CategoriesGridViewWidget(catModel: catModel, index: index),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: catModel.data.data.length,
          );
        }
        if (state is ShopLoadingCategoriesDataStates) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ShopErrorCategoriesDataStates) {
          return Center(
            child: Text(
              state.error,
            ),
          );
        }
        else {
          return const Center(
            child: Text('refresh'),
          );
        }
        // return ConditionalBuilder(
        //   condition: cubit.catModel != null,
        //   builder: (context) => ListView.separated(
        //     physics: const BouncingScrollPhysics(),
        //     itemBuilder: (context, index) =>
        //         GridViewWidget(catModel: cubit.catModel!, index: index),
        //     separatorBuilder: (context, index) => const Divider(),
        //     itemCount: cubit.catModel!.data.data.length,
        //   ),
        //   fallback: (context) => const Center(
        //     child: CircularProgressIndicator(),
        //   ),
        // );
      },
    );
  }
}

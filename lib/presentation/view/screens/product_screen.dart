import 'package:flutter/material.dart';
import '../widgets/home/product_widget.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ShopCubit cubit = ShopCubit.get(context);
    // cubit.getHomeData();
    return const ProductsBuilderWidget();
    // return BlocConsumer<ShopCubit, ShopStates>(
    //   listener: (BuildContext context, state) {},
    //   builder: (BuildContext context, ShopStates state) {
    //     if (state is ShopSuccessHomeDataStates) {
    //       debugPrint('**********shopSuccessHomeDataStates***********');
    //       return const ProductsBuilderWidget();
    //     }
    //     if (state is ShopLoadingHomeDataStates) {
    //       debugPrint('**********shopLoadingHomeDataStates***********');
    //
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //     if (state is ShopErrorHomeDataStates) {
    //       debugPrint('**********shopLoadingHomeDataStates***********');
    //       return Center(child: Text(state.error));
    //     } else {
    //       return const Center(
    //         child: Text("your internet connection may be lost"),
    //       );
    //     }
    //
    //     // return ConditionalBuilder(
    //     //   condition: cubit.homeModel != null && cubit.catModel != null,
    //     //   builder: (context) =>
    //     //       //productsBuilderWidget(cubit.homeModel, cubit.catModel),
    //     //       ProductsBuilderWidget(
    //     //           homeModel: cubit.homeModel!, catModel: cubit.catModel!),
    //     //   fallback: (context) => const Center(
    //     //     child: CircularProgressIndicator(),
    //     //   ),
    //     // );
    //   },
    // );
  }
}
/*  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (BuildContext context, state) {
        // if (state is ShopSuccessHomeDataStates) {
        //   homeModel = state.homeModel;
        // }
        // if (state is ShopSuccessCategoriesDataStates) {
        //   catModel = state.categoriesModel;
        // }
      },
      builder: (BuildContext context, ShopStates state) {
        ShopCubit cubit = ShopCubit.get(context);
        if (state is ShopSuccessHomeDataStates ) {
          debugPrint('**********shopSuccessHomeDataStates***********');
          return ProductsBuilderWidget(
            homeModel: state.homeModel,
            catModel: cubit.cateModel,
          );
        }
        if (state is ShopLoadingHomeDataStates) {
          debugPrint('**********shopLoadingHomeDataStates***********');

          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ShopErrorHomeDataStates) {
          debugPrint('**********shopLoadingHomeDataStates***********');
          return Center(child: Text(state.error));
        } else {
          return const Center(
            child: Text("your internet connection may be lost"),
          );
        }

        // return ConditionalBuilder(
        //   condition: cubit.homeModel != null && cubit.catModel != null,
        //   builder: (context) =>
        //       //productsBuilderWidget(cubit.homeModel, cubit.catModel),
        //       ProductsBuilderWidget(
        //           homeModel: cubit.homeModel!, catModel: cubit.catModel!),
        //   fallback: (context) => const Center(
        //     child: CircularProgressIndicator(),
        //   ),
        // );
      },
    );
  }
*/

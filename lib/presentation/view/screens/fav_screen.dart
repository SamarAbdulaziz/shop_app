import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/presentation/manager/shop_cubit/cubit/shop_cubit.dart';
import '../../../core/components.dart';
import '../../manager/shop_cubit/cubit/states.dart';
import '../widgets/favorites/fav_widget.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShopCubit cubit = ShopCubit.get(context);
    cubit.getHomeFavorite();
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (BuildContext context, ShopStates state) {
        if (state is ShopErrorFavDataStates) {
          showToast(msg: state.message, state: ToastStates.error);
        }
      },
      // buildWhen: (previous, current) {
      //   return current is ShopSuccessFavDataStates;
      // },
      builder: (BuildContext context, ShopStates state) {
        debugPrint('build FavScreen');
        if (state is ShopSuccessFavDataStates) {
          if (state.favoritesModel.data != null) {
            return Container(
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      BuildFavItem(state.favoritesModel, index, context),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 1,
                        width: double.infinity,
                      ),
                  itemCount: state.favoritesModel.data!.data2.length),
            );
          } else {
            const Center(
              child: Text(
                "“NO Favorites item yet, please browse the products First”",
                style: TextStyle(color: Colors.grey),
              ),
            );
          }
        }
        if (state is ShopLoadingFavDataStates) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ShopErrorFavDataStates) {
          return Center(
            child: Text(
              state.message,
            ),
          );
        } else {
          return const Center(
            child: Text(
              "“NO Favorites item yet, please browse the products First”",
              style: TextStyle(color: Colors.grey),
            ),
          );
        }

        //return Container();
      },
    );
  }
}
// ConditionalBuilder(
//   condition: cubit.favoritesModel != null,
//   builder: (context) => ListView.separated(
//       physics: const BouncingScrollPhysics(),
//       itemBuilder: (context, index) =>
//           BuildFavItem(cubit.favoritesModel, index, context),
//       separatorBuilder: (context, index) => const SizedBox(
//             height: 1,
//             width: double.infinity,
//           ),
//       itemCount: ShopCubit.get(context)
//           .favoritesModel!
//           .data!
//           .data2
//           .length),
//   fallback: (context) => const Center(
//         child: Text(
//           "“NO Favorites item yet, please browse the products First”",
//           style: TextStyle(color: Colors.grey),
//         ),
//       ));

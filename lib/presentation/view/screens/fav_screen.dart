import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/presentation/manager/shop_cubit/cubit/shop_cubit.dart';

import '../../manager/shop_cubit/cubit/states.dart';
import '../widgets/favorites/fav_widget.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (BuildContext context, ShopStates state) {},
        builder: (BuildContext context, ShopStates state) {
          ShopCubit cubit = ShopCubit.get(context);
          return ConditionalBuilder(
              condition: cubit.favoritesModel != null,
              builder: (context) => ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      BuildFavItem(cubit.favoritesModel, index, context),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 1,
                        width: double.infinity,
                      ),
                  itemCount: ShopCubit.get(context)
                      .favoritesModel!
                      .data!
                      .data2
                      .length),
              fallback: (context) => const Center(
                    child: Text(
                      "“NO Favorites item yet, please browse the products First”",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ));
        });
  }
}

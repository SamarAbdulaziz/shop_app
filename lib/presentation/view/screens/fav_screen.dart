
import 'package:flutter/material.dart';


class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Favorite Screen'
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return BlocConsumer<ShopCubit , ShopStates>(
  //       listener: (BuildContext context, ShopStates) {},
  //       builder: (BuildContext context, ShopStates state) {
  //         ShopCubit getData = ShopCubit.get(context);
  //         return  ConditionalBuilder(
  //             condition: getData.favoritesModel!= null,
  //             builder: (context) => ListView.separated(
  //                 physics: BouncingScrollPhysics(),
  //                 itemBuilder: (context, index) => BuildFavItem(getData.favoritesModel,index,context),
  //                 separatorBuilder:  (context, index) => Container(height: 1,width: double.infinity,),
  //                 itemCount: ShopCubit.get(context).favoritesModel!.data!.data2.length),
  //             fallback: (context) => const Center(
  //               child: Text("\“NO Favorites item yet, please browse the products First\”",style: TextStyle(color: Colors.grey),),
  //             ));
  //       });
  // }
}

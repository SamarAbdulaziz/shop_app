import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/colors.dart';
import '../../../../data/models/favorites/get_favorites_model.dart';
import '../../../manager/shop_cubit/cubit/cubit.dart';
import '../../../manager/shop_cubit/cubit/states.dart';


//5kFL74frSLflcYEH2yU8GGuhmFmoBORXpgKhdpevoILmq9QryZjrbv93zQTEwg4rMeAogY
Widget BuildFavItem(FavoritesModel? model,index,context) => BlocConsumer<ShopCubit, ShopStates>(
  listener: (BuildContext context, ShopStates state) {  },
  builder: (BuildContext context, ShopStates state) {
    int? id =model!.data!.data2[index].product!.id ;
    ShopCubit getData = ShopCubit.get(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(alignment: Alignment.bottomLeft,
                children:[
                  //
                  Image.network(
                    model.data!.data2[index].product!.image,
                    width: 100,
                    height: 200,
                  ),
                  // model.discount!=0
                  if(model.data!.data2[index].product!.discount != 0)
                    Container(
                      padding:const EdgeInsets.symmetric(
                          horizontal: 5
                      ),
                      color: Colors.red,
                      child: const Text('DISCOUNT',
                        style: TextStyle(
                            color: Colors.white
                        ),),
                    ),
                ]
            ),
            const SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //
                  Text(model.data!.data2[index].product!.name ,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      //
                      Text('${model.data!.data2[index].product!.price}',
                        style: const TextStyle(
                          color: defaultColor,

                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      //
                      if (model.data!.data2[index].product!.discount != 0)
                      //
                        Text('${model.data!.data2[index].product!.oldPrice}',
                          style:const TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough
                          ),
                        ),
                      const Spacer(),
                      CircleAvatar(
                        radius: 15,
                        // ShopCubit.get(context).favoriets[ model.id]==true?Colors.red:Colors.grey,
                        backgroundColor: getData.fav[model.data!.data2[index].product!.id] == true? Colors.red : defaultColor,
                        child: IconButton(
                            onPressed: (){
                              getData.changeFavIcon(id);
                            }, icon:const Icon(
                          Icons.favorite_border,
                          size:15,
                          color: Colors.white ,
                        )),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  },
);


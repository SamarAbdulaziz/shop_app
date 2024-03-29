import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/colors.dart';
import '../../../../data/models/search/search_model.dart';
import '../../../manager/search_cubit/search_cubit.dart';
import '../../../manager/search_cubit/states.dart';

class BuildListProductSearchItems extends StatelessWidget {
  const BuildListProductSearchItems({
    super.key,
    this.model,
    required this.index,
  });

  final SearchModel? model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchStates>(
      listener: (BuildContext context, SearchStates state) {},
      builder: (BuildContext context, SearchStates state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: 120,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(alignment: Alignment.bottomLeft, children: [
                  //
                  Image.network(
                    model!.data!.data2[index].image,
                    width: 100,
                    height: 200,
                  ),
                  // model.discount!=0
                  if (model!.data!.data2[index].discount != 0)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      color: Colors.red,
                      child: const Text(
                        'DISCOUNT',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                ]),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //
                      Text(
                        model!.data!.data2[index].name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          //
                          Text(
                            '${model!.data!.data2[index].price}',
                            style: const TextStyle(
                              color: defaultColor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          //

                          //
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
  }
}



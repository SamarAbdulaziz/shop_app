import 'package:flutter/material.dart';

import '../../../../data/models/categories/categories_model.dart';



class ItemBuilderWidget extends StatelessWidget {
  const ItemBuilderWidget({super.key, required this.catModel, required this.index});
final CategoriesModel catModel;
final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.network(
            "${catModel.data.data[index].image}",
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            color: Colors.black.withOpacity(0.8),
            child: Text(
              "${catModel.data.data[index].name}",
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


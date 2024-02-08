import 'package:flutter/material.dart';

import '../../../../data/models/categories/categories_model.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key, required this.catModel, required this.index});

  final CategoriesModel catModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Image.network(
            "${catModel.data.data[index].image}",
            fit: BoxFit.cover,
            width: 80,
            height: 80,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            "${catModel.data.data[index].name}",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios)),
        ],
      ),
    );
  }
}

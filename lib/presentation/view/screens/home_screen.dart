import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/components.dart';
import 'package:shop_app/presentation/manager/shop_cubit/cubit/shop_cubit.dart';
import 'package:shop_app/presentation/manager/shop_cubit/cubit/states.dart';
import 'package:shop_app/presentation/view/screens/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ShopCubit cubit = BlocProvider.of(context);
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {

        return Scaffold(
          appBar: AppBar(
            title: const Text('Home Screen',style: TextStyle(
            ),),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(
                    context,
                    const SearchScreen(),
                  );
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          body: state is ShopLoadingHomeDataStates?const Center(child: CircularProgressIndicator(),):cubit.bottomScreen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.changBottom(index);
            },
            currentIndex: cubit.currentIndex,
            selectedItemColor: Colors.blue,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: 'favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'settings',
              ),
            ],
          ),
        );
      },
    );
    // return BlocConsumer<ShopCubit, ShopStates>(
    //   listener: (context, state) {
    //     // TODO: implement listener
    //   },
    //   builder: (context, state) {
    //     var cubit = ShopCubit.get(context);
    //     return Scaffold(
    //       appBar: AppBar(
    //         title: const Text('Home Screen'),
    //         actions: [
    //           IconButton(
    //             onPressed: () {
    //               navigateTo(
    //                 context,
    //                 const SearchScreen(),
    //               );
    //             },
    //             icon: const Icon(Icons.search),
    //           ),
    //         ],
    //       ),
    //       body: cubit.bottomScreen[cubit.currentIndex],
    //       bottomNavigationBar: BottomNavigationBar(
    //         onTap: (index) {
    //           cubit.changBottom(index);
    //         },
    //         currentIndex: cubit.currentIndex,
    //         selectedItemColor: Colors.blue,
    //         showUnselectedLabels: true,
    //         unselectedItemColor: Colors.grey,
    //         items: const [
    //           BottomNavigationBarItem(
    //             icon: Icon(Icons.home),
    //             label: 'Home',
    //           ),
    //           BottomNavigationBarItem(
    //             icon: Icon(Icons.category_outlined),
    //             label: 'Category',
    //           ),
    //           BottomNavigationBarItem(
    //             icon: Icon(Icons.favorite_border),
    //             label: 'favorite',
    //           ),
    //           BottomNavigationBarItem(
    //             icon: Icon(Icons.settings),
    //             label: 'settings',
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );
  }
}

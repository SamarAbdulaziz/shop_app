import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return const Scaffold(
     body: Center(
       child: Text(
         'Search Screen'
       ),
     ),
   );
  }

  // @override
  // Widget build(BuildContext context) {
  //   var textSearchController=TextEditingController();
  //   return BlocProvider(
  //     create: (BuildContext context) =>SearchCubit(),
  //     child: BlocConsumer<SearchCubit,SearchStates>(
  //       listener: (context,state){},
  //       builder: (context,state){
  //         SearchCubit getData = SearchCubit.get(context);
  //
  //         return Scaffold(
  //           appBar: AppBar(),
  //           body: Padding(
  //             padding: const EdgeInsets.all(20.0),
  //             child: Column(
  //               children: [
  //                 defaultTextForm(
  //                   msg: 'please enter any words',
  //                   onSubmitted:(String? text){
  //                     SearchCubit.get(context).Search(text);
  //                   } ,
  //                   type: TextInputType.text,
  //                   controller: textSearchController,
  //                   labelText: 'Search',
  //                   icon: Icons.search,
  //                 ),
  //                 const SizedBox(height: 10,),
  //                 if(state is SearchLodingState)
  //                   const LinearProgressIndicator(),
  //                 if(state is SearchSucssesState)
  //                   Expanded(
  //                     child: ListView.separated(
  //                         physics:const BouncingScrollPhysics(),
  //                         itemBuilder: (context, index) =>
  //                             BuildListProductItem(getData.model,index,context),
  //                         separatorBuilder:  (context, index) => Container(height: 1,width: double.infinity,),
  //                         itemCount: getData.model!.data!.data2.length),
  //                   ),
  //               ],
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
}
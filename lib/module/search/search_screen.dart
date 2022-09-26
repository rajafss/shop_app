import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/module/search/cubit/cubit.dart';
import 'package:shopapp/module/search/cubit/states.dart';
import 'package:shopapp/shared/component/component.dart';

class SearchScreen extends StatelessWidget {
var formkey = GlobalKey<FormState>();

var searchControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopCubitSearch(),
      child: BlocConsumer<ShopCubitSearch, ShopSearchState>(
        listener: (context, state){},
        builder: (context, state)
        {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: searchControler,
                      validator: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'please enter text to search';
                        }
                      },
                      onChanged: (String text){
                        ShopCubitSearch.get(context).search(text);
                      },
                      decoration: InputDecoration(
                        labelText: "Search",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    if(state is ShopLoadingSearchState)
                      LinearProgressIndicator(),
                    SizedBox(
                      height: 10.0,
                    ),
                    if(state is ShopSuccessSearchState)
                    Expanded(child: ListView.separated(
                        itemBuilder: (context, index) => buildeFavItem(ShopCubitSearch.get(context).model!.data!.data![index],context, isOldPrice: false),
                        separatorBuilder: (context, index) => myDivider(),
                        itemCount: ShopCubitSearch.get(context).model!.data!.data!.length
                    ),)

                  ],
                ),
              ),
            ),
          );
        },

      ),
    );
  }

// Widget buildeFavItem(model, context,{bool oldPrice = true,}) =>
//     Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Container(
//         height: 120.0,
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               alignment: AlignmentDirectional.bottomStart,
//               children: [
//                 Image(
//                   image: NetworkImage(
//                       '${model!.image}'),
//                   width: 120.0,
//                   height: 120,
//                   fit: BoxFit.cover,
//                 ),
//                 if (model.discount != 0 && oldprice)
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 5.0),
//                     color: Colors.red,
//                     child: Text(
//                       'DISCOUNT',
//                       style: TextStyle(fontSize: 10.0, color: Colors.white),
//                     ),
//                   ),
//               ],
//             ),
//             SizedBox(width: 20.0,),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     '${model.name}',
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       fontSize: 14.0,
//                     ),
//                   ),
//                   Spacer(),
//                   Row(
//                     children: [
//                       Text(
//                         '${model.price}',
//                         style: TextStyle(
//                           fontSize: 12.0,
//                           color: defaultColor,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 5.0,
//                       ),
//                       // if(model.discount != 0)
//                       Text(
//                         '${model.oldPrice}',
//                         style: TextStyle(
//                             fontSize: 10.0,
//                             color: Colors.grey,
//                             decoration: TextDecoration.lineThrough),
//                       ),
//                       Spacer(),
//                       IconButton(
//                         onPressed: () {
//                           ShopCategoryCubit.get(context).changeFavorite(model.id!);
//
//                         },
//                         icon: CircleAvatar(
//                             radius: 15.0,
//                             backgroundColor:
//                             ShopCategoryCubit.get(context).favorites[model.id]!
//                                 ? Colors.grey
//                                 : defaultColor,
//                             child: Icon(
//                               Icons.favorite_border,
//                               size: 16.0,
//                               color: Colors.white,
//                             )),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );

}

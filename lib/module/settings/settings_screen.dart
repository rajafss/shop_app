// import 'package:flutter/material.dart';
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shopapp/models/users/user_model.dart';
// import 'package:shopapp/module/categories/cubit/cubit.dart';
// import 'package:shopapp/module/categories/cubit/state.dart';
//
// class SettingsScreen extends StatelessWidget {
//
// var phoneControler = TextEditingController();
// var emailControler = TextEditingController();
// var nameControler = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ShopCategoryCubit,ShopCategoriesState>(
//         listener: (context, state)
//         {
//           if(state is ShopSuccessProfile){
//           nameControler.text = state.userModel!.data.name;
//           emailControler.text = state.userModel!.data.email;
//           phoneControler.text = state.userModel!.data.phone;
//           }
//         },
//         builder: (context,state) {
//           var model = ShopCategoryCubit.get(context).userModel;
//           nameControler.text = model!.data.name;
//           emailControler.text = model.data.email;
//           phoneControler.text =  model.data.phone;
//           print(model.data.phone);
//
//           return ConditionalBuilder(
//             condition: ShopCategoryCubit
//                 .get(context).userModel != null,
//             builder: (BuildContext context) => buildProfileData(ShopCategoryCubit.get(context).userModel!.data),
//             fallback: (BuildContext context) =>
//                 Center(child: CircularProgressIndicator(),),
//
//           );
//         }
//     );
//
//
//   }
//
//   Widget buildProfileData(UserData? user) => Padding(padding: EdgeInsets.all(20.0),
//     child: Column(
//       children: [
//         Center(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15.0)
//               ),
//               child: Image(image: NetworkImage(user!.image),
//                 width: 120,height: 80,
//               fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 40.0,
//         ),
//         TextFormField(
//           keyboardType: TextInputType.text,
//           controller: nameControler,
//           validator: (value)
//           {
//             if(value!.isEmpty)
//             {
//               return 'please enter your name';
//             }
//           },
//           decoration: InputDecoration(
//             labelText: "name",
//             prefixIcon: Icon(Icons.person_outline_sharp),
//             border: OutlineInputBorder(),
//           ),
//         ),
//         SizedBox(
//           height: 20.0,
//         ),
//         TextFormField(
//           keyboardType: TextInputType.emailAddress,
//           controller: emailControler,
//           validator: (value)
//           {
//             if(value!.isEmpty)
//             {
//               return 'please enter your email address';
//             }
//           },
//           decoration: InputDecoration(
//             labelText: "Email Address",
//             prefixIcon: Icon(Icons.email_outlined),
//             border: OutlineInputBorder(),
//           ),
//         ),
//         SizedBox(
//           height: 20.0,
//         ),
//         TextFormField(
//           keyboardType: TextInputType.phone,
//           controller: phoneControler,
//           validator: (value)
//           {
//             if(value!.isEmpty)
//             {
//               return 'please enter your phone number';
//             }
//           },
//           decoration: InputDecoration(
//             labelText: "phone",
//             prefixIcon: Icon(Icons.phone),
//             border: OutlineInputBorder(),
//           ),
//         ),
//       ],
//     ),
//   );
// }

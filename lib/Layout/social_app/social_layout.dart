
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopapp/Layout/social_app/cubit/cubit.dart';
import 'package:shopapp/Layout/social_app/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class SocialLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state) {},
        builder: (context, state)
        {
          return Scaffold(
            appBar: AppBar(
              title: Text('News Feed',),
            ),
            body: ConditionalBuilder(
                condition: SocialCubit.get(context).model != null,
                builder: (context){
                  var model = SocialCubit.get(context).model;
                  return Column(
                    children: [
                    ],
                  );
                },
                fallback: (context) => Center(child: CircularProgressIndicator())),



          );
        },
    );

  }
}

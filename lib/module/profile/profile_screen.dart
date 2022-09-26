import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/models/users/user_model.dart';
import 'package:shopapp/module/categories/cubit/cubit.dart';
import 'package:shopapp/module/categories/cubit/state.dart';

class ProfileScreen extends StatelessWidget {
  var formkey = GlobalKey<FormState>();

var phoneControler = TextEditingController();
var emailControler = TextEditingController();
var nameControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCategoryCubit,ShopCategoriesState>(
        listener: (context, state)
        {
          if(state is ShopSuccessProfile){
          nameControler.text = state.userModel!.data.name;
          emailControler.text = state.userModel!.data.email;
          phoneControler.text = state.userModel!.data.phone;
          }
        },
        builder: (context,state) {
          var model = ShopCategoryCubit.get(context).userModel;
          nameControler.text = model!.data.name;
          emailControler.text = model.data.email;
          phoneControler.text =  model.data.phone;
          print(model.data.phone);

          return ConditionalBuilder(
            condition: ShopCategoryCubit
                .get(context).userModel != null,
          builder: (BuildContext context) {
            if(state is ShopLoadingUpdateProfile)  LinearProgressIndicator();
            return buildProfileData(ShopCategoryCubit.get(context).userModel!.data, context);
          } ,
            fallback: (BuildContext context) => Center(child: CircularProgressIndicator(),),

          );
        }
    );


  }

  Widget buildProfileData(UserData? user, context) => SingleChildScrollView(
    child: Padding(padding: EdgeInsets.all(20.0),
      child: Form(
        key: formkey,
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(user!.image),
                    radius: 80.0,

                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: nameControler,
              validator: (value)
              {
                if(value!.isEmpty)
                {
                  return 'please enter your name';
                }
              },
              decoration: InputDecoration(
                labelText: "name",
                prefixIcon: Icon(Icons.person_outline_sharp),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailControler,
              validator: (value)
              {
                if(value!.isEmpty)
                {
                  return 'please enter your email address';
                }
              },
              decoration: InputDecoration(
                labelText: "Email Address",
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              controller: phoneControler,
              validator: (value)
              {
                if(value!.isEmpty)
                {
                  return 'please enter your phone number';
                }
              },
              decoration: InputDecoration(
                labelText: "phone",
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.pink.shade700,
              ),
              child: MaterialButton(
                onPressed: ()
                {
                  if(formkey.currentState!.validate())
                  {
                    ShopCategoryCubit.get(context).updateProfile(
                        name: nameControler.text,
                        email: emailControler.text,
                        phone: phoneControler.text
                    );
                  }

                },
                child: Text('UPDATE',
                    style: TextStyle(
                      color: Colors.white,
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


import 'package:flutter/material.dart';
import 'package:shopapp/module/Shop_login/Shop_Login_Screen.dart';
import 'package:shopapp/module/social_app/Login/Login_screen.dart';
import 'package:shopapp/shared/component/component.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.pink.shade700,
                ),
                child: MaterialButton(
                  onPressed: ()
                  {
                   navigateTo(context, LoginScreen());
                  },
                  child: Text('Connect with firebase',
                      style: TextStyle(
                        color: Colors.white,
                      )
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
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
                    navigateTo(context, ShopLoginScreen());
                  },
                  child: Text('Connect with API',
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
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero/features/profile/widget/headline.dart';
import 'package:zero/features/profile/widget/popularItems.dart';
import 'package:zero/provider/user_provider.dart';



class Home extends StatefulWidget {

  static const String routeName='/home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    final user=Provider.of<userProvider>(context).user;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
            children: [
              searchbar(),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(child: specialOffer(context)),
              ),
              SizedBox(height: 15,),
              InkWell(onTap: (){
                print(user.email);
              },child: headline('Popular Item')),
              popularitems(),
              headline('Weekly Top'),
              popularitems(),
              headline('Trendy'),
              popularitems(),




      ],
          ),
        )




      ),
    );
  }
}

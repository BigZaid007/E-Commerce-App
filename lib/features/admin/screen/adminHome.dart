import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero/features/admin/screen/addingProducts/screen/addProduct.dart';
import 'package:zero/features/admin/screen/addingProducts/service/adminService.dart';
import 'package:zero/models/product.dart';

import '../../../global_varibales/global.dart';

class adminHome extends StatefulWidget {
  @override
  _adminHomeState createState() => _adminHomeState();
}

class _adminHomeState extends State<adminHome> {

  AdminService adminService=AdminService();
  List<Product>? product;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllProduct();
  }

  void fetchAllProduct() async
  {
    product=await adminService.fetchAllProducts(context);
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: product==null?Loader():GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),itemCount: product?.length, itemBuilder: (context,index)
      {
        final ProductData=product![index];
        print(product!.length);
        return Expanded(
          flex: 1,
          child:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,

                      image:NetworkImage(product![index].images[0])
                  )
              ),),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {

          Navigator.push(context, MaterialPageRoute(builder: (context)=>addScreen()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

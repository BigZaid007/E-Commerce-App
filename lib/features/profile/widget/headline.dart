import 'package:flutter/material.dart';

Widget headline(String headline)
{
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Text(headline,style: TextStyle(
         fontSize: 24,
         fontWeight: FontWeight.w800,
         color: Colors.black
       ),) ,
        Text('see all',style: TextStyle(
          fontSize: 20,
          color: Colors.grey
        ),)
      ],
    ),
  );
}

Widget searchbar()
{
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: Icon(Icons.search_sharp,color: Colors.black45,),
                hintText: 'Search',
                filled: true,
                fillColor: Colors.grey[200],
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black45,
                )
            ),
          ),
        ),
        SizedBox(width: 15,),
        Container(
          width: 50,
          height: 50,
          child: Icon(Icons.whatshot_sharp,color: Colors.grey[200],),
          decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle
          ),
        )
      ],
    ),
  );
}

Widget specialOffer(BuildContext context)
{
  return  Stack(
    alignment: AlignmentDirectional.topCenter,
    clipBehavior: Clip.antiAlias,
    overflow: Overflow.visible,
    children: [

    Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      width: MediaQuery.of(context).size.width/1.2,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.only(top: 32,left: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Flat 10% Off',style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: Colors.white
            ),),
            SizedBox(height: 10,),
            Text('On Polo Shirts',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white
            ),),
            SizedBox(height: 12,),
            Container(
              alignment: AlignmentDirectional.center,
              child: Text('Buy Now',style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w800
              ),),
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(colors: [
                    Colors.blueAccent,
                    Colors.lightBlueAccent
                  ],begin: AlignmentDirectional.topCenter)
              ),
            ),
          ],
        ),
      ),
    ),
      Positioned(
          top: -42,
          left:180,
          child: Image.asset('images/polo.png',height: 250,)),
    ],
  );
}

Widget popularitems()
{
  return Container(
    height: 200,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: 3,
          shrinkWrap: true,
          itemBuilder: (index,context){
        return Card(
          color: Colors.black,
          child: Image.asset('images/user.png'),
        );
      }),
    ),
  );
}

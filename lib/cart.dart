import 'package:flutter/material.dart';

class CartView extends StatefulWidget{
  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left), color: Colors.black,
          onPressed: (){},
        ),
      ),
      
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Shopping Cart",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21.0,
            ),
            ),

            SizedBox(height: 12.0),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: Colors.green[300],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Container(
                        width: 70.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          image: DecorationImage(
                              fit: BoxFit.scaleDown,
                              image: AssetImage(
                                  "asset/chicken.jpg")
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            width: 100.0,
                            child: Text("Fried rice", style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Container(
                          color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 20.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Icon(Icons.add,
                                size: 15.0,
                                color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text("1", style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                              ),
                              Container(
                                width: 20.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  color: Colors.blue[300],
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Icon(Icons.add,
                                  size: 15.0,
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(),
                              Text("\price GHC25.00",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
}
}
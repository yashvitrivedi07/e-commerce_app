import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/extensions.dart';
import 'package:flutter_application_1/utils/pro_list.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  double TotalPrice = 0;

  @override
  void initState() {
    cart_item.forEach((e) {
      TotalPrice += (e['price'] * e['qty']);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: cart_item.isEmpty
              ? const Center(
                  child: Text("NO DATA"),
                )

                //column

              : Column(
                  children: [
                    Expanded(
                        child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: cart_item
                            .map((e) => Container(

                              //row
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.network(e['thumbnail']),

                                      //column
                                      
                                           5.ofHeight,
                                           40.ofWidth,

                                             Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    e['title'],
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black,
                                                        fontSize: 18),
                                                  ),
                                                  Text(
                                                    e['price'].toString(),
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black,
                                                        fontSize: 16),
                                                  ),
                                                  Text(e['description'],softWrap: true,overflow: TextOverflow.visible,),
                                              
                                                                                      ],
                                                                                    ),
                                            ),
                                          

                                       Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  width: 2,
                                                  color: Colors.deepPurple),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: IconButton(
                                              onPressed: () {
                                                e['qty']--;
                                                TotalPrice -= e['price'];
                                                if (e['qty'] == 0) {
                                                  cart_item.remove(e);
                                                }
                                                setState(() {});
                                              },
                                              icon: const Icon(Icons.remove),
                                              color: Colors.deepPurple,
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  width: 2,
                                                  color: Colors.deepPurple),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Text(
                                              e['qty'].toString(),
                                              style: const TextStyle(
                                                  color: Colors.deepPurple),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    width: 2,
                                                    color: Colors.deepPurple),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: IconButton(
                                              onPressed: () {
                                                TotalPrice += e['price'];
                                                e['qty']++;

                                                setState(() {});
                                              },
                                              icon: const Icon(Icons.add),
                                              color: Colors.deepPurple,
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    width: 2,
                                                    color: Colors.deepPurple),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: IconButton(
                                                onPressed: () {
                                                  TotalPrice -= e['price'];
                                                  cart_item.remove(e);
                                                  setState(() {});
                                                },
                                                icon: const Icon(Icons.delete)),
                                          )
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    )),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        child: Text("\$ ${TotalPrice.toString()}"),
                      ),
                    )
                  ],
                )),
    );
  }
}

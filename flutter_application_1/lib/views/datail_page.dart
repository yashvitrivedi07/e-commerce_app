import 'package:flutter/material.dart';
import 'package:flutter_application_1/extensions.dart';
import 'package:flutter_application_1/utils/pro_list.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
     Map<String, dynamic>? products = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Center(
        child: Column(
          children: [
          
               SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    products['images'].length,
                    (index) => SizedBox(
                      height: size.height * .50,
                      width: size.width * .50,
                      
                      child: Image.network(
                        products['images'][index],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),

          
             Expanded(
               child: SizedBox(
               
                width: size.width * .90,
                 child: Container(  
                   decoration: BoxDecoration(
                    
                    color: Colors.white,
                    boxShadow: [BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(0, -10),
                      color: Colors.purple.shade300
                      
                    )],
                 
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(50)
                    ),),

                    // about product  
                 
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 30,top: 30),

                      child:  Text(products['title'],style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),),

                      ),
                 


                     7.ofHeight,
                        Padding(
                                padding: EdgeInsets.only(left: 30,top: 5),
                                child: Text(products['description'].toString(), style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14
                                  ),),
                              ),

                      7.ofHeight,

                       Padding(padding: EdgeInsets.only(left: 30,top: 5),
                      child:Text("\$ ${products['price'].toString()}",style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                      ),),
                      
                      7.ofHeight,


                      Row(
                        children: [
                          
                             SizedBox(
                              height: size.height * 0.070,
                              width: size.width * 0.070,
                               child: Container(
                                
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(width: 2,color: Colors.deepPurple),
                                  borderRadius: BorderRadius.circular(15)
                                ),

                                child: InkWell
                                (
                                  splashColor: Colors.purple,

                                  onTap: () {
                                      
                                    if(!cart_item.contains(products))
                                    {
                                      products['qty'] = 1;
                                      cart_item.add(products);
                                    }
                                  },
                                  child: Align(alignment: Alignment.center,child: Text("Add To Cart",))),


                              ),
                             ),

                           
                            
                        ],
                      )
                    ],
                   ),
                 ),
               ),
             )
            
          ],
        ),
      ),
    );
  }
}

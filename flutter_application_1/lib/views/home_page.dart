import 'package:flutter/material.dart';
import 'package:flutter_application_1/extensions.dart';
import 'package:flutter_application_1/views/sign_up.dart';
import 'package:flutter_application_1/utils/pro_list.dart';
import 'package:flutter_application_1/views/datail_page.dart';
import 'package:flutter_application_1/widgets/category_Tile.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  String selected = "All";
  RangeValues slider_value = RangeValues(0, 50000);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.search, color: Colors.deepPurple, size: 20),
          InkWell(
            onTap: () {
              setState(() {
                count++;
              });
              Navigator.of(context).pushNamed('sign_up');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.person, color: Colors.deepPurple, size: 20),
            ),
          ),

          IconButton(onPressed: () {
            setState(() {
              
            });
            Navigator.of(context).pushNamed('cart_page');
          }, icon: Icon(Icons.shopping_bag,color: Colors.deepPurple,size: 20,))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * 0.90,
                    height: 350,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          'https://img.freepik.com/free-vector/realistic-sale-landing-page-template-with-photo_23-2149054454.jpg?w=996&t=st=1719939105~exp=1719939705~hmac=d4b5139f97fe3b0dea1807ef66a9150b151dcbf6672cfee845bde17416a426ef',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.90,
                    height: 350,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          'https://img.freepik.com/free-photo/woman-holding-smartphone-with-inscription-screen_23-2147652183.jpg?t=st=1720010796~exp=1720014396~hmac=88d6e7cd7e8a2efe0e3f6fdcd6a45c52c15583646590d2557291098273f783fe&w=996',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * .1,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  DropdownButton(
                    value: selected,
                    hint: Text("Selected"),
                    onChanged: (value) {
                      selected = value ?? "All";
                      setState(() {});
                    },
              
                    
                    items: [
                      DropdownMenuItem(value: "All", child: Text("All")),
                      ...allCategories
                          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                    ],
                  ),
              
                  20.ofWidth,
                  Visibility(
                    visible: selected != "All",
                    child: ActionChip(
                      label: Text("Clear"),
                      avatar: Icon(Icons.close_fullscreen_sharp),
                      onPressed: () {
                        selected = "All";
                        slider_value = RangeValues(0, 50000);
                        setState(() {});
                      },
                    ),
                  ),

                  20.ofWidth,
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          "From\n${slider_value.start.toInt()}",
                          textAlign: TextAlign.center,
                        ),
                        Expanded(
                          child: RangeSlider(
                            values: slider_value,
                            onChanged: (value) {
                              slider_value = value;
                              setState(() {});
                            },
                            max: 50000,
                            min: 0,
                            divisions: 50000,
                          ),
                        ),
                        Text(
                          "End\n${slider_value.end.toInt()}",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            selected == "All"
                ? Column(
                    children: [
                      category_Tile(size: size, context: context),
                      ...allCategories
                          .map((e) =>
                              category_Tile(size: size, context: context, Category: e))
                          .toList(),
                    ],
                  )
                : category_Tile(
                    size: size,
                    context: context,
                    Category: selected,
                    start: slider_value.start,
                    end: slider_value.end,
                  ),
          ],
        ),
      ),
    );
  }
}

import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/utils/pro_list.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget category_Tile({
  required Size size,
  required BuildContext context,
  Category = "All",
  double start = 0,
  double end = 500000,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: Product.where((e) => Category == "All"
                  ? true
                  : Category == e['category'] &&
                      (e['price'] >= start && e['price'] <= end))
              .map((e) => GestureDetector(
                    onTap: () {
                      log(e['title']);

                      Navigator.of(context)
                          .pushNamed('detail_page', arguments: e);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        width: 200,
                        height: size.height * .4,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  offset: const Offset(10, 10),
                                  color: Colors.purple.shade200,
                                  spreadRadius: 10,
                                )
                              ],
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Align(
                              child: Column(
                                children: [
                                  Image.network(e['thumbnail']),
                                  Text(
                                    e['title'],
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(e['price'].toString()),
                                  RatingBarIndicator(
                                    rating: e['rating'],
                                    itemBuilder: (context, index) =>
                                        const Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                    ),
                                    itemCount: 5,
                                    itemSize: 20.0,
                                    direction: Axis.horizontal,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      )
    ],
  );
}

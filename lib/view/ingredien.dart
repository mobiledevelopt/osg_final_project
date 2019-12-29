import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:group09/model/Meals.dart';
import 'package:group09/model/model_ingredien.dart';
import 'package:group09/model/Model_meals.dart';
import 'package:group09/utility/Constants.dart';
import 'dart:convert';
import 'package:group09/view/filter.dart';
import 'package:http/http.dart';

class Ingredien extends StatefulWidget {
  @override
  _IngredienState createState() => _IngredienState();
}

class _IngredienState extends State<Ingredien> {
  @override
  Widget build(BuildContext context) {
    return getListIngredient();
  }

  Future<Model_meals> getData() async {
    Response response = await get(Constants.URL_INGREDIEN);
    if (response.statusCode == 200){
      Model_meals sample = Model_meals.fromJson(json.decode(response.body));
      return sample;
    }
    else
      throw Exception('error code: ${response.statusCode}');
  }

  getListIngredient() {
    return Center(
      child: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              Model_meals model_meals = snapshot.data;
              return model_meals.meal.isNotEmpty
                  ? _showIngredienList(context, model_meals)
                  : Center(child: Text("Tidak ada List Ingredien.."));
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
///te
  Widget _showIngredienList(BuildContext context, Model_meals data) =>
      ListView.builder(
          itemCount: data.meal == null ? 0 : data.meal.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                Card(
                  margin: EdgeInsets.all(18),
                  elevation: 7.0,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        onTap: () {
//                          filterIngredien(data.meal[index].strIngredient);
                        },
                        title: Text(
                          data.meal[index].strIngredient,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),

                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(data.meal[index].strDescription == null ? "No Deskripsi" : data.meal[index].strDescription,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 8,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),),
                      )
                    ],
                  ),
                ),
              ],
            );
          });
//ssss
  List<IngredienList> parseJson(String response) {
    if (response == null) {
      return [];
    } else {
      final parsed =
          json.decode(response.toString()).cast<Map<String, dynamic>>();
      return parsed
          .map<IngredienList>((json) => new IngredienList.fromJson(json))
          .toList();
    }
  }

  filterIngredien(String strIngredient) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FilterIngredien(strIngredient)));
  }
}

import 'package:flutter/material.dart';
import 'package:group09/model/model_filter.dart';
import 'dart:convert';
import 'package:http/http.dart';

class FilterIngredien extends StatelessWidget {
  final String strIngredient;

  FilterIngredien(this.strIngredient);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: getListIngredient(),
    );
  }

  getListIngredient() {
    return Center(
      child: FutureBuilder(
        future: HttpService().getMeals(),
        builder: (BuildContext context, AsyncSnapshot<List<Meals>> snapshot) {
          if (snapshot.hasData) {
            List<Meals> meals = snapshot.data;
            return ListView(
              children: meals
                  .map(
                    (Meals meal) => ListTile(
                        title: Text(meal.strMeal),
                        subtitle: Text("${meal.strMeal}"),
                        onTap: () {}),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class HttpService {
  final String postsURL =
      "https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood";

  Future<List<Meals>> getMeals() async {
    Response res = await get(postsURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Meals> posts = body
          .map(
            (dynamic item) => Meals.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Can't get meals.";
    }
  }
}

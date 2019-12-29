import 'dart:convert';

import 'package:group09/model/Meals.dart';
import 'package:group09/service/Webservice.dart';
import 'package:group09/utility/Constants.dart';

import 'model_ingredien.dart';

class Model_meals {

  List<Meals> meal;

  Model_meals({this.meal});

  @override
  String toString() {
    return ' $meal';
  }

  factory Model_meals.fromJson(Map<String, dynamic> json) {
//    return Model_meals(
//        meal: List<Meals>.from(json["meals"].map((meal) {
//          return IngredienList.fromJson(meal);
//        }))
//    );

    // baca property meal sebagai List (JSON Array)
    var listMeals = json["meals"] as List;

    // mapping listMeals kedalam bentuk MappedIterable<dynamic, Meals>
    var iterableMeals = listMeals.map((meals) {
      return Meals.fromJson(meals);
    });

    // lalu, kita konversi dari MappedIterable kedalam bentuk List<Meals>
    var meals = List<Meals>.from(iterableMeals);

    return Model_meals(
        meal: meals
    );
  }

  static Resource<List<Meals>> get all {
    return Resource(
        url: Constants.URL_INGREDIEN,
        parse: (response) {
          final result = json.decode(response.body);
          return result;
        }
    );
  }
}
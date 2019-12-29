import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Category {
  String idCategory;
  String strCategory;
  String strCategoryThumb;
  Category({this.idCategory, this.strCategory, this.strCategoryThumb});

  factory Category.fromJson(Map<String, dynamic> parsedJson) {
    return Category(
        idCategory: parsedJson['id'],
        strCategory: parsedJson['Category'],
        strCategoryThumb: parsedJson['CategoryThumb']);
  }
}

class Meal {
  String idMeal;
  String strMeal;
  String strInstructions;
  String strMealThumb;
  String strIngredient;

  Meal(
      {this.idMeal,
      this.strMeal,
      this.strInstructions,
      this.strMealThumb,
      this.strIngredient});

  factory Meal.fromJson(Map<String, dynamic> parsedJson) {
    return Meal(
        idMeal: parsedJson['id'],
        strMeal: parsedJson['Meal'],
        strInstructions: parsedJson['Instructions'],
        strMealThumb: parsedJson['MealThum'],
        strIngredient: parsedJson['Ingredient']);
  }
}

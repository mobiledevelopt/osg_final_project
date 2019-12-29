class IngredienList {
  String idIngredient;
  String strIngredient;
  String strDescription;

  IngredienList({
    this.idIngredient,
    this.strIngredient,
    this.strDescription,
  });

  factory IngredienList.fromJson(Map<String, dynamic> parsedJson) {
    return IngredienList(
      idIngredient: parsedJson['idIngredient'],
      strIngredient: parsedJson['strIngredient'],
      strDescription: parsedJson['strDescription'],
    );
  }
}

// class IngredienFilter {
//   String strMeal;
//   String strMealThumb;
//   String idMeal;

//   IngredienFilter({
//     this.strMeal,
//     this.strMealThumb,
//     this.idMeal,
//   });

//   factory IngredienFilter.fromJson(Map<String, dynamic> parsedJson) {
//     return IngredienFilter(
//       strMeal: parsedJson['strMeal'],
//       strMealThumb: parsedJson['strMealThumb'],
//       idMeal: parsedJson['idMeal'],
//     );
//   }
// }

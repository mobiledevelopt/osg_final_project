class Meals {

  String idIngredient;
  String strIngredient;
  String strDescription;

  Meals({this.idIngredient, this.strIngredient, this.strDescription});

  @override
  String toString() {
    return 'idIngredient: $idIngredient, strIngredient: $strIngredient, strDescription: $strDescription';
  }  factory Meals.fromJson(Map<String, dynamic> json) {
    return Meals(
        idIngredient: json["idIngredient"],
        strIngredient: json["strIngredient"],
        strDescription: json["strDescription"]
    );
  }
}
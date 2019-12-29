import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group09/model/ModelKategori.dart';
import 'package:group09/utility/Constants.dart';
import 'package:group09/view/filter.dart';
import 'package:group09/view/filter_kategori.dart';
import 'package:http/http.dart';

class Kategori extends StatefulWidget {
  _Kate createState() => _Kate();
}

class _Kate extends State<Kategori> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getListIngredient();
  }

  Future<ModelKategori> getData() async {
    Response response = await get(Constants.URL_KATEGORI);
    if (response.statusCode == 200){
     return modelKategoriFromJson(response.body);
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
              ModelKategori model_meals = snapshot.data;
              return model_meals.categories.isNotEmpty
                  ? _showIngredienList(context, model_meals)
                  : Center(child: Text("Tidak ada List Ingredien.."));
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }

  Widget _showIngredienList(BuildContext context, ModelKategori data) =>
      ListView.builder(
          itemCount: data.categories == null ? 0 : data.categories.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                filterIngredien(data.categories[index].strCategory);
              },
                child:Card(
                  margin: EdgeInsets.all(18),
                  elevation: 7.0,
                  child: Column(
                    children: <Widget>[
                      Image.network(data.categories[index].strCategoryThumb),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(data.categories[index].strCategory,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),),
                      )
                    ],
                  ),
                )
            );

          });

  filterIngredien(String strIngredient) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Filter_Kategori(strIngredient,context)));
  }
}




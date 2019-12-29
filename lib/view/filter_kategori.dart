import 'package:flutter/material.dart';
import 'package:group09/model/ModelKategori.dart';
import 'package:group09/model/Model_filter_kategori.dart';
import 'package:group09/model/model_filter.dart';
import 'package:group09/utility/Constants.dart';
import 'package:group09/view/Detail_kategori.dart';
import 'dart:convert';
import 'package:http/http.dart';

class Filter_Kategori extends StatelessWidget {
  final String strKategori;
  final BuildContext context;

  Filter_Kategori(this.strKategori,this.context);

  @override
  Widget build(BuildContext context) {
    Color gradient1 = const Color.fromRGBO(180, 35, 74, 1.0);
    Color gradient2 = const Color.fromRGBO(180, 35, 74, 1.0);
    Color gradient3 = const Color.fromRGBO(245, 127, 23, 1.0);

    return Scaffold(
      appBar: AppBar(
        title: Text("Filter Kategori"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                    gradient1,
                    gradient2,
                    gradient3,
                  ])),
        ) ,
      ),
      body: getListKategori(),
    );

  }

  Future<FilterKategori> getData() async {
    Response response = await get(Constants.URL_FILTER_KATEGORI + strKategori);
    if (response.statusCode == 200){
      return filterKategoriFromJson(response.body);
    }
    else
      throw Exception('error code: ${response.statusCode}');
  }

  getListKategori() {
    return Center(
      child: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            FilterKategori filter_kategori = snapshot.data;
            return filter_kategori.meals.isNotEmpty
                ? _showIngredienList(context, filter_kategori)
                : Center(child: Text("Tidak ada List Ingredien.."));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _showIngredienList(BuildContext context, FilterKategori data) =>
      ListView.builder(
          itemCount: data.meals == null ? 0 : data.meals.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: (){
                  filterIngredien(data.meals[index]);
                },
                child:Card(
                  margin: EdgeInsets.all(18),
                  elevation: 7.0,
                  child: Column(
                    children: <Widget>[
                      Image.network(data.meals[index]['strMealThumb']),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(data.meals[index]['strMeal'],
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

  filterIngredien(Map<String, String> strIngredient) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Detail_kategori(strIngredient)));
  }

}

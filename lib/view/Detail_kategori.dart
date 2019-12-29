
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group09/model/Model_filter_kategori.dart';

class Detail_kategori extends StatelessWidget {
  final Map<String, String> strKategori;

  Detail_kategori(this.strKategori);

  @override
  Widget build(BuildContext context) {
    Color gradient1 = const Color.fromRGBO(180, 35, 74, 1.0);
    Color gradient2 = const Color.fromRGBO(180, 35, 74, 1.0);
    Color gradient3 = const Color.fromRGBO(245, 127, 23, 1.0);

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Kategori"),
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
      body: _showIngredienList(context,strKategori),
    );


  }


  Widget _showIngredienList(BuildContext context, Map<String, String> data) =>
      ListView.builder(
          shrinkWrap: true,
          itemCount: data == null ? 0 : 1,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: (){
//                  filterIngredien(data.categories[index].strCategory);
                },
                child:Card(
                  margin: EdgeInsets.all(18),
                  elevation: 7.0,
                  child: Column(
                    children: <Widget>[
                      Image.network(data['strMealThumb']),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(data['strMeal'],
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          Text('Category '+ data['strCategory'],
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87)),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              color: Colors.black26,
                              height: 50.0,
                              width: 1.0,
                            ),
                          ),
                          Text('Food '+ data['strArea'],
                            textAlign: TextAlign.right,
                            overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87)
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: Text(
                                  "INGREDIENTS",
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),)
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              color: Colors.black26,
                              height: 1.0,
                            ),
                          ),
                          Container(
                            height: 200.0, // or whatever
                            child: ListView.builder(
                          // Let the ListView know how many items it needs to build.
                          itemCount: 20,
                          shrinkWrap: true,
                          // Provide a builder function. This is where the magic happens.
                          // Convert each item into a widget based on the type of item it is.
                          itemBuilder: (context, index) {
                            return ListTile(
                                title: Text(
                                    (index+1).toString() + ". " + data['strIngredient'+(index+1).toString()] + " " + data['strMeasure'+(index+1).toString()],
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87)
                                ),
                              );
                          },
                        ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Container(
                              color: Colors.black26,
                              height: 1.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  child: Text(
                                    "DIRECTIONS",
                                    style: TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87),)
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  child: Text(
                                    data['strInstructions'],
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87),)
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
            );

          });

}
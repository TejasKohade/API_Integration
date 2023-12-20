import 'package:api_integration/models/products_model.dart';
import 'package:api_integration/services/api_services.dart';
import 'package:flutter/material.dart';

import 'Details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(title: 'Flutter Demo Home Page'),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key, required String title});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.star),
        title: Text("Api Integration"),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: getPosts(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Product> product = snapshot.data;
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: product.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListTile(
                      // Within the `FirstRoute` widget
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  Details(
                              pro: product[index],
                            ),
                          ),
                        );
                      },
                      leading: Image.network(
                        product[index].thumbnail,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width / 5,
                      ),
                      title: Text(product[index].title.toString()),
                      subtitle: Row(
                        children: [
                          Expanded(
                            child: Text(product[index].description),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(product[index].price.toString()),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

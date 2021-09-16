import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'model/items.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primaryColor: Colors.grey[900]),
      darkTheme: ThemeData(primaryColor: Colors.black87),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ));

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Item> Items = [
    new Item(
        id: "1",
        shortdesc: "Measuring Cups",
        description: "Stainless steel measuring cups and spoons",
        price: 499.99,
        imagelocation: "assets/kitchen/1.png"),
    new Item(
        id: "2",
        shortdesc: "Cupcake/Muffin Pan",
        description: "6 base cupcake or muffin baking pan",
        price: 249.98,
        imagelocation: "assets/kitchen/2.png"),
    new Item(
        id: "3",
        shortdesc: "Baking Pan",
        description: "A multi-purpose baking or roasting pan",
        price: 249.98,
        imagelocation: "assets/kitchen/3.png"),
    new Item(
        id: "4",
        shortdesc: "Ceramic Plate Set",
        description:
            "An elegant white ceramic plate set. Four pieces of each sets of plate, bowl, and saucer.",
        price: 1189.89,
        imagelocation: "assets/kitchen/4.png"),
    new Item(
        id: "5",
        shortdesc: "Cooking Set",
        description: "A 3 piece non-stick but stainless steel cooking set. ",
        price: 3489.99,
        imagelocation: "assets/kitchen/5.png"),
    new Item(
        id: "6",
        shortdesc: "Spice Jar w/ Rack",
        description: "A simple yet multi purpose spice jar with rack.",
        price: 349.55,
        imagelocation: "assets/kitchen/6.png"),
    new Item(
        id: "7",
        shortdesc: "Colorful Plate set",
        description:
            "A playful set of plates, bowl, saucer, spoon, and fork. Perfect for modern yet playful kitchen experience.",
        price: 1249.55,
        imagelocation: "assets/kitchen/7.png"),
    new Item(
        id: "8",
        shortdesc: "Colorful Spice Containers",
        description:
            "A playful set of spice jars. Perfect for modern yet playful kitchen experience.",
        price: 499.99,
        imagelocation: "assets/kitchen/8.png"),
    new Item(
        id: "9",
        shortdesc: "3 set Ceramic Spice Jars",
        description:
            "A 3 set spice jars with printed labels for Suger, Tea, and Coffee.",
        price: 149.89,
        imagelocation: "assets/kitchen/9.png"),
    new Item(
        id: "10",
        shortdesc: "Fruit Bowl",
        description:
            "A black and elegant bowl perfect for displaying fruits or even cakes.",
        price: 129.99,
        imagelocation: "assets/kitchen/10.png"),
  ];

  @override
  Widget build(BuildContext context) {
    List<Material> cards = [];
    for (int i = 0; i < Items.length; i++) {
      cards.add(customCard(Items[i]));
    }

    Size dsize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Kitchen Korner"),
        ),
        endDrawer: Container(
          height: dsize.height,
          width: dsize.width * .75,
          color: Colors.grey[300],
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.horizontal,
                children: cards,
              ),
            ),
          ],
        ));
  }

  Material customCard(Item item) {
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
        width: 400,
        height: 400,
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(item.imagelocation),
            SizedBox(
              height: 5,
            ),
            Text(
              item.shortdesc,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              item.description,
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "₱  " + item.price.toString(),
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  width: 15,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

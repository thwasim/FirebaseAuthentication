import 'package:firebase_program/pages/home/widget/fruits.dart';
import 'package:firebase_program/pages/home/widget/selling.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AllFruits extends GetView {
  const AllFruits({Key? key}) : super(key: key);

  Future<List<Fruits>> getFruits() async{
    var fruitList=<Fruits>[];

    var f1=Fruits(1,"Fruit", "Apple", "assets/apples.png", 150.0);
    var f2=Fruits(2,"Fruit", "Banana", "assets/Banana.png", 50.00);
    var f3=Fruits(3,"Fruit", "BlueBerry", "assets/Blueberries.png", 200.0);
    var f4=Fruits(4,"Fruit", "Cherry", "assets/cherries.png", 140.0);
    var f5=Fruits(5,"Fruit", "Grapes", "assets/grapes.png", 90.00);
    var f6=Fruits(6,"Fruit", "Kiwi", "assets/kiwi.png", 280.0);
    var f7=Fruits(7,"Fruit", "Mandarin", "assets/mandarin.png", 80.00);
    var f8=Fruits(8,"Fruit", "Orange", "assets/oranges.jpg", 40.00);
    var f9=Fruits(9,"Fruit", "Pear", "assets/pear.png", 250.0);
    var f10=Fruits(10,"Fruit", "Strawberry", "assets/Strawberries.png", 320.0);

    fruitList.add(f1);
    fruitList.add(f2);
    fruitList.add(f3);
    fruitList.add(f4);
    fruitList.add(f5);
    fruitList.add(f6);
    fruitList.add(f7);
    fruitList.add(f8);
    fruitList.add(f9);
    fruitList.add(f10);
    return fruitList;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        title: const Text("All Fruits"),
      ),
      backgroundColor: const Color(0xFF1E1E1E),
      body: FutureBuilder<List<Fruits>>(
        future: getFruits(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var fruitList=snapshot.data;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2/3.7,
              ),
              itemCount: fruitList!.length,
              itemBuilder: (context,indeks){
                var fruit=fruitList[indeks];
                return Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Center(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>SellFruit(fruit: fruit,)));
                      },
                      child: Card(
                        color: const Color(0xFF2C2C2C),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(100.0),
                              topRight: Radius.circular(100.0),
                              bottomLeft: Radius.circular(50.0),
                              bottomRight: Radius.circular(50.0)
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 35.0),
                          child: Column(
                            children: [
                              SizedBox(
                                width: 150,
                                  height: 150,
                                  child: Image.asset(fruit.imagesName)
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0,left: 15.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(fruit.category,
                                    style:const TextStyle(
                                        color: Color(0xFFF1C950),
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 5.0,left: 15.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(fruit.fruitName,
                                    style:const TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 10.0,left: 15.0),
                                child: Row(
                                  children: [
                                    Text("₹${fruit.sale}",
                                      style: const TextStyle(
                                          color: Color(0xFFF1C950),
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 5.0),
                                      child: Text("per Kg",style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey
                                      ),),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }else{
            return const SizedBox(height: 0,);
          }
        },
      ),
    );
  }
}

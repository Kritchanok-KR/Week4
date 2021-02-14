import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:week4/calculate.dart';

void main() {
  runApp(MyApp(
    model: carshop(),
  ));
}

class MyApp extends StatelessWidget {
  final carshop model;
  const MyApp({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<carshop>(
      model: model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CarMarket',
        home: Listscreen(),
      ),
    );
  }
}

class Listscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent[50],
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent[300],
        title: Text('Car Market'),
      ),
      body: ListView.builder(
          itemExtent: 80,
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return ScopedModelDescendant<carshop>(
                builder: (context, child, model) {
              return ListTile(
                  leading: CircleAvatar(
                      backgroundImage: AssetImage(itemList[index].image)),
                  title: Text(itemList[index].title),
                  subtitle: Text('\$' + itemList[index].price.toString()),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    model.CarAdd(itemList[index]);
                    print('Add: ' + itemList[index].title);
                    print(model.Totalcarprice());
                  });
            });
          }),
    );
  }
}

class Car {
  int price;
  int id;
  String title;
  String image;
  Car(
      {@required this.price,
      @required this.id,
      @required this.title,
      @required this.image});
}

List<Car> itemList = [
  Car(
      id: 1,
      title: 'Car1',
      image: 'assets/images/pic1.jpg',
      price: 500),
  Car(
      id: 2,
      title: 'Car2',
      image: 'assets/images/pic2.jpg',
      price: 900),
  Car(
      id: 3,
      title: 'Car3',
      image: 'assets/images/pic3.jpg',
      price: 850),
  Car(
      id: 4,
      title: 'Car4',
      image: 'assets/images/pic4.jpg',
      price: 450),
  Car(
      id: 5,
      title: 'Car5',
      image: 'assets/images/pic5.jpg',
      price: 900),
  Car(
      id: 6,
      title: 'Car6',
      image: 'assets/images/pic6.jpg',
      price: 1500),
  Car(
      id: 7,
      title: 'Car7',
      image: 'assets/images/pic7.jpg',
      price: 1600),
  Car(
      id: 8,
      title: 'Car8',
      image: 'assets/images/pic8.jpg',
      price: 2500),
  Car(
      id: 9,
      title: 'Car9',
      image: 'assets/images/pic9.jpg',
      price: 8500),
  Car(
      id: 10,
      title: 'Car10',
      image: 'assets/images/pic10.jpg',
      price: 6500),
];

import 'package:scoped_model/scoped_model.dart';
import 'package:week4/main.dart';

class carshop extends Model {
  List<Car> cart = [];
  double totalvalue = 0;
  int get total => cart.length;

  void CarAdd(item) {
    cart.add(item);
  }

  String Totalcarprice() {
    totalvalue = 0;
    cart.forEach((f) {
      totalvalue += f.price;
    });
    return 'Total value: ' + totalvalue.toString() + ' \$';
  }
}

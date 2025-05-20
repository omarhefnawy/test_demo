import 'package:flutter_test/flutter_test.dart';
import 'package:testin_demo/methods/calc_discounted_price.dart';

void main(){
  group("test if it give the right price after discount", () {
    test("test if 100 discount", () {
     double actual=DiscountedPrice.calcDiscountedPrice(100, 100) ;
     expect(actual, 0);
    },);
    test("test if 0 discount", () {
      double actual=DiscountedPrice.calcDiscountedPrice(100, 0) ;
      expect(actual, 100);
    },);
  },);
  test("if entered regular number", () {
    double actual=DiscountedPrice.calcDiscountedPrice(100, 35) ;
    expect(actual, 65);
  },);
}
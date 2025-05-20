import 'package:flutter_test/flutter_test.dart';
import 'package:testin_demo/methods/counter_method.dart';

void main() {
  Counter counter ;
  test("test for increment ", () {
    counter=Counter();
    counter.incrementValue();
    expect(counter.value, 1);
  });
  test("decrement counter", () {
     counter = Counter();
    counter.decrementValue();
    expect(counter.value, -1);
  });
  test("increment then decrement value should be zero still ", () {
     counter = Counter();
    counter.incrementValue();
    counter.decrementValue();
    expect(counter.value, 0);
  });
}

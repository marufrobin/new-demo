Stream<double> continuousAnimationValues() async* {
  bool reverse = false;
  double value = 60.0;

  while (true) {
    yield value;

    if (reverse) {
      value += 1.0;
      if (value >= 100.0) {
        reverse = !reverse;
      }
    } else {
      value -= 1.0;
      if (value <= 50.0) {
        reverse = !reverse;
      }
    }

    await Future.delayed(const Duration(milliseconds: 20));
  }
}

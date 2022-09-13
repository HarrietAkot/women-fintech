extension ListUtils<T> on List<T> {
  num sumBy(num Function(T element) f) {
    num sum = 0;
    for (var item in this) {
      sum += f(item);
    }
    return sum;
  }

  int findOccurrences(T element) {
    var foundLetters = where((letter) => letter == element);
    return foundLetters.length;
  }
}

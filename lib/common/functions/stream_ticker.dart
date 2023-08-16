class StreamTicker {
  const StreamTicker();
  Stream<int> tick({required int ticks, required int total}) {
    return Stream.periodic(const Duration(seconds: 1), (x) {
      int v = ticks + x + 1;
      return v;
    }).take(total);
  }

  Stream<int> fall({required int start, required int end}) {
    return Stream.periodic(const Duration(seconds: 1), (x) {
      int v = start - x - 1;
      return v;
    }).take(end);
  }
}

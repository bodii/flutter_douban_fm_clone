class Ticker {
  const Ticker();
  Stream<int> tick({required int ticks, required int total}) {
    // print('ticks: $ticks ||| total: $total');
    return Stream.periodic(const Duration(seconds: 1), (x) {
      int v = ticks + x + 1;
      // print('stream periodic ticks: $v, total: $total');
      return v;
    }).take(total);
  }
}

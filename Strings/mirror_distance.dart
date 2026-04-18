class MirrorDistance {
  int mirrorDistance(int n) {
    return (n - reverse(n)).abs();
  }

  int reverse(int n) {
    String str = n.toString();
    str = str.split('').reversed.join('');

    return int.parse(str);
  }
}

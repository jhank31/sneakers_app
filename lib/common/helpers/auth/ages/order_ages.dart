class OrderAges {
  static List<String> sortAges(List<String> ages) {
    ages.sort((a, b) {
        int numberA = int.parse(a.split('-').first.replaceAll('+', '').trim());
        int numberB = int.parse(b.split('-').first.replaceAll('+', '').trim());
        return numberA.compareTo(numberB);
      });

      return ages;
  }
}
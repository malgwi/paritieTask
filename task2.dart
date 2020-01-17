import 'dart:io';
 
void main() {
  print("Enter Word to print combinations: ");
  var input = stdin.readLineSync();
 
  findAllPermutations(input).forEach((x){
    print(x);
  });
}
List<String> findAllPermutations(String source) {
  List allPermutations = [];
 
  void permutate(List list, int cursor) {
    if (cursor == list.length) {
      allPermutations.add(list);
      return;
    }
 
    for (int i = cursor; i < list.length; i++) {
      List permutation = new List.from(list);
      permutation[cursor] = list[i];
      permutation[i] = list[cursor];
      permutate(permutation, cursor + 1);
    }
  }
 
  permutate(source.split(''), 0);
 
  List<String> strPermutations = [];
  for (List permutation in allPermutations) {
    strPermutations.add(permutation.join());
  }
 
  return strPermutations;
}
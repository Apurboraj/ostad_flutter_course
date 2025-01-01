void main(){
  var names = <String>{'Apurbo','Rafi','Harun'};
  print(names);

  names.add('Rahim');
  print(names);
  names.addAll({'Karim','John','Adam'});
  print(names);
  names.remove('Rafi');
  print("after remove: $names");
  names.removeAll({'Harun','Karim','Adam'});
  print(names);
  print("Contain Apurbo: ${names.contains("Apurbo")}");
  print("Contain all: ${names.contains({'Apurbo','Rahim','John'})}");
  print('Element at ${names.elementAt(2)}');
  print("First element ${names.first}");
  print("Last element ${names.last}");
  print("Length of set :${names.length}");
  print("is empty : ${names.isEmpty}");
  print("is nat empty : ${names.isNotEmpty}");
  var nameList = names.toList();
  print(nameList);
  var otherNames = {'Apurbo','Apan','Avilash'};
  print(names);
  print(otherNames);
  print('intersection value : ${names.intersection(otherNames)}');
  print('Union value: ${names.union(otherNames)}');
  print("Difference With: ${names.difference(otherNames)}");
  names.clear();
  print(names);
}
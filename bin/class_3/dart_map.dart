main(){
  //Key value pair
  //Each value is connected with key
  //both keys value any type
  var person = {
    'name' : 'Apurbo Rajbongshi',
    'age' : 23,
    'skill' : 'Dart,Flutter, php, Laravel',
    'experience' : '1 years'
  };
  print(person);
  print("User name: ${person['name']}");
  print("Age: ${person['age']}");

  person['address'] = 'Dhaka, Bangladesh';
  print(person);

  person['age'] = 24;
  print(person);

  person.remove('age');
  print(person);

  print(person.containsKey('name'));
  print(person.containsValue('Apurbo Rajbongshi'));

  print(person.keys);
  print(person.values);

  print(person.length);
  print(person);

  var additionalInfo = {'Sub':'CSE','CGPA': 3.80};
  person.addAll(additionalInfo);
  print(person);

  var keyList = person.keys.toList();
  var valueList = person.values.toList();

  print(keyList);
  print(valueList);
}
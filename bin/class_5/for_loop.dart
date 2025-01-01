main() {
  // for(int i=1; i <=10; i++) {
  //   print("9 × $i = ${9*(i)}");
  // }

  List<String>students = ['Apurbo', 'Rahim', 'Karim', 'Adiba', 'Manik'];
  print("Student 1 index ${students[0]}");
  List<int>amount = [1000, 500, 750, 620, 800];

  for (int index = 0; index < students.length; index++) {
    print('My index is: $index');
    print("${students[index]} You have ${amount[index]} Payment due");
  }

  for (String studentName in students) {
    print('Good Morning: $studentName');
  }

  //loop in map

  var orderList = [
    {'name': 'Apurbo', 'amount': 500,'address':'Dhaka'},
    {'name': 'Manik', 'amount': 700,'address':'Manikganj'},
    {'name': 'Adiba', 'amount': 800,'address':'Rajbari'},
    {'name': 'Rohit', 'amount': 850,'address':'Gazipur'},
    {'name': 'Arnob', 'amount': 900,'address':'Shirazganj'},

  ];

  int totalOrderAmount = 0;
  for(var order in orderList){
    totalOrderAmount +=order['amount'] as int;  //totalOrderAmount = totalOrderAmount + order['amount']
    print("Order amount: ${order['amount']}");
  }
  print("My today's Total order: $totalOrderAmount");

  for(var order in orderList){
    print("Adderss: ${order['address']}");
  }
}
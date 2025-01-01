import 'dart:io';

main(){
  print("Enter Your User name: ");
  String ? userName = stdin.readLineSync();
  print("Enter your password: ");
  String ? password = stdin.readLineSync();

  if(userName == "Apurbo" && password == "123456") {
    print("Login Succesful");
  }else if(userName=="Apurbo" || password == "123456"){
        print("You are close ...!Try again");
  }else{
        print("Wrong info ....! Try again");
  }

  // var amount = 0;
  //
  // amount ==100? print("I'll go alone"):print("I'll go with friend");
  // if(amount>=500){
  //   print("I will go by Bike");
  // }else if(amount>=200){
  //   print("I will go by Bus");
  // }else if(amount>=100){
  //   print("I will go by Rishawa");
  // }
  // else{
  //   print("I'll walk");
  // }
}
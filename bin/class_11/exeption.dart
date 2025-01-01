main(){

  // try{
  //   String age = "25";
  //   int age_int = int.parse(age);
  //   if(age_int>18){
  //     print("Able to vote");
  //   }else{
  //     print("Unable to vote");
  //   }
  // }catch(e) {
  //   print("tumar vule celo ekn e : $e");
  // }finally{
  //   print("I'm from finally state");
  // }
  //
  //
  // try{
  //   List<int> number = [10,20,30];
  //   print(number[5]);
  // }catch(e){
  //   print("List a nai");
  // }

  try{
    int num = -5;
    if(num<0){
      throw Exception('Can not be a neg number');
    }else{
      print("Okey perfect");
    }
  }catch(e){
    print(e);
  }

  try{
    String ? name;
    print(name!.length);
  }catch(e){
    print(e);
  }
}
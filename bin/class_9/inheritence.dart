class Father{
  String name = "Joydeb";
  String land = '100 bigha';
  String house = "Tin sh";
  String bike = "Hero Honda";

  incomeSource(){
    print("From farming");
  }
}

class Son extends Father{

  @override
  void incomeSource(){
    print("App development");
  }


}

main(){
  Son apurbo = Son();
  Father Joydeb = Father();
  apurbo.house = "Sad er basa";
  apurbo.land = "10 bigha";

  print(apurbo.house);
  print(apurbo.land);
  print("I have ${apurbo.bike}");
}
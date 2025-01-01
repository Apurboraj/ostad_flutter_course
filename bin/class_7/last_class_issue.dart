main(){
  aloFunction(105, true, 'LalAlu');
}
aloFunction(int amount,bool haveB, [String? alu_color]){
  if(amount <=100){
    print("Dam besi hobe na");
  }else if(!haveB){
    print("B cara hobe na");
  }else{
    alu_color != null ? print("$alu_color Anteci"):
    print("ane disci");
  }
}
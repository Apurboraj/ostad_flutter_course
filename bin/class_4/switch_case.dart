import 'dart:io';

main(){
  // String ? day = stdin.readLineSync();
  //
  // switch (day){
  //   case 'Friday':
  //     print('Relax');
  //     break;
  //   case 'Saturday':
  //     print('Varsity');
  //     break;
  //   case 'Sunday':
  //     print('Gym');
  //     break;
  //   case 'Monday':
  //     print('Movie');
  //     break;
  //   default:
  //     print('Stay at Home');
  //     break;
  // }

  print("Enter your month: ");
  int ? month = int.tryParse(stdin.readLineSync()!);
  switch (month){
    case 12 || 1 || 2:
      print("Winter");
    case 3:
    case 4:
    case 5:
      print("Spring");
      break;
      break;
    case 6:
    case 7:
    case 8:
      print("Summer");
      break;
    case 9:
    case 10:
    case 11:
      print("Autm");
      break;
    default:
      print("Error...!");
      break;
  }
}
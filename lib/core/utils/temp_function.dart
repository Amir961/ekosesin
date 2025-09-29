import 'package:intl/intl.dart';


  changePrice(num n1)
  {
    final f = NumberFormat('#,##0', 'en_US'); // یا locale دلخواه
    print(f.format(n1)); // "1,234,567"

   // final f2 = NumberFormat('#,##0.00', 'en_US');
    return f.format(n1);
  }
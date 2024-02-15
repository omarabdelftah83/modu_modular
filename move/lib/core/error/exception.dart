
import '../network/error_masage.dart';

class ServerExcepion implements Exception{
final  ErrorMasage errorMasage;
 const ServerExcepion({required this.errorMasage});

}
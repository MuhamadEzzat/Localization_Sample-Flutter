import 'package:get/get.dart';

class Language extends Translations{

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'myapp': 'My App',
      'greeting': 'Hello',
      'changelanguage': 'Change Language',
      'changelang&dir': 'Change Language and Direction'
    },
    'ar_EG': {
      'myapp': 'تطبيقي',
      'greeting': 'مرحبا',
      'changelanguage': 'تغيير اللغة',
      'changelang&dir' : 'تغيير اللغة و الاتجاه'
    }
  };
}



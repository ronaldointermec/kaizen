
import 'package:get/get.dart';

class GlobalTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'hello': 'Hello dude',
      'welcome': 'Welcome',
    },
    'pt_BR': {
      'hello': 'Olá cara',
      'welcome': 'Bem-vindo',
    },
  };
}

import '../../components/login/login_service.dart';
import '../../services/config_subject_service.dart';
import 'user_service.dart';

class UowService {
  // final LoginService login = inject<LoginService>();
  final login = LoginService();
  final users = UserService();
  final configSubject = ConfigSubjectService();

  // utils
  final url = 'http://51.210.106.202:5011';

  UowService();

  displayImage(String imageUrl) {
    if (imageUrl.startsWith('http')) {
      return imageUrl;
    }

    return '$url/$imageUrl';
  }
}

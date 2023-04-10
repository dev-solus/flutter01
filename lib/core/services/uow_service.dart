import '../../components/login/login_service.dart';
import '../../services/config_subject_service.dart';
import 'user_service.dart';

class UowService {
  // final LoginService login = inject<LoginService>();
  final login = LoginService();
  final users = UserService();
  final configSubject = ConfigSubjectService();

  UowService();
}

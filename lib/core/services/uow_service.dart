import '../../components/login/login_service.dart';
import 'user_service.dart';

class UowService {
  // final LoginService login = inject<LoginService>();
  final login = LoginService();
  final users = UserService();

  UowService();
}

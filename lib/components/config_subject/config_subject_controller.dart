import 'package:rxdart/rxdart.dart';

import '../../core/services/uow_service.dart';
import '../../locator.dart';
import 'config_subject_model.dart';

class ConfigSubjectController {
  final UowService uow = inject<UowService>();
  // final dataProvider = Provider.of<UserProvider>(context);

  // Stream<dynamic> dataSource2 = Stream.empty();
  final action = BehaviorSubject<List<dynamic>>.seeded([]);

  Stream<List<ConfigSubject>> dataSource = Stream.empty();
  // .doOnData((e) {
  //   var s = e;
  // });

  ConfigSubjectController() {
    init();
  }

  init() {
    dataSource = Stream.fromFuture(uow.configSubject.fetchAllUsers())
        // .where((r) => r.statusCode == 200)
        // .map((r) => r.body)
        // // .doOnData((r) => {
        // //       print(r),
        // //       print(json.decode(r)),
        // //     })
        // .doOnData((r) => {
        //       print('>>>>>>>>>>>>>>>>>>'),
        //       print(User.fromJson(jsonDecode(r)).name)
        //     })
        // .map((r) => jsonDecode(r))
        ;
  }
}

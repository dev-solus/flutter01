import 'package:rxdart/rxdart.dart';

import '../../core/services/uow_service.dart';
import '../../locator.dart';
import 'config_subject_model.dart';

class ConfigSubjectController {
  final UowService uow = inject<UowService>();
  // final UowService uow = UowService();
  // final dataProvider = Provider.of<UserProvider>(context);

  // Stream<dynamic> dataSource2 = Stream.empty();
  final action = BehaviorSubject<bool>.seeded(true);

  Stream<List<ConfigSubject>> dataSource = const Stream.empty();
  // .doOnData((e) {
  //   var s = e;
  // });

  ConfigSubjectController() {
    init();
  }

  init() {
    dataSource = Rx.merge([action]).switchMap(
        (e) => uow.configSubject.fetchAllUsers().asStream().map((list) {
              // list.addAll(list);
              return list;
            }));
    // dataSource = uow.configSubject
    //         .fetchAllUsers()
    //         .asStream()
    //         // .where((r) => r.statusCode == 200)
    //         // .map((r) => r.body)
    //         // // .doOnData((r) => {
    //         // //       print(r),
    //         // //       print(json.decode(r)),
    //         // //     })
    //         .doOnData((r) {
    //   print(r.length);
    // })
    // .map((r) => jsonDecode(r))
    ;
  }
}

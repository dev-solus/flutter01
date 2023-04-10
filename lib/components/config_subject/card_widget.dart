import 'package:flutter/material.dart';

import '../../core/services/uow_service.dart';
import '../../locator.dart';
import 'config_subject_model.dart';

class CardItemWidget extends StatelessWidget {
  final UowService uow = inject<UowService>();

  final ConfigSubject item;

  CardItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  uow.displayImage(item.imagePath!),
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.titre,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 8.0),
                  Text("""description  description description description"""),
                ],
              ),
            ),
          ),
        ],
      ),
      // child: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text(item.id.toString()),
      //       const SizedBox(height: 8.0),
      //       Text(item.titre),
      //       const SizedBox(height: 8.0),
      //       // Text(item.date),
      //     ],
      //   ),
      // ),
      // child: Row(
      //   children: [
      //     Expanded(
      //       child: Image.network(
      //         uow.displayImage(item.imagePath!),
      //         height: 150,
      //         fit: BoxFit.cover,
      //       ),
      //     ),
      //     Expanded(
      //       child: Padding(
      //         padding: EdgeInsets.all(8.0),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text(
      //               item.titre,
      //               style: TextStyle(
      //                 fontSize: 16,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //             SizedBox(height: 8),
      //             Text(
      //               'description',
      //               style: TextStyle(
      //                 fontSize: 14,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

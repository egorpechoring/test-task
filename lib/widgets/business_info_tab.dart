import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task_north_coast_code/models/event_data_model.dart';
import 'package:test_task_north_coast_code/models/profile_data_model.dart';
import 'business_info_card.dart';

class BusinessInfoTab extends StatelessWidget {
  final List<BusinessData> businessesData;

  const BusinessInfoTab({Key? key, required this.businessesData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width / 12,
        ),
        child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ChangeNotifierProvider<EventData>(
              create: (context) => EventData(),
              child: ListView.separated(
                itemCount: businessesData.length,
                itemBuilder: (BuildContext context, int index) {
                  return BusinessInfoCard(businessData: businessesData[index], index: index);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    color: Colors.transparent,
                  );
                },
              ),
            )));
  }
}

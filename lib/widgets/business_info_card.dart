import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task_north_coast_code/models/event_data_model.dart';
import 'package:test_task_north_coast_code/models/profile_data_model.dart';
import 'data_display.dart';

class BusinessInfoCard extends StatefulWidget {
  final BusinessData businessData;
  final int index;

  const BusinessInfoCard(
      {Key? key, required this.businessData, required this.index})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _BusinessInfoCardState();
}

class _BusinessInfoCardState extends State<BusinessInfoCard> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    double p = MediaQuery.of(context).size.width / 24;
    return Consumer<EventData>(
      builder: (context, value, child) {
        if (value.activeIndex != widget.index) {
          isOpen = false;
        }
        if (value.activeIndex == widget.index) {
          isOpen = !isOpen;
        }

        return Column(
          children: [
            GestureDetector(
                onTap: () {
                  final model = Provider.of<EventData>(context, listen: false);
                  model.modify(widget.index);
                },
                child: Container(
                    padding: EdgeInsets.only(
                        top: p / 1.5,
                        bottom: p/1.5,
                        left: p),
                    color: const Color.fromARGB(255, 0, 49, 75),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(widget.businessData.name),
                        ),
                        isOpen
                            ? const Icon(Icons.arrow_drop_up)
                            : const Icon(Icons.arrow_drop_down)
                      ],
                    ))),
            Visibility(
                visible: isOpen,
                child: Container(
                    color: const Color.fromARGB(255, 0, 39, 60),
                    padding: EdgeInsets.only(
                      top: p/1.5,
                      left: p/1.56,
                      right: p/1.5,
                    ),
                    child: Column(
                      children: [
                        DataDisplay(
                          title: "ADDRESS",
                          txt: widget.businessData.address,
                        ),
                        DataDisplay(
                          title: "VAT NUMBER",
                          txt: widget.businessData.vatNumber,
                        ),
                        DataDisplay(
                          title: "INDUSTRY OF TRADE",
                          txt: widget.businessData.industryOfTrade,
                        ),
                        Container(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width / 18,
                                left: MediaQuery.of(context).size.width /
                                    (60 * 1.5),
                                bottom: MediaQuery.of(context).size.width / 48),
                            alignment: Alignment.centerLeft,
                            child: const Text("Bank info")),
                        DataDisplay(
                          title: "BENEFICIARY",
                          txt: widget.businessData.beneficiary,
                        ),
                        DataDisplay(
                          title: "ACCOUNT NUMBER",
                          txt: widget.businessData.accountNumber.toString(),
                        ),
                        DataDisplay(
                          title: "SWIFT/BIC",
                          txt: widget.businessData.swiftBic,
                        ),
                        TextButton(
                          child: Text(
                            "REMOVE ACCOUNT",
                            style: Theme.of(context).textTheme.bodyText1 ),
                          onPressed: () {},
                        )
                      ],
                    )))
          ],
        );
      },
    );
  }
}

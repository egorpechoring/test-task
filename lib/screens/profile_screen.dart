import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:test_task_north_coast_code/models/profile_data_model.dart';
import 'package:test_task_north_coast_code/widgets/business_info_tab.dart';
import 'package:test_task_north_coast_code/widgets/personal_info_tab.dart';

class ProfileScreen extends StatefulWidget{
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<ProfileData> _data;

  @override
  initState() {
    super.initState();
    _data = _getDataObject();
  }

  @override
  Widget build(BuildContext context) {
    double p = MediaQuery.of(context).size.width / 18;
    return FutureBuilder<ProfileData>(
        future: _data,
        builder: (
            BuildContext context,
            AsyncSnapshot<ProfileData> snapshot) {
      if (snapshot.hasData) {
        return DefaultTabController(
            length: 2,
            child: Padding(
              padding: EdgeInsets.only(
                  top: p,
                  left: p,
                  right: p),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromARGB(255, 0, 45, 69),
                          width: 2,
                        ),
                      ),
                    ),
                    child: const TabBar(
                      indicatorPadding: EdgeInsets.only(bottom: -2),
                      indicatorColor: Color.fromARGB(255, 0, 96, 113),
                      labelColor: Color.fromARGB(255, 251, 252, 252),
                      unselectedLabelColor: Color.fromARGB(255, 110, 137, 165),
                      tabs: [
                        Tab(text: "Profile"),
                        Tab(text: "Business"),
                      ],
                    ),
                  ),
                  Expanded(
                      child: TabBarView(
                        children: [
                          PersonalInfo(
                            firstName: snapshot.data!.firstName,
                            lastName: snapshot.data!.lastName,
                            phone: snapshot.data!.phoneNr,
                            email: snapshot.data!.email,
                          ),
                          BusinessInfoTab(businessesData:snapshot.data!.businesses),
                        ],
                      )),
                ],
              ),
            ));
      }else if (snapshot.hasError) {
        return const Center(child: Text("Error"),);
      } else {
        return const Center(child: SizedBox(
          width: 40,
          height: 40,
          child: CircularProgressIndicator(),
        ));
      }

        });
  }

  Future<ProfileData> _getDataObject()async{
    String jsonString = '{"firstName": "John","lastName": "Smith","email": "johnsmith@gmail.com","phoneNr": "55566959","businesses": [{"name": "North Coast Code Ltd","address": "Aia 4, Tallinn, Estonia","vatNumber": "14963216","industryOfTrade": "Advertising","beneficiary": "John Smith","accountNumber": 112398749283423,"swiftBic": "EPBEEE2X"},{"name": "Binderr Ltd","address": "Vana Viru 13, Tallinn, Estonia","vatNumber": "19499494","industryOfTrade": "Accounting","beneficiary": "Jacob Rose","accountNumber": 19257437534545,"swiftBic": "PEJBJ12"},{"name": "Abc Invest Ltd","address": "Pulli 7, Tallinn, Estonia","vatNumber": "14963216","industryOfTrade": "Investing","beneficiary": "Alex Cyprus","accountNumber": 19384737334342,"swiftBic": "ITLEE99"}]}';
    ProfileData data = ProfileData.fromJson(jsonDecode(jsonString));
    await Future.delayed(const Duration(seconds: 1));
    //return Future.error("This is the error", StackTrace.fromString("This is its trace"));
    return data;
  }
}

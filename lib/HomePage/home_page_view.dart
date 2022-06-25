import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_7/HomePage/home_page_controller.dart';
import 'package:flutter_application_7/HomePage/home_page_model.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomePgaeModel> with WidgetsBindingObserver {
  HomePageController homePageController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Home Page")),
        body: homePageController.obx(
          (homestate) => ListView.builder(
            itemBuilder: ((context, index) {
              return Container(
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid),
                    color: Colors.white),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(homestate!.data[index].id.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(
                        //   width: 10,
                        // ),
                        Text(homestate!.data[index].firstName + ' ',
                            style: TextStyle(color: Colors.blue, fontSize: 18)),
                        Text(homestate.data[index].lastName,
                            style: TextStyle(color: Colors.blue, fontSize: 18))
                      ],
                    ),
                    CircleAvatar(
                      child: Image.network(homestate.data[index].avatar),
                    )
                  ],
                ),
              );
            }),
            itemCount: homestate!.data.length,
            padding: EdgeInsets.only(top: 10, bottom: 20),
          ),
        ));
  }
}

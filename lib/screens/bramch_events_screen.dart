import 'package:flutter/material.dart';
// import '../Provider/provider_events.dart';
import '../models/task_data.dart';
import '../widget/app_drawer.dart';
import '../widget/branch_event_widget.dart';
// import 'package:provider/provider.dart';

class BranchEventsScreen extends StatelessWidget {
  static const routeName = '/branch_events_screen';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryEvents = TaskData.where((event) {
      return event.categories.contains(categoryId);
    }).toList();

    // final eventsData = Provider.of<Events>(context);
    // final events = eventsData.items;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
          style: Theme.of(context).textTheme.headline6,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return BranchEventWidget(
            id: categoryEvents[index].id,
            title: categoryEvents[index].title,
            image: categoryEvents[index].image,
            description: categoryEvents[index].description,
            coordinator: categoryEvents[index].coordinators,
            prize: categoryEvents[index].prize,
          );
        },
        itemCount: categoryEvents.length,
      ),
    );
  }
}

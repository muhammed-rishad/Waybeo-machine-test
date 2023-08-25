


import 'package:flutter/material.dart';
import 'package:weekly_scheduler/src/model/schedule.dart';

class ScheduleProvider extends ChangeNotifier{

  String message="Hi Jose you areavailable in ";

  List<Schedule>weeklySchedule=[
    Schedule(
        day: 'SUN',
        text: "Sunday"
    ),
    Schedule(
        day: 'MON',
        text: "Monday"
    ),
    Schedule(
        day: 'TUE',
        text: "Tuesday"
    ),
    Schedule(
        day: 'WED',
        text: "Wednesday"
    ),
    Schedule(
        day: 'THU',
        text: "Thursday"
    ),Schedule(
        day: 'FRI',
        text: "Friday"
    ),
    Schedule(
        day: 'SAT',
        text: "Saturday"
    ),
  ];

  addToProvider(List<Schedule> sList)async{
    message="Hi Jose you areavailable in ";
    weeklySchedule=sList;
    weeklySchedule.forEach((element) {
      print(element.day.toString());
      print(element.evening.toString());
      print(element.afternoon.toString());
      print(element.morning.toString());
    });

    getFreeTime();
  }

  getFreeTime(){
    weeklySchedule.forEach((element) {
      // ignore: unrelated_type_equality_checks
      if(element.available==true){
        message= message+element.text!;
        if(element.morning==true&&element.afternoon==true&&element.evening==true){
          message= "${message} Whole day ,";
        }else{
          if(element.morning==true){
            print('inside mrng');
            message= "${message} Morning ,";
          }
          if(element.afternoon==true){
            message= "${message} Afternoon ,";
            print('inside aftrnn');
          }
          if(element.evening==true){
            message= "${message} Evening ,";
            print('inside evng');
          }
        }





      }

    });
    print(message);
  }



}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weekly_scheduler/src/model/schedule.dart';
import 'package:weekly_scheduler/src/view/home_screen.dart';
import 'package:weekly_scheduler/src/view_model/schedule_provider.dart';


class ScheduleScreen extends StatefulWidget {
   ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  late List<Schedule> scheduleList;
  @override
  Widget build(BuildContext context) {
    final myModel = Provider.of<ScheduleProvider>(context);
    scheduleList=myModel.weeklySchedule;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text('Set your weekly hours',style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 16
          ),),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: (){
        //     context.read<ScheduleProvider>().addToProvider(scheduleList);
        //   },
        // ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView.separated(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width/15),
                shrinkWrap: true,
                itemCount:scheduleList.length,
                separatorBuilder: (context,index){
                  return const SizedBox(height: 12,);
                },
                itemBuilder: (context,index){
                  return Row(
                    children:  [
                      IconButton(onPressed: (){
                        setState(() {
                          changeStatus(index: index,
                              value:scheduleList[index].available==true?false:true
                          );
                        });
                      },
                          icon: Icon(Icons.check_circle,color:scheduleList[index].available==true?Colors.greenAccent:Colors.grey,)),
                      const SizedBox(width: 6,),
                      SizedBox(
                          width: 30,
                          child: Text(scheduleList[index].day!,style: blackText,)),
                      const SizedBox(width: 6,),
                      scheduleList[index].available==true?
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                print('pressed morning');
                                if(scheduleList[index].morning==true){
                                  scheduleList[index].morning=false;
                                }else{
                                  scheduleList[index].morning=true;
                                }

                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  border: Border.all(color:scheduleList[index].morning==true?Colors.deepPurple: Colors.grey),
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              padding: const EdgeInsets.all(4),
                              child: Text('Morning',style:scheduleList[index].morning==true?blueText: grayText,),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                if(scheduleList[index].afternoon==true){
                                  scheduleList[index].afternoon=false;
                                }else{
                                  scheduleList[index].afternoon=true;
                                }
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  border: Border.all(color: scheduleList[index].afternoon==true?Colors.deepPurple: Colors.grey),
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              padding: const EdgeInsets.all(4),
                              child: Text('Afternoon',style:scheduleList[index].afternoon==true?blueText: grayText,),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                if(scheduleList[index].evening==true){
                                  scheduleList[index].evening=false;
                                }else{
                                  scheduleList[index].evening=true;
                                }
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  border: Border.all(color:scheduleList[index].evening==true?Colors.deepPurple: Colors.grey),
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              padding: const EdgeInsets.all(4),
                              child: Text('Evening',style:scheduleList[index].evening==true?blueText: grayText,),
                            ),
                          )
                        ],
                      ):
                      Text('Unavailable',style: grayText,),

                    ],
                  );
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height/20,
              width: MediaQuery.of(context).size.width/1.2,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: MediaQuery
                          .of(context)
                          .size
                          .width * (32 / 428),
                        vertical: MediaQuery
                            .of(context)
                            .size
                            .width * (8 / 428),
                      )
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                child: const Text('Save',style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,

                ),
                ),
                onPressed: () async{
                 await myModel.addToProvider(scheduleList);
                 // ignore: use_build_context_synchronously
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                 HomeScreen()
                 ));

                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width/100,)
          ],
        )
      ),
    );
  }

  changeStatus({required int index,required bool value}){
    scheduleList[index].available=value;
    if(!value){
      scheduleList[index].morning=false;
      scheduleList[index].afternoon=false;
      scheduleList[index].evening=false;
    }
  }

  TextStyle grayText=const TextStyle(
    color: Colors.grey,
    fontSize: 12,
    fontWeight: FontWeight.w400
  );
  TextStyle blueText=const TextStyle(
      color: Colors.deepPurple,
      fontSize: 12,
      fontWeight: FontWeight.w400
  );

  TextStyle blackText=const TextStyle(
      color: Colors.black,
      fontSize: 10,
      fontWeight: FontWeight.w700
  );
}

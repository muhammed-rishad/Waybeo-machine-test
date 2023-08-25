class Schedule {
  String? day;
  String? text;
  bool ?available;
  bool ?morning;
  bool ?afternoon;
  bool ?evening;


  Schedule(
      {this.day,
        this.available=false,
        this.morning=false,
        this.afternoon=false,
        this.evening=false,
        this.text
        });
}
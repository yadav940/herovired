class FirstPageModel {
  List<CourseData>? coursedata;

  FirstPageModel({this.coursedata});

  FirstPageModel.fromJson(Map<String, dynamic> json) {
    if (json['coursedata'] != null) {
      coursedata = <CourseData>[];
      json['coursedata'].forEach((v) {
        coursedata!.add(CourseData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coursedata != null) {
      data['coursedata'] = this.coursedata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CourseData {
  int? courseid;
  String? coursename;
  String? coursefullname;
  String? coursetype;
  int? accessvalue;
  String? accesstype;
  String? continu;
  int? progress;
  String? value;
  int? activityid;
  String? image;
  String? lpshortname;
  String? lpfullname;

  CourseData(
      {this.courseid,
      this.coursename,
      this.coursefullname,
      this.coursetype,
      this.accessvalue,
      this.accesstype,
      this.continu,
      this.progress,
      this.value,
      this.activityid,
      this.image,
      this.lpshortname,
      this.lpfullname});

  CourseData.fromJson(Map<String, dynamic> json) {
    courseid = json['courseid'];
    coursename = json['coursename'];
    coursefullname = json['coursefullname'];
    coursetype = json['coursetype'];
    accessvalue = json['accessvalue'];
    accesstype = json['accesstype'];
    continu = json['continue'];
    progress = json['progress'];
    value = json['value'];
    activityid = json['activityid'];
    image = json['image'];
    lpshortname = json['lpshortname'];
    lpfullname = json['lpfullname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['courseid'] = this.courseid;
    data['coursename'] = this.coursename;
    data['coursefullname'] = this.coursefullname;
    data['coursetype'] = this.coursetype;
    data['accessvalue'] = this.accessvalue;
    data['accesstype'] = this.accesstype;
    data['continue'] = this.continu;
    data['progress'] = this.progress;
    data['value'] = this.value;
    data['activityid'] = this.activityid;
    data['image'] = this.image;
    data['lpshortname'] = this.lpshortname;
    data['lpfullname'] = this.lpfullname;
    return data;
  }
}

class SecondPageModel{
  List<SecondModel>? secondModelList;

  SecondPageModel(this.secondModelList);

  SecondPageModel.fromJson(dynamic json) {

    if (json != null) {
      secondModelList =  <SecondModel>[];
      json.forEach((v) {
        secondModelList!.add(new SecondModel.fromJson(v));
      });
    }
  }

}


class SecondModel {
  int? id;
  String? name;
  int? visible;
  String? summary;
  int? summaryformat;
  int? section;
  int? hiddenbynumsections;
  bool? uservisible;
  List<Modules>? modules;

  SecondModel(
      {this.id,
        this.name,
        this.visible,
        this.summary,
        this.summaryformat,
        this.section,
        this.hiddenbynumsections,
        this.uservisible,
        this.modules});

  SecondModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    visible = json['visible'];
    summary = json['summary'];
    summaryformat = json['summaryformat'];
    section = json['section'];
    hiddenbynumsections = json['hiddenbynumsections'];
    uservisible = json['uservisible'];
    if (json['modules'] != null) {
      modules =  <Modules>[];
      json['modules'].forEach((v) {
        modules!.add(new Modules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['visible'] = this.visible;
    data['summary'] = this.summary;
    data['summaryformat'] = this.summaryformat;
    data['section'] = this.section;
    data['hiddenbynumsections'] = this.hiddenbynumsections;
    data['uservisible'] = this.uservisible;
    if (this.modules != null) {
      data['modules'] = this.modules!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Modules {
  int? id;
  String? url;
  String? name;
  int? instance;
  int? visible;
  bool? uservisible;
  int? visibleoncoursepage;
  String? modicon;
  String? modname;
  String? modplural;
  int? indent;
  String? onclick;
  //Null afterlink;
  String? customdata;
  bool? noviewlink;
  int? completion;
  Completiondata? completiondata;

  Modules(
      {this.id,
        this.url,
        this.name,
        this.instance,
        this.visible,
        this.uservisible,
        this.visibleoncoursepage,
        this.modicon,
        this.modname,
        this.modplural,
        this.indent,
        this.onclick,
        //this.afterlink,
        this.customdata,
        this.noviewlink,
        this.completion,
        this.completiondata});

  Modules.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    name = json['name'];
    instance = json['instance'];
    visible = json['visible'];
    uservisible = json['uservisible'];
    visibleoncoursepage = json['visibleoncoursepage'];
    modicon = json['modicon'];
    modname = json['modname'];
    modplural = json['modplural'];
    indent = json['indent'];
    onclick = json['onclick'];
    //afterlink = json['afterlink'];
    customdata = json['customdata'];
    noviewlink = json['noviewlink'];
    completion = json['completion'];
    completiondata = json['completiondata'] != null
        ? new Completiondata.fromJson(json['completiondata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['name'] = this.name;
    data['instance'] = this.instance;
    data['visible'] = this.visible;
    data['uservisible'] = this.uservisible;
    data['visibleoncoursepage'] = this.visibleoncoursepage;
    data['modicon'] = this.modicon;
    data['modname'] = this.modname;
    data['modplural'] = this.modplural;
    data['indent'] = this.indent;
    data['onclick'] = this.onclick;
    //data['afterlink'] = this.afterlink;
    data['customdata'] = this.customdata;
    data['noviewlink'] = this.noviewlink;
    data['completion'] = this.completion;
    if (this.completiondata != null) {
      data['completiondata'] = this.completiondata!.toJson();
    }
    return data;
  }
}

class Completiondata {
  int? state;
  int? timecompleted;
  //Null overrideby;
  bool? valueused;

  Completiondata(
      {this.state, this.timecompleted,/* this.overrideby,*/ this.valueused});

  Completiondata.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    timecompleted = json['timecompleted'];
    //overrideby = json['overrideby'];
    valueused = json['valueused'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['timecompleted'] = this.timecompleted;
    //data['overrideby'] = this.overrideby;
    data['valueused'] = this.valueused;
    return data;
  }
}
import 'package:portfolio/util/constants.dart';

class Project {
  const Project(this.number, this.name, this.role, this.desc, this.tools, this.action, this.link);

  final String number;
  final String name;
  final String role;
  final String desc;
  final List<Tool> tools;
  final String action;
  final String link;
}

class Tool {
  const Tool.android() : name = Texts.android, icon = Images.tool_android;
  const Tool.angular() : name = Texts.angular, icon = Images.tool_angular;
  const Tool.figma() : name = Texts.figma, icon = Images.tool_figma;
  const Tool.firebase() : name = Texts.firebase, icon = Images.tool_firebase;
  const Tool.flutter() : name = Texts.flutter, icon = Images.tool_flutter;
  const Tool.ionic() : name = Texts.ionic, icon = Images.tool_ionic;
  const Tool.nodejs() : name = Texts.nodejs, icon = Images.tool_nodejs;

  final String name;
  final String icon;
}

const allProjects = [
  Project('1', Texts.project_1_name, Texts.project_1_role, Texts.project_1_desc, [Tool.angular()], Texts.app_tour, 'https://www.inksoft.com/tour/'),
  Project('2', Texts.project_2_name, Texts.project_2_role, Texts.project_2_desc, [Tool.android()], Texts.app_tour, 'https://www.eno8.com/showcase/collin-college/'),
  Project('3', Texts.project_3_name, Texts.project_3_role, Texts.project_3_desc, [Tool.android()], Texts.playstore, 'https://play.google.com/store/apps/details?id=com.ChoreRelief.Customer'),
  Project('4', Texts.project_4_name, Texts.project_4_role, Texts.project_4_desc, [Tool.ionic(), Tool.firebase(), Tool.nodejs()], Texts.playstore, 'https://play.google.com/store/apps/details?id=app.tillo'),
  Project('5', Texts.project_5_name, Texts.project_5_role, Texts.project_5_desc, [Tool.android()], Texts.playstore, 'https://play.google.com/store/apps/details?id=com.wsi.wallstreetenglish.nse'),
  Project('6', Texts.project_6_name, Texts.project_6_role, Texts.project_6_desc, [Tool.flutter()], Texts.playstore, 'https://play.google.com/store/apps/details?id=com.mobile.tengointernet'),
  Project('7', Texts.project_7_name, Texts.project_7_role, Texts.project_7_desc, [Tool.flutter()], Texts.try_web, 'https://alcon-vision-educator.web.app/'),
  Project('8', Texts.project_8_name, Texts.project_8_role, Texts.project_8_desc, [Tool.android()], Texts.playstore, 'https://play.google.com/store/apps/details?id=io.omnicounts.android'),
  Project('9', Texts.project_9_name, Texts.project_9_role, Texts.project_9_desc, [Tool.flutter(), Tool.firebase(), Tool.figma()], Texts.playstore, 'https://play.google.com/store/apps/details?id=com.calibraint.maxisassets'),
  Project('10', Texts.project_10_name, Texts.project_10_role, Texts.project_10_desc, [Tool.flutter(), Tool.firebase()], '', ''),
  Project('11', Texts.project_11_name, Texts.project_11_role, Texts.project_11_desc, [Tool.flutter()], Texts.playstore, 'https://play.google.com/store/apps/developer?id=Y9+Inc'),
];
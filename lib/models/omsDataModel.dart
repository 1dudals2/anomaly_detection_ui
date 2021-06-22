
class OmsDataModel{

  final double accx_rms;
  final double accy_rms;
  final double accz_rms;
  final double yaw;
  final double drive_left_speed;
  final double drive_right_speed;
  final double drive_left_torque;
  final double drive_right_torque;
  final String oht_event_label;
  final double fork_lift_speed;
  final double fork_lift_torque;

  OmsDataModel(
      this.accx_rms,
      this.accy_rms,
      this.accz_rms,
      this.drive_left_speed,
      this.drive_left_torque,
      this.drive_right_speed,
      this.drive_right_torque,
      this.fork_lift_speed,
      this.fork_lift_torque,
      this.oht_event_label,
      this.yaw,);

  OmsDataModel.fromJson(Map<String, dynamic> json)
      : accx_rms = json['accx_rms'],
        accy_rms = json['accy_rms'],
        accz_rms = json['accz_rms'],
        drive_left_speed = json['drive_left_speed'],
        drive_right_speed = json['drive_right_speed'],
        drive_left_torque = json['drive_left_torque'],
        drive_right_torque = json['drive_right_torque'],
        fork_lift_torque = json['fork_lift_torque'],
        fork_lift_speed = json['fork_lift_speed'],
        oht_event_label = json['oht_event_label'],
        yaw = json['yaw'];

  Map<String, dynamic> toJson() =>{
    'accx_rms' : accz_rms,
    'accy_rms' : accy_rms,
    'accz_rms' : accz_rms,
    'drive_left_speed' : drive_left_speed,
    'drive_right_speed' : drive_right_speed,
    'drive_left_torque' : drive_left_torque,
    'drive_right_torque' : drive_right_torque,
    'fork_lift_torque' : fork_lift_torque,
    'fork_lift_speed' : fork_lift_speed,
    'oht_event_label' : oht_event_label,
    'yaw' : yaw,
  };
}
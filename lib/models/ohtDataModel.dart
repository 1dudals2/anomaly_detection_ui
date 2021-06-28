
class OhtDataModel{
  final int event_label;
  final int num_of_vehicles;
  final String anomal_timestamp;
  final double accx_rms;
  final double accy_rms;
  final double accz_rms;
  final double yaw;
  final double drive_left_speed;
  final double drive_right_speed;
  final double drive_left_torque;
  final double drive_right_torque;
  final double fork_lift_speed;
  final double fork_lift_torque;

  OhtDataModel(
      this.num_of_vehicles,
      this.anomal_timestamp,
      this.accx_rms,
      this.accy_rms,
      this.accz_rms,
      this.drive_left_speed,
      this.drive_left_torque,
      this.drive_right_speed,
      this.drive_right_torque,
      this.fork_lift_speed,
      this.fork_lift_torque,
      this.event_label ,
      this.yaw,);

  OhtDataModel.fromJson(Map<String, dynamic> json)
      : event_label  = json['event_label'],
        num_of_vehicles = json['num_of_vehicles'],
        anomal_timestamp = json['anomal_timestamp'],
        accx_rms = json['accx_rms'],
        accy_rms = json['accy_rms'],
        accz_rms = json['accz_rms'],
        drive_left_speed = json['drive_left_speed'],
        drive_right_speed = json['drive_right_speed'],
        drive_left_torque = json['drive_left_torque'],
        drive_right_torque = json['drive_right_torque'],
        fork_lift_torque = json['fork_lift_torque'],
        fork_lift_speed = json['fork_lift_speed'],
        yaw = json['yaw'];

  Map<String, dynamic> toJson() =>{
    'anomal_timestamp': anomal_timestamp,
    'num_of_vehicles' : num_of_vehicles,
    'accx_rms' : accz_rms,
    'accy_rms' : accy_rms,
    'accz_rms' : accz_rms,
    'drive_left_speed' : drive_left_speed,
    'drive_right_speed' : drive_right_speed,
    'drive_left_torque' : drive_left_torque,
    'drive_right_torque' : drive_right_torque,
    'fork_lift_torque' : fork_lift_torque,
    'fork_lift_speed' : fork_lift_speed,
    'event_label ' : event_label ,
    'yaw' : yaw,

  };
}
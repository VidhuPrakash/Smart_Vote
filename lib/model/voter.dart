class Voter {
  String name;
  String address;
  String number;
  String vId;

  String leftEar_1_X;
  String leftEar_1_Y;

  String leftEar_2_X;
  String leftEar_2_Y;

  String leftEar_3_X;
  String leftEar_3_Y;

  String rightEar_1_X;
  String rightEar_1_Y;

  String rightEar_2_X;
  String rightEar_2_Y;

  String rightEar_3_X;
  String rightEar_3_Y;

  String leftEye_1_X;
  String leftEye_1_Y;

  String leftEye_2_X;
  String leftEye_2_Y;

  String leftEye_3_X;
  String leftEye_3_Y;

  String rightEye_1_X;
  String rightEye_1_Y;

  String rightEye_2_X;
  String rightEye_2_Y;

  String rightEye_3_X;
  String rightEye_3_Y;

  Voter({
    required this.name,
    required this.address,
    required this.number,
    required this.vId,
    required this.leftEar_1_X,
    required this.leftEar_1_Y,
    required this.leftEar_2_X,
    required this.leftEar_2_Y,
    required this.leftEar_3_X,
    required this.leftEar_3_Y,
    required this.rightEar_1_X,
    required this.rightEar_1_Y,
    required this.rightEar_2_X,
    required this.rightEar_2_Y,
    required this.rightEar_3_X,
    required this.rightEar_3_Y,
    required this.leftEye_1_X,
    required this.leftEye_1_Y,
    required this.leftEye_2_X,
    required this.leftEye_2_Y,
    required this.leftEye_3_X,
    required this.leftEye_3_Y,
    required this.rightEye_1_X,
    required this.rightEye_1_Y,
    required this.rightEye_2_X,
    required this.rightEye_2_Y,
    required this.rightEye_3_X,
    required this.rightEye_3_Y,
  });
  Voter.fromJson(Map<String, Object?> json)
      : this(
          name: json['name']! as String,
          address: json['address']! as String,
          number: json['number']! as String,
          vId: json['vId'] != null ? json['vId']! as String : '',
          leftEar_1_X: json['leftEar_1_X']! as String,
          leftEar_1_Y: json['leftEar_1_Y']! as String,
          leftEar_2_X: json['leftEar_2_X']! as String,
          leftEar_2_Y: json['leftEar_2_Y']! as String,
          leftEar_3_X: json['leftEar_3_X']! as String,
          leftEar_3_Y: json['leftEar_3_Y']! as String,
          rightEar_1_X: json['rightEar_1_X']! as String,
          rightEar_1_Y: json['rightEar_1_Y']! as String,
          rightEar_2_X: json['rightEar_2_X']! as String,
          rightEar_2_Y: json['rightEar_2_Y']! as String,
          rightEar_3_X: json['rightEar_3_X']! as String,
          rightEar_3_Y: json['rightEar_3_Y']! as String,
          leftEye_1_X: json['leftEye_1_X']! as String,
          leftEye_1_Y: json['leftEye_1_Y']! as String,
          leftEye_2_X: json['leftEye_2_X']! as String,
          leftEye_2_Y: json['leftEye_2_Y']! as String,
          leftEye_3_X: json['leftEye_3_X']! as String,
          leftEye_3_Y: json['leftEye_3_Y']! as String,
          rightEye_1_X: json['rightEye_1_X']! as String,
          rightEye_1_Y: json['rightEye_1_Y']! as String,
          rightEye_2_X: json['rightEye_2_X']! as String,
          rightEye_2_Y: json['rightEye_2_Y']! as String,
          rightEye_3_X: json['rightEye_3_X']! as String,
          rightEye_3_Y: json['rightEye_3_Y']! as String,
        );
  Voter copyWith({
    String? name,
    String? address,
    String? number,
    String? vId,
    String? leftEar_1_X,
    String? leftEar_1_Y,
    String? leftEar_2_X,
    String? leftEar_2_Y,
    String? leftEar_3_X,
    String? leftEar_3_Y,
    String? rightEar_1_X,
    String? rightEar_1_Y,
    String? rightEar_2_X,
    String? rightEar_2_Y,
    String? rightEar_3_X,
    String? rightEar_3_Y,
    String? leftEye_1_X,
    String? leftEye_1_Y,
    String? leftEye_2_X,
    String? leftEye_2_Y,
    String? leftEye_3_X,
    String? leftEye_3_Y,
    String? rightEye_1_X,
    String? rightEye_1_Y,
    String? rightEye_2_X,
    String? rightEye_2_Y,
    String? rightEye_3_X,
    String? rightEye_3_Y,
  }) {
    return Voter(
        name: name ?? this.name,
        address: address ?? this.address,
        number: number ?? this.number,
        vId: vId ?? this.vId,
        leftEar_1_X: leftEar_1_X ?? this.leftEar_1_X,
        leftEar_1_Y: leftEar_1_Y ?? this.leftEar_1_Y,
        leftEar_2_X: leftEar_2_X ?? this.leftEar_2_X,
        leftEar_2_Y: leftEar_2_Y ?? this.leftEar_2_Y,
        leftEar_3_X: leftEar_3_X ?? this.leftEar_3_X,
        leftEar_3_Y: leftEar_3_Y ?? this.leftEar_3_Y,
        rightEar_1_X: rightEar_1_X ?? this.rightEar_1_X,
        rightEar_1_Y: rightEar_1_Y ?? this.rightEar_1_Y,
        rightEar_2_X: rightEar_2_X ?? this.rightEar_2_X,
        rightEar_2_Y: rightEar_2_Y ?? this.rightEar_2_Y,
        rightEar_3_X: rightEar_3_X ?? this.rightEar_3_X,
        rightEar_3_Y: rightEar_3_Y ?? this.rightEar_3_Y,
        leftEye_1_X: leftEye_1_X ?? this.leftEye_1_X,
        leftEye_1_Y: leftEye_1_Y ?? this.leftEye_1_Y,
        leftEye_2_X: leftEye_2_X ?? this.leftEye_2_X,
        leftEye_2_Y: leftEye_2_Y ?? this.leftEye_2_Y,
        leftEye_3_X: leftEye_3_X ?? this.leftEye_3_X,
        leftEye_3_Y: leftEye_3_Y ?? this.leftEye_3_X,
        rightEye_1_X: rightEye_1_X ?? this.rightEye_1_X,
        rightEye_1_Y: rightEye_1_Y ?? this.rightEye_1_Y,
        rightEye_2_X: rightEye_2_X ?? this.rightEye_2_X,
        rightEye_2_Y: rightEye_2_Y ?? this.rightEye_2_Y,
        rightEye_3_X: rightEye_3_X ?? this.rightEye_3_X,
        rightEye_3_Y: rightEye_3_Y ?? this.rightEye_3_Y);
  }

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'address': address,
      'number': number,
      'v_id': vId,
      'leftEar_1_X': leftEar_1_X,
      'leftEar_1_Y': leftEar_1_Y,
      'leftEar_2_X': leftEar_2_X,
      'leftEar_2_Y': leftEar_2_Y,
      'leftEar_3_X': leftEar_3_X,
      'leftEar_3_Y': leftEar_3_Y,
      'rightEar_1_X': rightEar_1_X,
      'rightEar_1_Y': rightEar_1_Y,
      'rightEar_2_X': rightEar_2_X,
      'rightEar_2_Y': rightEar_2_Y,
      'rightEar_3_X': rightEar_3_X,
      'rightEar_3_Y': rightEar_3_Y,
      'leftEye_1_X': leftEye_1_X,
      'leftEye_1_Y': leftEye_1_Y,
      'leftEye_2_X': leftEye_2_X,
      'leftEye_2_Y': leftEye_2_Y,
      'leftEye_3_X': leftEye_3_X,
      'leftEye_3_Y': leftEye_3_Y,
      'rightEye_1_X': rightEye_1_X,
      'rightEye_1_Y': rightEye_1_Y,
      'rightEye_2_X': rightEye_2_X,
      'rightEye_2_Y': rightEye_2_Y,
      'rightEye_3_X': rightEye_3_X,
      'rightEye_3_Y': rightEye_3_Y,
    };
  }
}

class CurrentKycStatus {
  int? status;
  String? message;
  KycStatsAttritbute? kyc_attri;

  CurrentKycStatus({ this.status, this.message, this.kyc_attri});

  factory CurrentKycStatus.fromJson(Map<String, dynamic> json) {
    return CurrentKycStatus(
        status: json['status'],
        message: json['message'],
        kyc_attri: KycStatsAttritbute.fromJson(json['kyc_attri'])
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['kyc_attri'] = this.kyc_attri!.toJson();

    return data;
  }
}
class KycStatsAttritbute {
  int? user_id;
  String? name;
  String? dob;
  String? mobile;
  String? gender;
  String? address;
  String? street;
  String? city;
  String? postal_code;
  String? country;
  String? id_proof_type;
  String? id_proof_no;
  String? id_proof_expiry_date;
  List<dynamic>? id_proof_url;
  String? livelyness_img;
  String? livelyness_score;
  String? step_1_status;
  String? step_2_status;
  String? step_3_status;
  String? final_status;
  String? remarks;



  KycStatsAttritbute({this.user_id, this.name, this.dob,  this.mobile,   this.gender, this.address, this.street, this.city, this.postal_code, this.country, this.id_proof_type, this.id_proof_no, this.id_proof_expiry_date, this.id_proof_url, this.livelyness_img, this.livelyness_score, this.step_1_status, this.step_2_status, this.step_3_status, this.final_status, this.remarks, });

  factory KycStatsAttritbute.fromJson(Map<String, dynamic> json) {
    return KycStatsAttritbute(
      user_id: json['user_id'],
      name: json['name'],
      dob: json['dob'],
      mobile: json['mobile'] ,
      gender: json['gender'],
      address:json['address'],
      street: json['street'],
      city: json['city'],
      postal_code: json['postal_code'],
      country: json['country'],
      id_proof_type: json['id_proof_type'],
      id_proof_no: json['id_proof_no'],
      id_proof_expiry_date: json['id_proof_expiry_date'],
      id_proof_url: json['id_proof_url'],
      livelyness_img: json['livelyness_img'],
      livelyness_score: json['livelyness_score'],
      step_1_status: json['step_1_status'],
      step_2_status: json['step_2_status'],
      step_3_status: json['step_3_status'],
      final_status:json['final_status'],
      remarks:json['remarks'],







    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.user_id;
    data['name'] = this.name;
    data['dob'] = this.dob;
    data['mobile']= this.mobile;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['street'] = this.street;
    data['city'] = this.city;
    data['postal_code'] = this.postal_code;
    data['country'] = this.country;
    data['id_proof_type'] = this.id_proof_type;
    data['id_proof_no'] = this.id_proof_no;
    data['id_proof_expiry_date'] = this.id_proof_expiry_date;
    data['id_proof_url'] = this.id_proof_url;
    data['livelyness_img'] = this.livelyness_img;
    data['livelyness_score'] = this.livelyness_score;
    data['step_1_status']= this.step_1_status;

    data['step_2_status'] = this.step_2_status;
    data['step_3_status'] = this.step_3_status;
    data['final_status']= this.final_status;
    data['remarks'] = this.remarks;

    return data;
  }
}
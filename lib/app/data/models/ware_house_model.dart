class Warehouse {
  int? id;
  String? fullname;
  int? phone;
  String? address;
  Null? topInvoice;
  Null? middleInvoice;
  Null? bottomInvoice;
  Null? noteInvoice;
  String? createdAt;
  String? updatedAt;

  Warehouse(
      {this.id,
      this.fullname,
      this.phone,
      this.address,
      this.topInvoice,
      this.middleInvoice,
      this.bottomInvoice,
      this.noteInvoice,
      this.createdAt,
      this.updatedAt});

  Warehouse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    phone = json['phone'];
    address = json['address'];
    topInvoice = json['top_invoice'];
    middleInvoice = json['middle_invoice'];
    bottomInvoice = json['bottom_invoice'];
    noteInvoice = json['note_invoice'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullname'] = fullname;
    data['phone'] = phone;
    data['address'] = address;
    data['top_invoice'] = topInvoice;
    data['middle_invoice'] = middleInvoice;
    data['bottom_invoice'] = bottomInvoice;
    data['note_invoice'] = noteInvoice;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

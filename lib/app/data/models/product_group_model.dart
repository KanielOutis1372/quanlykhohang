class ProductGroupList {
  List<ProductGroup>? data;

  ProductGroupList({this.data});

  ProductGroupList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ProductGroup>[];
      json['data'].forEach((v) {
        data!.add(ProductGroup.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductGroup {
  int? id;
  String? groupName;
  String? groupCode;
  String? description;
  int? parent;
  String? commission;
  String? commissionType;
  String? commissionTarget;
  String? createdAt;
  String? updatedAt;

  ProductGroup(
      {this.id,
      this.groupName,
      this.groupCode,
      this.description,
      this.parent,
      this.commission,
      this.commissionType,
      this.commissionTarget,
      this.createdAt,
      this.updatedAt});

  ProductGroup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupName = json['group_name'];
    groupCode = json['group_code'];
    description = json['description'];
    parent = json['parent'];
    commission = json['commission'];
    commissionType = json['commission_type'];
    commissionTarget = json['commission_target'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['group_name'] = groupName;
    data['group_code'] = groupCode;
    data['description'] = description;
    data['parent'] = parent;
    data['commission'] = commission;
    data['commission_type'] = commissionType;
    data['commission_target'] = commissionTarget;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
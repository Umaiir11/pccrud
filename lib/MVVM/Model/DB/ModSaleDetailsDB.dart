class ModSaleDetailsDB {

  ModSaleDetailsDB({
    this.Pr_PKGUID,
    this.Pr_Operation,
    this.Pr_VmDID,
    this.Pr_Item,
    this.Pr_Quantity,
      this.Pr_Rate
    ,
  });

  String? Pr_PKGUID;
  String? Pr_VmDID;
  String? Pr_Item;
  String? Pr_Quantity;
  int? Pr_Operation;
  int? Pr_Rate;


  Map<String, dynamic> UserToJson() {
    final jsonMap = <String, dynamic>{};
    if (Pr_PKGUID != null) jsonMap["Pr_PKGUID"] = Pr_PKGUID!;
    if (Pr_VmDID != null) jsonMap["Pr_CustID"] = Pr_VmDID!;
    if (Pr_Item != null) jsonMap["Pr_Voucher"] = Pr_Item!;
    if (Pr_Quantity != null) jsonMap["Pr_GrandTotal"] = Pr_Quantity!;
    if (Pr_Operation != null) jsonMap["Pr_Operation"] = Pr_Operation!;
    if (Pr_Rate != null) jsonMap["Pr_Operation"] = Pr_Rate!;
    return jsonMap;
  }
}

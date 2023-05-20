class ModSaleDB {

  ModSaleDB({
    this.Pr_PKGUID,
    this.Pr_Operation,
    this.Pr_CustID,
    this.Pr_Voucher,
    this.Pr_GrandTotal,
  });

  String? Pr_PKGUID;
  String? Pr_CustID;
  String? Pr_Voucher;
  String? Pr_GrandTotal;
  int? Pr_Operation;


  Map<String, dynamic> UserToJson() {
    final jsonMap = <String, dynamic>{};
    if (Pr_PKGUID != null) jsonMap["Pr_PKGUID"] = Pr_PKGUID!;
    if (Pr_CustID != null) jsonMap["Pr_CustID"] = Pr_CustID!;
    if (Pr_Voucher != null) jsonMap["Pr_Voucher"] = Pr_Voucher!;
    if (Pr_GrandTotal != null) jsonMap["Pr_GrandTotal"] = Pr_GrandTotal!;
    if (Pr_Operation != null) jsonMap["Pr_Operation"] = Pr_Operation!;
    return jsonMap;
  }
}

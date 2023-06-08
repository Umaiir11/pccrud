class ModCustomerDetails {
  ModCustomerDetails({
    this.Pr_PKGUID,
    this.Pr_CustID,
    this.Pr_CB,
    this.Pr_ISD,
    this.Pr_Operation,
  });

  String? Pr_PKGUID;
  String? Pr_CustID;
  String? Pr_CB;
  String? Pr_ISD;
  int? Pr_Operation;

  Map<String, dynamic> UserToJson() {
    final jsonMap = <String, dynamic>{};
    if (Pr_PKGUID != null) jsonMap["Pr_PKGUID"] = Pr_PKGUID!;
    if (Pr_CustID != null) jsonMap["Pr_CustID"] = Pr_CustID!;
    if (Pr_CB != null) jsonMap["Pr_CB"] = Pr_CB!;
    if (Pr_ISD != null) jsonMap["Pr_ISD"] = Pr_ISD!;
    if (Pr_Operation != null) jsonMap["Pr_Operation"] = Pr_Operation!;

    return jsonMap;
  }
}

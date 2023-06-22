class ModSingleMulti {
  ModSingleMulti({
    this.Pr_PKGUID,
    this.Pr_Operation,
    this.Pr_UserName,
    this.Pr_UserCompany,
    this.Pr_UserCity,
    this.Pr_GrandTotal,
  });

  String? Pr_PKGUID;
  String? Pr_UserName;
  String? Pr_UserCompany;
  String? Pr_UserCity;
  int? Pr_GrandTotal;
  int? Pr_Operation;

  Map<String, dynamic> UserToJson() {
    final jsonMap = <String, dynamic>{};
    if (Pr_PKGUID != null) jsonMap["Pr_PKGUID"] = Pr_PKGUID!;
    if (Pr_UserName != null) jsonMap["Pr_UserName"] = Pr_UserName!;
    if (Pr_UserCompany != null) jsonMap["Pr_UserCompany"] = Pr_UserCompany!;
    if (Pr_UserCity != null) jsonMap["Pr_UserCity"] = Pr_UserCity!;
    if (Pr_GrandTotal != null) jsonMap["Pr_GrandTotal"] = Pr_GrandTotal!;
    if (Pr_Operation != null) jsonMap["Pr_Operation"] = Pr_Operation!;
    return jsonMap;
  }
}

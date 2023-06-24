class ModSale {
  ModSale({
    this.Pr_Image,

  });

  String? Pr_Image;


  Map<String, dynamic> UserToJson() {
    final jsonMap = <String, dynamic>{};
    if (Pr_Image != null) jsonMap["Pr_Image"] = Pr_Image!;

    return jsonMap;
  }
}

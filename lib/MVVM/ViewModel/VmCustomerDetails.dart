import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModCustomerDetails.dart';
import 'package:uuid/uuid.dart';

class VmCustomerDetails extends GetxController {


  RxBool l_TextFieldsValidation = false.obs;

  RxString l_PrPKGUID = ''.obs;

  String get Pr_txtPKGUID_Text {
    return l_PrPKGUID.value;
  }

  set Pr_txtPKGUID_Text(String value) {
    l_PrPKGUID.value = value;
  }


  RxString l_PrCustID = ''.obs;

  String get Pr_txtCustID_Text {
    return l_PrCustID.value;
  }

  set Pr_txtCustID_Text(String value) {
    l_PrCustID.value = value;
  }

  RxString l_PrPr_CB = ''.obs;

  String get Pr_txtPr_CB_Text {
    return l_PrPr_CB.value;
  }

  set Pr_txtPr_CB_Text(String value) {
    l_PrPr_CB.value = value;
  }

  RxString l_Pr_ISD =  ''.obs;

  String get Pr_txtPr_ISD_Text {
    return l_Pr_ISD.value;
  }

  set Pr_txtPr_ISD_Text(String value) {
    l_Pr_ISD.value = value;
  }

  // Retrieve the ModSaleDB object from the existing instance of VmSale

  RxList<ModCustomerDetails> l_CustomerDetailsList = <ModCustomerDetails>[].obs;

  FncFill_CustomerDetailsModel() {
    ModCustomerDetails l_ModCustomerDetails = ModCustomerDetails();
    //Get the filled Sale model instace

    String lUuid = const Uuid().v4();
    l_ModCustomerDetails.Pr_PKGUID = lUuid;
    l_ModCustomerDetails.Pr_CustID = Pr_txtCustID_Text;
    l_ModCustomerDetails.Pr_ISD = Pr_txtPr_ISD_Text;
    l_ModCustomerDetails.Pr_CB = Pr_txtPr_CB_Text;

    l_CustomerDetailsList.add(l_ModCustomerDetails);

    return l_ModCustomerDetails; // Return the instance
  }


}

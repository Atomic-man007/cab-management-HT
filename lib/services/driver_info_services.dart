import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DriverInfoService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future addDriver({
    required String driverName,
    required String driverIdNumber,
    required String driverEmail,
    required String driverPhoneNumber,
    required void Function() navigateToDriverInfo,
  }) async {
    try {
      var docRef = await firestore.collection("Add_driver_Details_table").add({
        "driverName": driverName,
        "driverIdNumber": driverIdNumber,
        "driverEmail": driverEmail,
        "driverPhoneNumber": driverPhoneNumber,
        "driverCreatedDate": DateTime.now()
      });

      String docId = docRef.id;

      await docRef.update({
        "docId": docId,
      });

      Fluttertoast.showToast(msg: "Details added successfully");
      // Call the callback function to navigate to DriverInfo page
      navigateToDriverInfo();

    } catch (e) {
      print("error while adding driver details $e");
      Fluttertoast.showToast(msg: "Error while adding details");
    }
  }

  Future updateDriverDetails(
      {required String docId,
      required String driverName,
      required String driverEmail}) async {
    try {
      await firestore
          .collection("Add_driver_Details_table")
          .doc(docId)
          .update({"driverName": driverName, "driverEmail": driverEmail});
    } catch (e) {
      print("update driver details error $e");
      Fluttertoast.showToast(msg: "Error while updating details");
    }
  }

  Future deleteDriver(String docId) async {
    try {
      await firestore
          .collection("Add_driver_Details_table")
          .doc(docId)
          .delete();
      Fluttertoast.showToast(msg: "Driver deleted Successfully");
    } catch (e) {
      Fluttertoast.showToast(msg: "Error while deleting details");
    }
  }
}

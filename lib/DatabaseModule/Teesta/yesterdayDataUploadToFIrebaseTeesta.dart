import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:toll_plaza/DatabaseModule/Teesta/todayReportTeestaDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Teesta/todayVipPassReportTeestaDataModule.dart';

class YesterdayDataUploadToFirebaseTeesta {
  upload(TodayReportTeestaDataModule yesterdayData) async {
    final databaseReference = FirebaseDatabase.instance.reference();
    var date = DateFormat("dd-MM-yyyy").format(DateTime.now().subtract(Duration(days: 1)));

    var yesterdayVehicle = yesterdayData.yesterdayVehicleReportList;

    databaseReference.child('Teesta').child(date.toString()).update({
      'date': date.toString(),
      'dayTotalAmount': yesterdayData.totalYesterdayRevenue.toString(),
      'vichelAmount': yesterdayData.totalYesterdayVehicle.toString(),
      yesterdayVehicle[0].vehicleName.toString(): (yesterdayVehicle[0].totalVehicle * yesterdayVehicle[0].perVehicleRate).toString(),
      yesterdayVehicle[1].vehicleName.toString(): (yesterdayVehicle[1].totalVehicle * yesterdayVehicle[1].perVehicleRate).toString(),
      yesterdayVehicle[2].vehicleName.toString(): (yesterdayVehicle[2].totalVehicle * yesterdayVehicle[2].perVehicleRate).toString(),
      yesterdayVehicle[3].vehicleName.toString(): (yesterdayVehicle[3].totalVehicle * yesterdayVehicle[3].perVehicleRate).toString(),
      yesterdayVehicle[4].vehicleName.toString(): (yesterdayVehicle[4].totalVehicle * yesterdayVehicle[4].perVehicleRate).toString(),
      yesterdayVehicle[5].vehicleName.toString(): (yesterdayVehicle[5].totalVehicle * yesterdayVehicle[5].perVehicleRate).toString(),
      yesterdayVehicle[6].vehicleName.toString(): (yesterdayVehicle[6].totalVehicle * yesterdayVehicle[6].perVehicleRate).toString(),
      yesterdayVehicle[7].vehicleName.toString(): (yesterdayVehicle[7].totalVehicle * yesterdayVehicle[7].perVehicleRate).toString(),
      yesterdayVehicle[8].vehicleName.toString(): (yesterdayVehicle[8].totalVehicle * yesterdayVehicle[8].perVehicleRate).toString(),
      yesterdayVehicle[9].vehicleName.toString(): (yesterdayVehicle[9].totalVehicle * yesterdayVehicle[9].perVehicleRate).toString(),
      yesterdayVehicle[10].vehicleName.toString(): (yesterdayVehicle[10].totalVehicle * yesterdayVehicle[10].perVehicleRate).toString(),
      yesterdayVehicle[11].vehicleName.toString(): (yesterdayVehicle[11].totalVehicle * yesterdayVehicle[11].perVehicleRate).toString(),
      yesterdayVehicle[12].vehicleName.toString(): (yesterdayVehicle[12].totalVehicle * yesterdayVehicle[12].perVehicleRate).toString(),
    });

    //print(date);
  }

  uploadVIP(TodayVipPassReportTeestaDataModule yesterdayData) async {
    final databaseReference = FirebaseDatabase.instance.reference();
    var date = DateFormat("dd-MM-yyyy").format(DateTime.now().subtract(Duration(days: 1)));
    databaseReference.child('PreviousVip').update({
      date.toString(): yesterdayData.totalYesterdayVehicle.toString(),
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminRepository {
  Future<String> registerUser(String email) async {
    AuthResult result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: 'mahindra');

    return result.user.uid;
  }

  Future<void> uploadUserInfo(String email, String uid, String name,
      String number, bool assessorVal, bool assesseeVal) async {
    List<String> role = [];
    if (assessorVal) {
      role.add('assessor');
    }
    if (assesseeVal) {
      role.add('assessee');
    }
    await Firestore.instance.collection('users').document(uid).setData(
        {'name': name, 'number': number, 'email': email, 'role': role});
  }

  Future<List<Map<String, String>>> getAssesseeMap() async {
    List<Map<String, String>> assesseeList = [];
    await Firestore.instance
        .collection('users')
        .where('role', arrayContains: 'assessee')
        .getDocuments()
        .then((QuerySnapshot assessee) {
      assessee.documents.forEach((element) {
        Map<String, String> assesseeMap = {
          'Name': element.data['name'],
          'uid': element.documentID
        };

        assesseeList.add(assesseeMap);
      });
    });

    return assesseeList;
  }

  Future<List<Map<String, String>>> getLocationMap() async {
    List<Map<String, String>> locationList = [];
    await Firestore.instance
        .collection('locations')
        .getDocuments()
        .then((QuerySnapshot location) {
      location.documents.forEach((element) {
        Map<String, String> locationMap = {};
        if (element.data['typeOfLocation'] == 'mahindra') {
          locationMap = getMahindraMap(element);
        } else {
          locationMap = getVendorMap(element);
        }

        locationList.add(locationMap);
      });
    });
    locationList = await getNames(locationList);
    return locationList;
  }

  Future<List<Map<String, String>>> getNames(
      List<Map<String, String>> oldList) async {
    List<Map<String, String>> newList = oldList;
    for (int i = 0; i < oldList.length; i++) {
      String name = await getAssesseeName(oldList[i]['assessee']);
      newList[i].remove('assessee');
      newList[i]['assessee'] = name;
    }
    return newList;
  }

  Future<String> getAssesseeName(String uid) async {
    String name = '';
    DocumentSnapshot data =
        await Firestore.instance.collection('users').document(uid).get();
    name = data.data['name'];

    return name;
  }

  Map<String, String> getMahindraMap(DocumentSnapshot document) {
    Map<String, String> map = {
      'typeOfLocation': 'mahindra',
      'category': document.data['category'],
      'nameOfSector': document.data['nameOfSector'],
      'nameOfBusiness': document.data['nameOfBusiness'],
      'location': document.data['location'],
      'lastAssessmentStage': document.data['lastAssessmentStage'],
      'processLevel': document.data['processLevel'],
      'resultLevel': document.data['resultLevel'],
      'assessee': document.data['assessee'],
      'plantHeadName': document.data['plantHeadName'],
      'plantHeadEmail': document.data['plantHeadEmail'],
      'plantHeadPhoneNumber': document.data['plantHeadPhoneNumber'],
      'spocName': document.data['sectorBusinessSafetySpocName'],
      'spocEmail': document.data['sectorBusinessSafetySpocEmail'],
      'spocPhoneNumber': document.data['sectorBusinessSafetySpocPhoneNumber'],
    };
    return map;
  }

  Map<String, String> getVendorMap(DocumentSnapshot document) {
    Map<String, String> map = {
      'typeOfLocation': 'vendor',
      'nameOfBusiness': document.data['nameOfBusiness'],
      'location': document.data['location'],
      'assessee': document.data['assessee'],
      'plantHeadName': document.data['plantHeadName'],
      'plantHeadEmail': document.data['plantHeadEmail'],
      'plantHeadPhoneNumber': document.data['plantHeadPhoneNumber'],
      'personnelName': document.data['ssuPersonnelName'],
      'personnelEmail': document.data['ssuPersonnelEmail'],
      'personnelPhoneNumber': document.data['ssuPersonnelPhoneNumber'],
    };
    return map;
  }

  Future<void> mahindraLocationEnroll(
      String category,
      String nameOfSector,
      String nameOfBusiness,
      String location,
      String lastAssessmentStage,
      String processLevel,
      String resultLevel,
      String assessee,
      String plantHeadName,
      String plantHeadEmail,
      String plantHeadPhoneNumber,
      String sectorBusinessSafetySpocName,
      String sectorBusinessSafetySpocEmail,
      String sectorBusinessSafetySpocPhoneNumber) async {
    await Firestore.instance.collection('locations').document().setData({
      'typeOfLocation': 'mahindra',
      'category': category,
      'nameOfSector': nameOfSector,
      'nameOfBusiness': nameOfBusiness,
      'location': location,
      'lastAssessmentStage': lastAssessmentStage,
      'processLevel': processLevel,
      'resultLevel': resultLevel,
      'assessee': assessee,
      'plantHeadName': plantHeadName,
      'plantHeadEmail': plantHeadEmail,
      'plantHeadPhoneNumber': plantHeadPhoneNumber,
      'sectorBusinessSafetySpocName': sectorBusinessSafetySpocName,
      'sectorBusinessSafetySpocEmail': sectorBusinessSafetySpocEmail,
      'sectorBusinessSafetySpocPhoneNumber': sectorBusinessSafetySpocPhoneNumber
    });
  }

  Future<void> vendorLocationEnroll(
      String nameOfBusiness,
      String location,
      String assessee,
      String plantHeadName,
      String plantHeadEmail,
      String plantHeadPhoneNumber,
      String ssuPersonnelName,
      String ssuPersonnelEmail,
      String ssuPersonnelPhoneNUmber) async {
    await Firestore.instance.collection('locations').document().setData({
      'typeOfLocation': 'vendor',
      'nameOfBusiness': nameOfBusiness,
      'location': location,
      'assessee': assessee,
      'plantHeadName': plantHeadName,
      'plantHeadEmail': plantHeadEmail,
      'plantHeadPhoneNumber': plantHeadPhoneNumber,
      'ssuPersonnelName': ssuPersonnelName,
      'ssuPersonnelEmail': ssuPersonnelEmail,
      'ssuPersonnelPhoneNumber': ssuPersonnelPhoneNUmber
    });
  }

  Future<List<Map<String, String>>> getLocationList() async {
    print('Started');
    List<Map<String, String>> locationMap = [];
    QuerySnapshot locations =
        await Firestore.instance.collection('locations').getDocuments();
    for (int i = 0; i < locations.documents.length; i++) {
      Map<String, String> location = {};
      if (locations.documents[i]['typeOfLocation'] == 'vendor') {
        location['documentID'] = locations.documents[i].documentID;
        location['typeOfLocation'] = locations.documents[i]['typeOfLocation'];
        location['assessee'] =
            await getAssesseeName(locations.documents[i]['assessee']);
        location['assesseeId'] = locations.documents[i]['assessee'];
        location['location'] = locations.documents[i]['location'];
        location['nameOfBusiness'] = locations.documents[i]['nameOfBusiness'];
        location['plantHeadEmail'] = locations.documents[i]['plantHeadEmail'];
        location['plantHeadName'] = locations.documents[i]['plantHeadName'];
        location['plantHeadPhoneNumber'] =
            locations.documents[i]['plantHeadPhoneNumber'];
        location['ssuPersonnelEmail'] =
            locations.documents[i]['ssuPersonnelEmail'];
        location['ssuPersonnelName'] =
            locations.documents[i]['ssuPersonnelName'];
        location['ssuPersonnelPhoneNumber'] =
            locations.documents[i]['ssuPersonnelPhoneNumber'];
      } else {
        location['documentID'] = locations.documents[i].documentID;
        location['typeOfLocation'] = locations.documents[i]['typeOfLocation'];
        location['assessee'] =
            await getAssesseeName(locations.documents[i]['assessee']);
        location['assesseeId'] = locations.documents[i]['assessee'];
        location['location'] = locations.documents[i]['location'];
        location['nameOfBusiness'] = locations.documents[i]['nameOfBusiness'];
        location['plantHeadEmail'] = locations.documents[i]['plantHeadEmail'];
        location['plantHeadName'] = locations.documents[i]['plantHeadName'];
        location['plantHeadPhoneNumber'] =
            locations.documents[i]['plantHeadPhoneNumber'];
        location['sectorBusinessSafetySpocEmail'] =
            locations.documents[i]['sectorBusinessSafetySpocEmail'];
        location['sectorBusinessSafetySpocName'] =
            locations.documents[i]['sectorBusinessSafetySpocName'];
        location['sectorBusinessSafetySpocPhoneNumber'] =
            locations.documents[i]['sectorBusinessSafetySpocPhoneNumber'];
        location['category'] = locations.documents[i]['category'];
        location['lastAssessmentStage'] =
            locations.documents[i]['lastAssessmentStage'];
        location['nameOfSector'] = locations.documents[i]['nameOfSector'];
        location['processLevel'] = locations.documents[i]['processLevel'];
        location['resultLevel'] = locations.documents[i]['resultLevel'];
      }

      locationMap.add(location);
    }
    return locationMap;
  }

  Future<void> scheduleAssessment(
      String documentID, String assessorUid, DateTime scheduledDate) async {
    print(documentID);
    DocumentSnapshot location = await Firestore.instance
        .collection('locations')
        .document(documentID)
        .get();
    String locat = location['location'];
    String assessee = location['assessee'];
    await Firestore.instance.collection('cycles').document().setData({
      'location': locat,
      'assesseeUid': assessee,
      'startDate': Timestamp.now(),
      'currentStatus': 'Annual Data Requested',
      'endDate': null,
      'assessorUid': assessorUid,
      'scheduledDate': Timestamp.fromMillisecondsSinceEpoch(
          scheduledDate.millisecondsSinceEpoch)
    });
    QuerySnapshot selectedLocation = await Firestore.instance
        .collection('cycles')
        .where('location', isEqualTo: locat)
        .getDocuments();

    String cycleDocumentID = selectedLocation.documents[0].documentID;
    List<Map<String, String>> map = [
      {'role': 'assessee', 'type': 'annualData', 'uid': assessee}
    ];

    await Firestore.instance.collection('activities').document().setData({
      'content': 'Admin has requested Annual Data',
      'date': Timestamp.now(),
      'showTo': map,
      'cycleDocumentID': cycleDocumentID,
    });
  }

  Future<List<Map<String, String>>> getCycles() async {
    List<Map<String, String>> list = [];
    QuerySnapshot data =
        await Firestore.instance.collection('cycles').getDocuments();
    for (int i = 0; i < data.documents.length; i++) {
      Map<String, String> map = {};
      Timestamp startDate = data.documents[i]['startDate'];
      DateTime startDateTime = startDate.toDate();
      if (data.documents[i]['endDate'] != null) {
        Timestamp endDate = data.documents[i]['endDate'];
        DateTime endDateTime = endDate.toDate();
        map['endDate'] = endDateTime.day.toString() +
            '/' +
            endDateTime.month.toString() +
            '/' +
            endDateTime.year.toString();
      } else {
        map['endDate'] = '';
      }

      map['location'] = data.documents[i]['location'];
      map['startDate'] = startDateTime.day.toString() +
          '/' +
          startDateTime.month.toString() +
          '/' +
          startDateTime.year.toString();

      map['currentStatus'] = data.documents[i]['currentStatus'];
      list.add(map);
    }
    return list;
  }

  Future<List<Map<String, String>>> getAssessorList() async {
    List<Map<String, String>> assessorList = [];
    await Firestore.instance
        .collection('users')
        .where('role', arrayContains: 'assessor')
        .getDocuments()
        .then((value) {
      value.documents.forEach((element) {
        Map<String, String> assessorMap = {};
        assessorMap['name'] = element['name'];
        assessorMap['uid'] = element.documentID;
        assessorList.add(assessorMap);
      });
    });
    return assessorList;
  }

  Future<List<Map<String, String>>> getAssessmentAnnualData() async {
    List<Map<String, String>> annualDataList = [];
    await Firestore.instance
        .collection('cycles')
        .getDocuments()
        .then((snapshot) {
      snapshot.documents.forEach((cycle) {
        if (cycle.data['currentStatus'] != 'Annual Data Requested') {
          Map<String, String> map = {};
          if (cycle.data['adCategory'] == 'category1') {
            map = category1Map(cycle);
          } else {
            map = category2Map(cycle);
          }
          annualDataList.add(map);
        }
      });
    });

    return annualDataList;
  }
}

Map<String, String> category1Map(DocumentSnapshot cycle) {
  Map<String, String> map = {};
  map['location'] = cycle.data['location'];
  map['category'] = cycle.data['adCategory'];
  map['closureOf'] = cycle.data['adClosureOf'];
  map['fatal'] = cycle.data['adFatal'];
  map['fatalaAccidents'] = cycle.data['adFatalAccidents'];
  map['fireIncidents'] = cycle.data['adFireIncident'];
  map['fireIncidentMinor'] = cycle.data['adFireIncidentMinor'];
  map['FirstaidAccidents'] = cycle.data['adFirstaidAccidents'];
  map['identified'] = cycle.data['adIdentified'];
  map['manDaysLost'] = cycle.data['adManDaysLost'];
  map['manDaysLostNra'] = cycle.data['adManDaysLostNra'];
  map['manPower'] = cycle.data['adManPower'];
  map['nearMissIncidents'] = cycle.data['adNearMissIncidents'];
  map['nonReportableAccidents'] = cycle.data['adNoReportableAccidents'];
  map['reportableAccidents'] = cycle.data['adReportableAccidents'];
  map['safetyActivityRate'] = cycle.data['adSafetyActivityRate'];
  map['themeBasedInspections'] = cycle.data['adThemeBasedInspections'];
  map['totalAccidents'] = cycle.data['adTotalAccidents'];
  map['kaizen'] = cycle.data['adKaizen'];

  return map;
}

Map<String, String> category2Map(DocumentSnapshot cycle) {
  Map<String, String> map = {};
  map['location'] = cycle.data['location'];
  map['category'] = cycle.data['adCategory'];
  map['manPower'] = cycle.data['adManPower'];
  map['fatal'] = cycle.data['adFatal'];
  map['onDutyFatal'] = cycle.data['adonDutyFatal'];
  map['fireIncidentsMajor'] = cycle.data['adFireIncidentMajor'];
  map['fireIncidentMinor'] = cycle.data['adFireIncidentMinor'];
  map['reportableAccidents'] = cycle.data['adReportableAccidents'];

  return map;
}

import 'package:cloud_firestore/cloud_firestore.dart';

class AssessmentLocationInfoRepository {
  Future<Map<String, dynamic>> getassessorInfo(String locationId) async {
    DocumentSnapshot info = await Firestore.instance
        .collection('locations')
        .document(locationId)
        .collection('info')
        .document('info')
        .get();
    Map<String, dynamic> keys = {
      'siteName': info.data['siteName'],
      'occupierName': info.data['occupierName'],
      'occupierEmail': info.data['occupierEmail'],
      'headName': info.data['headName'],
      'headEmail': info.data['headEmail'],
      'safetyInchargeName': info.data['safetyInchargeName'],
      'safetyInchargeEmail': info.data['safetyInchargeEmail'],
      'fireInchargeName': info.data['fireInchargeName'],
      'fireInchargeEmail': info.data['fireInchargeEmail'],
      'officeSafetyInchargeName': info.data['officeSafetyInchargeName'],
      'officeSafetyInchargeEmail': info.data['officeSafetyInchargeEmail'],
      'utilitiesName': info.data['utilitiesName'],
      'utilitiesEmail': info.data['utilitiesEmail'],
      'rule': info.data['rule'],
      'ruleValue': info.data['ruleValue'],
      'lpg': info.data['lpg'],
      'lpgValue': info.data['lpgValue'],
      'gasoline': info.data['gasoline'],
      'gasolineValue': info.data['gasolineValue'],
      'cng': info.data['cng'],
      'cngValue': info.data['cngValue'],
      'paintShop': info.data['paintShop'],
      'paintShopValue': info.data['paintShopValue'],
      'foundry': info.data['foundry'],
      'foundryValue': info.data['foundryValue'],
      'press': info.data['press'],
      'pressValue': info.data['pressValue'],
      'diesel': info.data['diesel'],
      'dieselValue': info.data['dieselValue'],
      'thinner': info.data['thinner'],
      'thinnerValue': info.data['thinnerValue'],
      'toxic': info.data['toxic'],
      'toxicValue': info.data['toxicValue'],
      'heat': info.data['heat'],
      'heatValue': info.data['heatValue'],
      'testBed': info.data['testBed'],
      'testBedValue': info.data['testBedValue'],
      'ibr': info.data['ibr'],
      'ibrValue': info.data['ibrValue'],
      'fatal': info.data['fatal'],
      'reportable': info.data['reportable'],
      'nonReportable': info.data['nonReportable'],
      'firstAid': info.data['firstAid'],
      'fire': info.data['fire'],
    };
    print('repository '+keys.toString());
    return keys;

  }
}

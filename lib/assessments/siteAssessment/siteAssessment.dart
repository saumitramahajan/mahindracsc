import 'package:flutter/material.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessmentProvider.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteRiskProfile.dart';
import 'package:provider/provider.dart';

import 'locationInfoBase.dart';

class SiteAssessment extends StatelessWidget {
  final String type;
  final String cycleId;
  SiteAssessment(this.type, this.cycleId);

  @override
  Widget build(BuildContext context) {
    return (type == 'site')
        ? SiteRiskProfile(cycleId: cycleId)
        : ChangeNotifierProvider(
            create: (_) => SiteAssessmentProvider(type, cycleId),
            child: LocationInfoBase(),
          );
  }
}

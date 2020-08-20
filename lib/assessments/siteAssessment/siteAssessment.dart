import 'package:flutter/material.dart';
import 'package:mahindraCSC/assessments/siteAssessment/locationInfo.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessmentForm.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessmentProvider.dart';
import 'package:provider/provider.dart';

import 'locationInfoBase.dart';

class SiteAssessment extends StatelessWidget {
  final String type;
  final String cycleId;
  SiteAssessment(this.type, this.cycleId);

  @override
  Widget build(BuildContext context) {
    return (type == 'site')
        ? ChangeNotifierProvider<SiteAssessmentProvider>(
            create: (_) => SiteAssessmentProvider(type, cycleId),
            child: SiteAssessmentForm(),
          )
        : ChangeNotifierProvider(
            create: (_) => SiteAssessmentProvider(type, cycleId),
            child: LocationInfoBase(),
          );
  }
}

import 'package:flutter/material.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessmentForm.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessmentProvider.dart';
import 'package:provider/provider.dart';

class SiteAssessment extends StatelessWidget {
  final String type;
  SiteAssessment(this.type);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SiteAssessmentProvider>(
      create: (_) => SiteAssessmentProvider(type),
      child: SiteAssessmentForm(),
    );
  }
}

import 'package:flutter/material.dart';
import 'scheduleAssessmentProvider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ScheduleAssessmentForm extends StatefulWidget {
  @override
  _ScheduleAssessmentFormState createState() => _ScheduleAssessmentFormState();
}

class _ScheduleAssessmentFormState extends State<ScheduleAssessmentForm> {
  String dropdownValue = 'select';
  String assessorUid = 'select';
  bool datePicked = false;
  DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    final requestAD = Provider.of<ScheduleAssessmentProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xfff4001c),
          title: SizedBox(
            height: AppBar().preferredSize.height,
            child: Image.asset(
              'assets/mahindraAppBar.png',
              fit: BoxFit.contain,
            ),
          ),
          titleSpacing: 0.0,
          automaticallyImplyLeading: false,
        ),
        body: requestAD.listLoading
            ? Center(child: CircularProgressIndicator())
            : Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton(
                      isExpanded: true,
                      value: dropdownValue,
                      onChanged: (value) {
                        setState(() {
                          dropdownValue = value;
                        });
                      },
                      items: requestAD.dropDownList,
                    ),
                    DropdownButton(
                      isExpanded: true,
                      value: assessorUid,
                      onChanged: (value) {
                        setState(() {
                          assessorUid = value;
                        });
                      },
                      items: requestAD.assessorList,
                    ),
                    GestureDetector(
                      child: datePicked
                          ? Text(
                              'Scheduled Date: ${DateFormat('dd-yy-yyy').format(selectedDate)}')
                          : Text('Scheduled Assessment Date'),
                      onTap: () async {
                        DateTime picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(DateTime.now().year + 5));
                        if (picked != null) {
                          setState(() {
                            datePicked = true;
                            selectedDate = picked;
                          });
                        }
                      },
                    ),
                    RaisedButton(
                      child: requestAD.requesting
                          ? CircularProgressIndicator()
                          : Text('Schedule'),
                      onPressed: () async {
                        await requestAD.scheduleAssessment(
                            dropdownValue, assessorUid, selectedDate);
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ));
  }
}

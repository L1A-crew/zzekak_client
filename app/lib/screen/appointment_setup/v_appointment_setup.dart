import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:zzekak/components/app_bar_delete_btn.dart';
import 'package:zzekak/components/date_picker.dart';
import 'package:zzekak/components/elevated_btn.dart';
import 'package:zzekak/routes/app_routes.dart';
import 'package:zzekak/schemes/color_schemes.dart';
import 'package:zzekak/schemes/font_style.dart';

class AppointmentSetupView extends StatefulWidget {
  const AppointmentSetupView({required final GetIt di, super.key});

  @override
  State<AppointmentSetupView> createState() => _AppointmentSetupViewState();
}

class _AppointmentSetupViewState extends State<AppointmentSetupView> {
  final _formKey = GlobalKey<FormState>();

  DateTime? selectedDate;
  DateTime? selectedTime;
  String? selectedStartLocation;
  String? selectedEndLocation;
  String? appointmentName;

  void _showBottomDrawer(BuildContext context, String type) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        switch (type) {
          case 'date':
            return DatePickerWidget(
              initialSelectedDate: selectedDate,
              onDateSelected: (DateTime date) {
                setState(() {
                  selectedDate = date;
                });
              },
            );
          case 'time':
            return _buildTimePicker();
          case 'startLocation':
            return _buildStartLocationPicker();
          case 'endLocation':
            return _buildEndLocationPicker();
          case 'name':
            return _buildNameInput();
          default:
            return Container();
        }
      },
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
  }

  Widget _buildHandleBar() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 4.0),
        width: 100,
        height: 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color.fromARGB(80, 198, 198, 198),
        ),
      ),
    );
  }

  Widget _buildTimePicker() {
    return Container(
      height: 420,
      padding: const EdgeInsets.only(top: 4),
      decoration: BoxDecoration(
        color: context.color.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHandleBar(),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '몇시에 만나나요?',
              style: ZzekakTextStyle.h2(context),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.time,
              onDateTimeChanged: (DateTime time) {
                setState(() {
                  selectedTime = time;
                });
              },
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              child: zzekakElevatedButton(
                context: context,
                onPressed: () async {
                  Navigator.pop(context);
                },
                text: '확인',
              ),
            ),
          ),
          const SizedBox(height: 40)
        ],
      ),
    );
  }

  Widget _buildStartLocationPicker() {
    return Container(
      height: 400,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            '위치 선택',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('위치 ${index + 1}'),
                  onTap: () {
                    setState(() {
                      selectedStartLocation = '위치 ${index + 1}';
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEndLocationPicker() {
    return Container(
      height: 400,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            '위치 선택',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('위치 ${index + 1}'),
                  onTap: () {
                    setState(() {
                      selectedEndLocation = '위치 ${index + 1}';
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNameInput() {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              autofocus: true,
              decoration: const InputDecoration(
                hintText: '10자 이내로 약속이름을 지어주세요',
                border: InputBorder.none,
              ),
              onChanged: (value) {
                setState(() {
                  appointmentName = value;
                });
              },
              onSubmitted: (_) {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required String placeholder,
    required bool isRequired,
    required String? value,
    required Function() onTap,
    String? errorMessage,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(label,
                style: ZzekakTextStyle.h5(
                    context, context.color.tertiaryContainer)),
            if (isRequired)
              const Text(
                ' *',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
            decoration: BoxDecoration(
              color: context.color.onSurfaceVariant,
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextFormField(
              key: ValueKey(value),
              enabled: false,
              decoration: InputDecoration(
                fillColor: context.color.onSurfaceVariant,
                hintText: value?.isEmpty ?? true ? placeholder : value,
                hintStyle: TextStyle(
                    color: value?.isEmpty ?? true
                        ? Colors.grey[400]
                        : context.color.onSurface),
                border: InputBorder.none,
              ),
              validator: (val) {
                if (value == null || value.isEmpty) {
                  return errorMessage;
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: zzekakEscapeAppBar(context),
      body: SafeArea(
        child: Padding(
            padding:
                const EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('약속을 만들어보세요', style: ZzekakTextStyle.h1(context)),
                  const Padding(padding: EdgeInsets.all(10.0)),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFormField(
                            label: '약속 일정',
                            placeholder: '날짜를 입력해주세요',
                            isRequired: true,
                            value: selectedDate != null
                                ? DateFormat('yyyy.MM.dd.E', 'ko')
                                    .format(selectedDate!)
                                : null,
                            onTap: () => _showBottomDrawer(context, 'date'),
                            errorMessage: '약속 일정을 입력해주세요',
                          ),
                          const SizedBox(height: 24),
                          _buildFormField(
                            label: '약속 시간',
                            placeholder: '약속시간을 입력해주세요',
                            isRequired: true,
                            value: selectedTime != null
                                ? DateFormat('a hh:mm', 'ko')
                                    .format(selectedTime!)
                                : null,
                            onTap: () => _showBottomDrawer(context, 'time'),
                            errorMessage: '약속 시간을 입력해주세요',
                          ),
                          const SizedBox(height: 24),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('이동 경로',
                                      style: ZzekakTextStyle.h5(context,
                                          context.color.tertiaryContainer)),
                                  const Text(
                                    ' *',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: context.color.onSurfaceVariant,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () => _showBottomDrawer(
                                            context, 'startLocation'),
                                        child: Container(
                                          padding: const EdgeInsets.all(18),
                                          child: Text(
                                            selectedStartLocation?.isEmpty ??
                                                    true
                                                ? '출발지를 입력해주세요'
                                                : selectedStartLocation!,
                                            style: TextStyle(
                                              color: selectedStartLocation
                                                          ?.isEmpty ??
                                                      true
                                                  ? Colors.grey[400]
                                                  : Colors.black,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 1,
                                        color: Colors.grey[400],
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                      ),
                                      GestureDetector(
                                        onTap: () => _showBottomDrawer(
                                            context, 'endLocation'),
                                        child: Container(
                                          padding: const EdgeInsets.all(18),
                                          child: Text(
                                            selectedEndLocation?.isEmpty ?? true
                                                ? '도착지를 입력해주세요'
                                                : selectedEndLocation!,
                                            style: TextStyle(
                                              color: selectedEndLocation
                                                          ?.isEmpty ??
                                                      true
                                                  ? Colors.grey[400]
                                                  : Colors.black,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                          const SizedBox(height: 24),
                          _buildFormField(
                            label: '약속 이름',
                            placeholder: '10자 이내로 약속이름을 지어주세요',
                            isRequired: false,
                            value: appointmentName,
                            onTap: () => _showBottomDrawer(context, 'name'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  zzekakElevatedButton(
                      disabled: !(_formKey.currentState?.validate() ?? false),
                      context: context,
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          return const HomeRoute().go(context);
                        }
                      },
                      text: '약속생성하기')
                ],
              ),
            )),
      ),
    );
  }
}

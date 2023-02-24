import 'package:flutter/material.dart';

Container textFeild(
  String name,
  TextEditingController controller, {
  int maxLines = 1,
  double height = 80,
  isEmail = false,
}) {
  return Container(
    height: height,
    margin: const EdgeInsets.only(left: 24, right: 24, top: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style:
              TextStyle(fontSize: height / 5, color: const Color(0xFF858597)),
        ),
        const SizedBox(height: 5),
        Form(
          autovalidateMode: AutovalidateMode.always,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 9,
                      spreadRadius: 4,
                      offset: const Offset(3, 5))
                ]),
            child: TextFormField(
              controller: controller,
              maxLines: maxLines,
              cursorColor: Colors.black,
              cursorHeight: 20,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  errorStyle: const TextStyle(fontSize: 0.01),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      style: BorderStyle.solid,
                    ),
                  ),
                  contentPadding: const EdgeInsets.only(bottom: 10, left: 10),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.7), width: 0.8)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.7), width: 0.8)),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.7), width: 0.8),
                  )),
            ),
          ),
        ),
      ],
    ),
  );
}

class PasswordFeild extends StatefulWidget {
  const PasswordFeild({Key? key, required this.name, required this.controller})
      : super(key: key);
  final String name;
  final TextEditingController controller;
  @override
  State<PasswordFeild> createState() => _PasswordFeildState();
}

class _PasswordFeildState extends State<PasswordFeild> {
  bool see = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 24, right: 24, top: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: const TextStyle(fontSize: 16, color: Color(0xFF858597)),
              ),
              const SizedBox(height: 5),
              Form(
                autovalidateMode: AutovalidateMode.always,
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 9,
                            spreadRadius: 4,
                            offset: const Offset(3, 5))
                      ]),
                  child: Center(
                    child: TextFormField(
                      controller: widget.controller,
                      cursorColor: Colors.black,
                      cursorHeight: 20,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            const EdgeInsets.only(bottom: 10, left: 10),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.black)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        errorStyle: const TextStyle(fontSize: 0.01),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            style: BorderStyle.solid,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.7), width: 0.8),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            see ? Icons.visibility_off : Icons.visibility,
                            color: Colors.black,
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              see = !see;
                            });
                          },
                        ),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      obscureText: see,
                    ),
                  ),
                ),
              ),
            ]));
  }
}

Container descFeild(
  String name,
  TextEditingController controller, {
  int maxLines = 1,
  isEmail = false,
}) {
  return Container(
    margin: const EdgeInsets.only(left: 24, right: 24, top: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 16, color: Color(0xFF858597)),
        ),
        const SizedBox(height: 5),
        Form(
          autovalidateMode: AutovalidateMode.always,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 9,
                      spreadRadius: 4,
                      offset: const Offset(3, 5))
                ]),
            child: TextFormField(
              controller: controller,
              maxLines: maxLines,
              cursorColor: Colors.black,
              cursorHeight: 20,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  errorStyle: const TextStyle(fontSize: 0.01),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      style: BorderStyle.solid,
                    ),
                  ),
                  contentPadding: const EdgeInsets.only(bottom: 10, left: 10),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.7), width: 0.8)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.7), width: 0.8)),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.7), width: 0.8),
                  )),
            ),
          ),
        ),
      ],
    ),
  );
}

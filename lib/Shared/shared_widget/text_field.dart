import 'package:bus_booking/Shared/shared_widget/text_field.dart';
import 'package:flutter/material.dart';
enum Secure{password,text}
class Readyfield {
  String? Function(String?)? validateFun;
  Key? key;
  Secure secure;
  bool border;
  bool isSecure;
  final String lableText;
  final String hintText;
  final Widget? prefix;
  TextInputType keyboard;
  TextEditingController? controller ;
  Readyfield(
      {this.validateFun,
         this.key,
        this.secure=Secure.text,
        this.border=true,
        this.isSecure=false,
        this.controller,
        this.hintText = "",
      this.lableText = "",
      this.prefix,
    
      this.keyboard = TextInputType.name});
}

class ReadyFormField extends StatefulWidget {
  final Readyfield ready;
  const ReadyFormField(this.ready, {super.key});

  @override
  State<ReadyFormField> createState() => _ReadyFormFieldState();
}

class _ReadyFormFieldState extends State<ReadyFormField> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: TextFormField(
        validator:widget.ready.validateFun,
        // validator: (value) {
        //   if(value!.isEmpty){
        //     return "this Field Required";
        //   }
        // },
        controller: widget.ready.controller,
        decoration: InputDecoration(
          
          border:widget.ready.border? readyBorder(Colors.black): InputBorder.none,
          disabledBorder: readyBorder(Colors.grey),
          enabledBorder: widget.ready.border? readyBorder(Colors.blue): InputBorder.none,
          errorBorder: widget.ready.border? readyBorder(Colors.red): InputBorder.none,
          focusColor: Colors.blue,
          hintText: widget.ready.hintText,
          hintStyle: TextStyle(color: Colors.white,),
          prefixIcon: widget.ready.prefix,
          suffixIcon: widget.ready.secure==Secure.password? IconButton(onPressed: (){setState(() {
            widget.ready.isSecure=!widget.ready.isSecure;
          });}, icon: Icon(Icons.remove_red_eye)):SizedBox(),
        ),
        keyboardType: widget.ready.keyboard,
        obscureText: widget.ready.isSecure,
      ),
    );
  }
}

OutlineInputBorder readyBorder(Color clour) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: clour,
      ));
}

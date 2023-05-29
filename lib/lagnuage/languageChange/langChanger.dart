


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:numeris/lagnuage/german.dart';
import 'package:numeris/lagnuage/english.dart';
class LanguageChange extends StatefulWidget {

  @override
  State<LanguageChange> createState() => _LanguageChangeState();
}

class _LanguageChangeState extends State<LanguageChange> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lng=TranslationPage().getCurrentLang();
  }
  String? lng;
  @override
  Widget build(BuildContext context) {

    return  DropdownButton<String>(
      menuMaxHeight: Get.size.height*0.35,

      value: this.lng,
      underline: Container(),
      isExpanded: false,
      onChanged: (newVal){
        setState((){
          this.lng=newVal!;
          TranslationPage().changeLocale(newVal);
        });
      },
      items: TranslationPage.langs.map(( value) {
        // items: langs.map((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Row(
            children: [
              // Image.asset(countryImage[2],width: 35,height: 35,),
              Text(value),
            ],
          ),
        );
      }).toList(),
    );
  
  }
}


class TranslationPage extends Translations{
  static final local =Locale('en','US');
  static final fallbacklocale=Locale('en','US');


static final langs=  [
'English','German'];

  static final locales=[
   
    Locale('en','US'), // english
    Locale('de','DE'), // german
  
  ];
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
   
    // english
    'en_US':en,
    // german
    'de_DE':german,
   
  };

  void changeLocale(String lang){
    final locale=getLocaleFromLagnuage(lang);
    final box=GetStorage(); 
    box.write('lng', lang); 
    Get.updateLocale(locale!);
  }
  Locale? getLocaleFromLagnuage(String lang){
    for(int i =0; i < langs.length; i++){
      if(lang==langs[i]) return locales[i];
    }
    return Get.locale;
  }
  // yd nichd language ko save karta h
  Locale? getCurrentLocale(){
    final box=GetStorage();
    Locale? defaultLocale;
    if(box.read('lng')!=null){
      final locale=getLocaleFromLagnuage(box.read('lng'));

      defaultLocale=locale;

    }else{
      defaultLocale=Locale('en','US');
    }
    return defaultLocale;
  }
  // save karta he language
  String getCurrentLang(){
    final box =GetStorage();
    return box.read('lng')!=null?box.read('lng'):'English';
  }

}
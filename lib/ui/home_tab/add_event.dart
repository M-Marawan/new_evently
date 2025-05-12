// import 'dart:math';
//
// import 'package:evently/firebase/fireStore.dart';
// import 'package:evently/models/event_model.dart';
// import 'package:evently/providers/event_provider.dart';
// import 'package:evently/providers/theme_provider.dart';
// import 'package:evently/ui/custom_button.dart';
// import 'package:evently/ui/custom_text_field.dart';
// import 'package:evently/ui/home_tab/tab_container.dart';
// import 'package:evently/utils/app_assets.dart';
// import 'package:evently/utils/app_colors.dart';
// import 'package:evently/utils/app_styles.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:icons_plus/icons_plus.dart';
import '../../providers/theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:provider/provider.dart';
//
// import '../../providers/event_provider.dart';
import '../../providers/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'tab_container.dart' ;
import '../../firebase/fireStore.dart';
import '../../models/event_model.dart';
import '../../providers/event_provider.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../custom_button.dart';
import '../custom_text_field.dart';

class AddEvent extends StatefulWidget {
  static const String routeName = 'add_event';

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  int Index =  0 ;
  String eventDate = "" ;
  String eventTime = "" ;
  String title = "" ;
  String description = "" ;
  DateTime? date ;
  TextEditingController titleEditingController = TextEditingController() ;
  TextEditingController descriptionEditingController = TextEditingController() ;

  var formKey = GlobalKey<FormState>() ;
    List<Icon> tabIcons = [
  Icon(Clarity.compass_line),
  Icon( Icons.directions_bike_outlined ) ,
  Icon(Iconsax.cake_bold),
  Icon(Iconsax.cake_bold),
  Icon(Iconsax.cake_bold),
  Icon(Iconsax.cake_bold),
  Icon(Iconsax.cake_bold),
  Icon(Iconsax.cake_bold),
  Icon(Iconsax.cake_bold),
  Icon(Iconsax.cake_bold),


   
];
static const List<String> eventsImages = [
    AppAssets.oc01,
    AppAssets.oc02,
    AppAssets.oc09,
    AppAssets.oc07,
    AppAssets.oc08,
    AppAssets.oc03,
    AppAssets.oc05,
    AppAssets.oc10,
    AppAssets.oc04,
  ];
  @override
  Widget build(BuildContext context) {
     var width = MediaQuery.of(context).size.width;
     var height = MediaQuery.of(context).size.height ;
     var event_provider = Provider.of<eventProvider>(context) ;
     final args = ModalRoute.of(context)!.settings.arguments as dynamic ;

      List<String> tabs = [
     AppLocalizations.of(context)!.sport, AppLocalizations.of(context)!.birthday, AppLocalizations.of(context)!.meeting,AppLocalizations.of(context)!.gaming, AppLocalizations.of(context)!.eating, AppLocalizations.of(context)!.holiday, AppLocalizations.of(context)!.exhibition, AppLocalizations.of(context)!.work_shop , AppLocalizations.of(context)!.book_club
  ] ;
    return args == null ?
    Scaffold(
      appBar: AppBar(
        title: Text('Create Event' , style: AppStyles.titleLarge ,),
        centerTitle: true,
        backgroundColor:Theme.of(context).scaffoldBackgroundColor,

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0 , right: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.01),
              Container(
                height: height * 0.25,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(width: 1),
                  image: DecorationImage(
                    image: AssetImage(eventsImages[Index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              DefaultTabController(
                length: tabs.length,
                child: TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  dividerHeight: 0,
                  labelPadding: EdgeInsets.symmetric(horizontal: 8),
                  indicator: BoxDecoration(),
                  onTap: (value) {
                    Index = value;
                    setState(() {});
                  },
                  tabs: tabs.asMap().entries.map((entry) {
                    int index = entry.key;
                    String eventName = entry.value;
                    return tab(
                      context: context,
                      selectedIndex: Index,
                      name: eventName,
                      icon: tabIcons[index],
                      Index: index,
                      selectedBG: AppColors.mainColor,
                      unselectedBG: AppColors.transparent,
                      selectedText: AppColors.white,
                      unselectedText: AppColors.mainColor,
                      borderColor: AppColors.mainColor,
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 10),
              Form(
                  key: formKey ,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Title", style: AppStyles.inter500black16),
                      SizedBox(height: 10),
                      CustomTextField(hintText: "Event Title" ,
                        prefixIcon: ImageIcon(AssetImage(AppAssets.notIcon) ) ,
                        hintStyle: AppStyles.inter16Gray500 ,
                        controller: titleEditingController,
                        validator: (text){
                          if (text!.isEmpty) {
                            return "Please Enter Event Title" ;
                          }
                          return null ;
                        },
                      ),
                      SizedBox(height: 10),
                      Text("Description", style: AppStyles.inter500black16),
                      SizedBox(height: 10),
                      CustomTextField(hintText: "Event Description",
                        hintStyle: AppStyles.inter16Gray500 ,
                        maxlines: 4,
                        controller: descriptionEditingController,
                        validator: (text){
                          if (text!.isEmpty) {
                            return "Please Enter Event descreption" ;
                          }
                          return null ;
                        },
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.calendar_month_outlined ,),
                          SizedBox(width: 10),
                          Text( "Event Date" , style: AppStyles.inter500black16),
                          Spacer() ,
                          FormField<String>(

                            validator: (value) {
                              if (eventDate.isEmpty) {
                                return "Please choose a date";
                              }
                              return null;
                            },
                            builder: (field) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2100),
                                    ).then((value) {
                                      if (value != null) {
                                        eventDate = "${value.day}/${value.month}/${value.year}";
                                        date = value ;
                                        setState(() {
                                          field.didChange(eventDate);
                                        });
                                      }
                                    });
                                  },
                                  child: Text(
                                    eventDate.isEmpty ? "Choose Date" : eventDate,
                                    style: AppStyles.inter16PrimaryColor500,
                                  ),
                                ),
                                if (field.hasError)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0, top: 0),
                                    child: Text(
                                      field.errorText!,
                                      style: TextStyle(color: Colors.red, fontSize: 12),
                                    ),
                                  ),
                              ],
                            ),
                          ),


                        ],
                      ),

                      Row(
                        children: [
                          Icon(Icons.watch_later_outlined ,),
                          SizedBox(width: 10),
                          Text("Event Time", style: AppStyles.inter500black16),
                          Spacer() ,

                          FormField<String>(
                            validator: (value) {
                              if (eventDate.isEmpty) {
                                return "Please choose a time";
                              }
                              return null;
                            },
                            builder: (field) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value) {
                                      if (value != null) {
                                        eventTime = "${value.hour}:${value.minute}";
                                        setState(() {

                                        });
                                      }
                                    });
                                  },
                                  child: Text(eventTime=="" ?  "Choose Time" : eventTime , style: AppStyles.inter16PrimaryColor500),
                                ),
                                if (field.hasError)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0, top: 0),
                                    child: Text(
                                      field.errorText!,
                                      style: TextStyle(color: Colors.red, fontSize: 12),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ) ,
                      Text("Location", style: AppStyles.inter500black16),
                      SizedBox(height: 10),
                      Container(
                        height: height * 0.07,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color:  AppColors.white ,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(width: 1, color: AppColors.mainColor),

                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(AppAssets.icon_map, width: 50, height: 50),
                                SizedBox(width: 10),
                                Text("Choose Event Location", style: AppStyles.inter16PrimaryColor500),
                              ],
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_forward_ios_outlined, size: 15, color: AppColors.mainColor),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomButton(text: "Create Event", onPressed: (){

                        if(formKey.currentState!.validate()==true ){

                          Event event = Event(
                            image: eventsImages[Index],
                            title: titleEditingController.text,
                            description: descriptionEditingController.text,
                            eventName: tabs[Index],
                            dateTime: date! ,
                            time: eventTime,
                          );
                          Firestore.AddEventtoFireStore(event).timeout(Duration(milliseconds: 500),
                              onTimeout: (){

                                event_provider.gitAllEvents() ;
                                Navigator.pop(context);

                              }
                          ) ;

                        }
                      }, ),
                    ],
                  ))



            ],
          ),
        ),
      ),


    )
        :

    Scaffold(
      appBar: AppBar(
        title: Text('Edit Event' , style: AppStyles.titleLarge ,),
        centerTitle: true,
        backgroundColor:Theme.of(context).scaffoldBackgroundColor,

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0 , right: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.01),
              Container(
                height: height * 0.25,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(width: 1),
                  image: DecorationImage(
                    image: AssetImage(args.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              DefaultTabController(
                length: tabs.length,
                child: TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  dividerHeight: 0,
                  labelPadding: EdgeInsets.symmetric(horizontal: 8),
                  indicator: BoxDecoration(),
                  onTap: (value) {
                    Index = value;
                    setState(() {});
                  },
                  tabs: tabs.asMap().entries.map((entry) {
                    int index = entry.key;
                    String eventName = entry.value;
                    return tab(
                      context: context,
                      selectedIndex: Index,
                      name: eventName,
                      icon: tabIcons[index],
                      Index: index,
                      selectedBG: AppColors.mainColor,
                      unselectedBG: AppColors.transparent,
                      selectedText: AppColors.white,
                      unselectedText: AppColors.mainColor,
                      borderColor: AppColors.mainColor,
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 10),
              Form(
                  key: formKey ,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Title", style: AppStyles.inter500black16),
                      SizedBox(height: 10),
                      CustomTextField(hintText: "Event Title" ,
                        initialValue: args.title ,
                        prefixIcon: ImageIcon(AssetImage(AppAssets.notIcon) ) ,
                        hintStyle: AppStyles.inter16Gray500 ,
                        // controller: titleEditingController,
                        validator: (text){
                          if (text!.isEmpty) {
                            return "Please Enter Event Title" ;
                          }else {
                            title = text ;
                            return null ;
                          }

                        },
                      ),
                      SizedBox(height: 10),
                      Text("Description", style: AppStyles.inter500black16),
                      SizedBox(height: 10),
                      CustomTextField(hintText: "Event Description",
                        hintStyle: AppStyles.inter16Gray500 ,
                        maxlines: 4,
                        // controller: descriptionEditingController,
                        initialValue: args.description ,
                        validator: (text){
                          if (text!.isEmpty) {
                            return "Please Enter Event descreption" ;
                          }else {
                            description = text ;
                            return null ;
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.calendar_month_outlined ,),
                          SizedBox(width: 10),
                          Text( "Event Date" , style: AppStyles.inter500black16),
                          Spacer() ,
                          FormField<String>(

                            validator: (value) {
                              if (eventDate.isEmpty) {
                                return "Please choose a date";
                              }
                              return null;
                            },
                            builder: (field) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now() ,
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2100),
                                    ).then((value) {
                                      if (value != null) {
                                        eventDate = "${value.day}/${value.month}/${value.year}";
                                        date = value ;
                                        setState(() {
                                          field.didChange(eventDate);
                                        });
                                      }else{
                                        eventDate = args.dateTime.day.toString()+"/"+args.dateTime.month.toString()+"/"+args.dateTime.year.toString();
                                        date = args.dateTime ;
                                      }
                                    });
                                  },
                                  child: Text(
                                    // eventDate.isEmpty ? "Choose Date" : eventDate,
                                    args.dateTime.day.toString()+"/"+args.dateTime.month.toString()+"/"+args.dateTime.year.toString(),
                                    style: AppStyles.inter16PrimaryColor500,
                                  ),
                                ),
                                if (field.hasError)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0, top: 0),
                                    child: Text(
                                      field.errorText!,
                                      style: TextStyle(color: Colors.red, fontSize: 12),
                                    ),
                                  ),
                              ],
                            ),
                          ),


                        ],
                      ),

                      Row(
                        children: [
                          Icon(Icons.watch_later_outlined ,),
                          SizedBox(width: 10),
                          Text("Event Time", style: AppStyles.inter500black16),
                          Spacer() ,

                          FormField<String>(
                            validator: (value) {
                              if (eventDate.isEmpty) {
                                return "Please choose a time";
                              }
                              return null;
                            },
                            builder: (field) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now() ,
                                    ).then((value) {
                                      if (value != null) {
                                        eventTime = "${value.hour}:${value.minute}";
                                        setState(() {

                                        });
                                      }else{
                                        eventTime = args.time ;

                                      }
                                    });
                                  },
                                  child: Text(args.time , style: AppStyles.inter16PrimaryColor500),
                                ),
                                if (field.hasError)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0, top: 0),
                                    child: Text(
                                      field.errorText!,
                                      style: TextStyle(color: Colors.red, fontSize: 12),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ) ,
                      Text("Location", style: AppStyles.inter500black16),
                      SizedBox(height: 10),
                      Container(
                        height: height * 0.07,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color:  AppColors.white ,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(width: 1, color: AppColors.mainColor),

                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(AppAssets.icon_map, width: 50, height: 50),
                                SizedBox(width: 10),
                                Text("Choose Event Location", style: AppStyles.inter16PrimaryColor500),
                              ],
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_forward_ios_outlined, size: 15, color: AppColors.mainColor),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomButton(text: "Save changes at Event", onPressed: (){

                        if(formKey.currentState!.validate()==true ){

                          final updatedEvent = Event(
                            id: args.id,
                            image: args.image,
                            title: title,
                            description: description,
                            eventName: tabs[Index],
                            dateTime: date! ,
                            time: eventTime,
                            isFavorite: args.isFavorite,
                          );

                          Firestore.updateEvent(updatedEvent).then((_) {
                            event_provider.getFilterdEvents();
                            Navigator.pop(context);
                          }).catchError((e) {
                            print("Error updating event: $e");
                          });

                        }
                      }, ),
                    ],
                  ))



            ],
          ),
        ),
      ),
        floatingActionButton: FloatingActionButton(
          child: Text("Delete" , style: AppStyles.inter16White500),
          backgroundColor: AppColors.red,
          onPressed: () {
            event_provider.deleteEvent(args) ;
            Navigator.pop(context);
            setState(() {

            });
          },
        )
      ,

    );

  }
}



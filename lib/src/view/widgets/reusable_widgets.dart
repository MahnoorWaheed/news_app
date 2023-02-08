 import 'package:flutter/material.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/app_color.dart';

GestureDetector reuableContainer(BuildContext context,
  {Widget? child, double? hgt, double? wtd,Color? clr, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
                  height:hgt?? 35,
                  width:wtd?? MediaQuery.of(context).size.width*0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                   color: clr??AppColor.lightgrey,
                  ),
                  child: child,
                  // child: Center(
                  //   child: smallText("Search")),
                ),
    );
  }

  Text smallText(String txt, {Color? clr,TextOverflow? overflow, int? max}) {
    return Text(txt,
                overflow: overflow??TextOverflow.ellipsis,
                maxLines: max,
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                  color: clr??AppColor.lightBlue,
                  fontSize: 12,
                  ),);
  }

  Text largeText(String txt, {Color? clr,double? size,TextOverflow? overflow, int? max}) {
    return Text(txt,
    overflow:overflow?? TextOverflow.ellipsis,
    maxLines: max??4,
                style: GoogleFonts.poppins(
                  color: clr??const Color(0xFF1E4088),
                   fontWeight: FontWeight.w600,
                   fontSize:size?? 15
                   ),);
  }
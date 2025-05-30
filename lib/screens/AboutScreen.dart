import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:taxi_driver/utils/Extensions/dataTypeExtensions.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/Colors.dart';
import '../../utils/Constants.dart';
import '../../utils/Extensions/app_common.dart';
import '../main.dart';
import '../model/SettingModel.dart';
import '../utils/Common.dart';
import '../utils/Images.dart';

class AboutScreen extends StatefulWidget {
  final SettingModel settingModel;

  AboutScreen({required this.settingModel});

  @override
  AboutScreenState createState() => AboutScreenState();
}

class AboutScreenState extends State<AboutScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    log(widget.settingModel.toJson());
    return Scaffold(
      appBar: AppBar(
        title: Text(language.aboutUs, style: boldTextStyle(color: appTextPrimaryColorWhite)),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ic_taxi_logo, height: 150, width: 150, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(mAppName, style: primaryTextStyle(size: 20)),
            SizedBox(height: 8),
            FutureBuilder<PackageInfo>(
              future: PackageInfo.fromPlatform(),
              builder: (_, snap) {
                if (snap.hasData) {
                  return Text('v${snap.data!.version}', style: secondaryTextStyle());
                }
                return SizedBox();
              },
            ),
            SizedBox(height: 16),
            Text(widget.settingModel.siteDescription.validate(), style: secondaryTextStyle(), maxLines: 6, overflow: TextOverflow.visible),
          ],
        ),
      ),
      bottomNavigationBar: widget.settingModel.instagramUrl != null ||
              widget.settingModel.facebookUrl != null ||
              widget.settingModel.linkedinUrl != null ||
              widget.settingModel.twitterUrl != null ||
              widget.settingModel.contactNumber != null
          ? Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                height: 120,
                child: Column(
                  children: [
                    Text(language.lblFollowUs, style: boldTextStyle()),
                    SizedBox(height: 8),
                    Wrap(
                      children: <Widget>[
                        if (widget.settingModel.instagramUrl != null && widget.settingModel.instagramUrl!.isNotEmpty)
                          inkWellWidget(
                            onTap: () {
                              if (widget.settingModel.instagramUrl != null && widget.settingModel.instagramUrl!.isNotEmpty) {
                                launchUrl(Uri.parse(widget.settingModel.instagramUrl.validate()), mode: LaunchMode.externalApplication);
                              } else {
                                toast(language.txtURLEmpty);
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Image.asset(ic_insta_logo, height: 28, width: 28),
                            ),
                          ),
                        if (widget.settingModel.twitterUrl != null && widget.settingModel.twitterUrl!.isNotEmpty)
                          inkWellWidget(
                            onTap: () {
                              if (widget.settingModel.twitterUrl != null && widget.settingModel.twitterUrl!.isNotEmpty) {
                                launchUrl(Uri.parse(widget.settingModel.twitterUrl.validate()), mode: LaunchMode.externalApplication);
                              } else {
                                toast(language.txtURLEmpty);
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Image.asset(ic_twitter_logo, height: 28, width: 28),
                            ),
                          ),
                        if (widget.settingModel.linkedinUrl != null && widget.settingModel.linkedinUrl!.isNotEmpty)
                          inkWellWidget(
                            onTap: () {
                              if (widget.settingModel.linkedinUrl != null && widget.settingModel.linkedinUrl!.isNotEmpty) {
                                launchUrl(Uri.parse(widget.settingModel.linkedinUrl.validate()), mode: LaunchMode.externalApplication);
                              } else {
                                toast(language.txtURLEmpty);
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Image.asset(ic_linked_logo, height: 28, width: 28),
                            ),
                          ),
                        if (widget.settingModel.facebookUrl != null && widget.settingModel.facebookUrl!.isNotEmpty)
                          inkWellWidget(
                            onTap: () {
                              if (widget.settingModel.facebookUrl != null && widget.settingModel.facebookUrl!.isNotEmpty) {
                                launchUrl(Uri.parse(widget.settingModel.facebookUrl.validate()), mode: LaunchMode.externalApplication);
                              } else {
                                toast(language.txtURLEmpty);
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Image.asset(ic_facebook_logo, height: 28, width: 28),
                            ),
                          ),
                        if (widget.settingModel.contactNumber != null && widget.settingModel.contactNumber!.isNotEmpty)
                          inkWellWidget(
                            onTap: () {
                              if (widget.settingModel.contactNumber != null && widget.settingModel.contactNumber!.isNotEmpty) {
                                launchUrl(Uri.parse('tel:${widget.settingModel.contactNumber}'), mode: LaunchMode.externalApplication);
                              } else {
                                toast(language.txtURLEmpty);
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 16),
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                Icons.call,
                                color: appStore.isDarkMode ? Colors.white : primaryColor,
                                size: 36,
                              ),
                            ),
                          )
                      ],
                    ),
                    SizedBox(height: 8),
                    if (widget.settingModel.siteCopyright != null && widget.settingModel.siteCopyright!.isNotEmpty)
                      Text(widget.settingModel.siteCopyright.validate(), style: secondaryTextStyle(), maxLines: 1)
                  ],
                ),
              ),
            )
          : SizedBox(),
    );
  }
}

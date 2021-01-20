#!/sbin/sh

###
### Note
### 0. when you update system apps, they 'move' to under /data/app/ - which this script does not handle. you can reset those apps (remove the updates and their data) so they'll 'be back' in under /system/app/ (or /system/priv-app/ etc..).  
### 0. to freeze apps afterwards, try to get 'Root Uninstaller' (com.rootuninstaller or com.rootuninstaller.pro) by anttek.com .  
### 1. do not remove 'Velvet' ("Google app" com.google.android.googlequicksearchbox) it causes boot-loops (as noted in one of the blogs online), but after you remove its widget you CAN freeze it, it isn't a needed componenet, just a search-widget.  
### 2. do not remove 'Flipboard' (permanent widget in home pages), for the same reason not to remove 'Velvet' (Google app), it is default widget, after you'll remove it from the home-screens, you may freeze it.  
### 3. 'StoryAlbum' might cause issues due to shared libs, but you can freeze it.  
### 4. SamsungLink has two components dubbed 'samsung link platform services' the one that is  'SCONE_Android_ProxyService_Lib' ("com.sec.msc.nts.android.proxy") - I look into how safe it is to remove (I currently just freeze it on my device). the ones starting with samsunglink* are safe to remove though.  
### 5. Peel is WatchOn app.  
### 6. S_Translator is a really bad samsung translator that supports limited amount of languages, you can download Google Translate instead.  
### 7. dropbox may be useful but for me it is just bloatware, although if you register it from the startup app you'll get 50GB for 2years, so I've backup it in here: https://github.com/eladkarako/icompile/releases/download/latest/dropbox_and_dropboxoobe_from_i9500_android501__put_under__system_app__deodexed_get_50gb_for_2_years.7z  
### 8. SHealth (app and services) take a lot of CPU and potentially background tracking your movements, removed but backup in here: https://github.com/eladkarako/icompile/releases/download/latest/SHealth35_and_HealthService_from_i9500_android501__put_under__system_priv-app__deodexed.7z  
### 9. ANT+ is wireless radio interaction with health-related monitors, probably the most useless services and app you'll have on your phone. almost no one uses that (and most of the time you can use bluetooth instead). There are several apps and background services 'AntHalService', 'ANTPlusPlugins', 'ANTPlusTest', 'ANTRadioService' - and if you'll update them they will move to under /data/app/  
### 10. uninstalling 'SmartManager_OSUP' and 'SmartManagerSDK_OSUP' ('rm -fr /system/priv-app/SmartManager*' - currently removed) is not advisable, it controls apps and prevent them running in the background as much as they would like to. removing it can make your CPU be VERY high, beacuse one of its jobs is to close down apps in the background after some time. when you have data-sync on, chrome, gmail, firefox, whatsapp and whatever services you've installed will start every now and again to sync the data, they often keep running in the background. But 'SmartManager_OSUP' really slows down the device after few days of run.  The solution is to do two things first install 'Android Assistant' (v23.29 build 119 is fine), and use its startup-manager to auto-close applications, it can allow you to quick kill apps. second is to use the button for 'last apps' and clear the list after you've done with the apps. third is to enable (if not already enabled) the developer options and set limit background processess to 4 or less (see near the bottom). it is a good alternative to the smartmanager service, that will not slow down your phone. and will allow SIM/settings/google play store operate safely in the background plus as many apps you need to run in front-end. I've backup it in here: https://github.com/eladkarako/icompile/releases/download/latest/SmartManager_OSUP__and__SmartManagerSDK_OSUP__from_i9500_android501__put_under__system_priv-app__deodexed.7z  
### 11. I'll avoid remove Google-Maps '/system/app/Maps*', since it does not removed cleanly, and installing new version has problems with installing the maps. weird, but just to be sure, I've reverting the change, and returning the backed-up apk (and jar I've manually removed later - you can ignore it) and testing if it is related. I'm might not be related and just part of the my set-up on the device... anyway here is the backup: https://github.com/eladkarako/icompile/releases/download/latest/Maps_from_i9500_android5.01__several_folders_under_system__system-apk_system-framework__make_all_777_and_user-group_root_0__clear_cache_and_dalvik_cache.7z  
### 12. I was able to install newer version 9.8.4 (but no newer) on Samsung S4. I found out that newer versions use 'split APK' and have problem downloading the maps, but there was no error with uninstalling MAPS actually... Also, there was a library that could be deleted at '/system/framework/com.google.android.maps.jar'
### 13. I found out the bloatware usually also have files in '/system/framework' and '/system/lib'
###

###BLOAT (related files)
rm -fr /system/media/video/AndroidInSpace*mp4
rm -fr /system/media/video/Sunset*mp4
rm -fr /system/lib/libgames_rtmp_jni.so
rm -fr /system/lib/libSwypeCore.so
rm -fr /system/lib/libvideochat_jni.so
rm -fr /system/recovery-from-boot.p
rm -fr /system/etc/install-recovery.cfg
rm -fr /system/etc/recovery-resource.dat


###BLOAT (apps)
rm -fr /system/app/aaIgnite*
rm -fr /system/app/ATTSmartWiFi*
rm -fr /system/app/BatteryTracer*
rm -fr /system/app/BoostZone*
rm -fr /system/app/Bug2Go*
rm -fr /system/app/CangjieQwertyPack*
rm -fr /system/app/ChsHandWritePack*
rm -fr /system/app/ChsPack*
rm -fr /system/app/ChtPack*
rm -fr /system/app/CityID*
rm -fr /system/app/CloudPrint*
rm -fr /system/app/com.mobitv.client.tv*
rm -fr /system/app/ConnectionsOptimizer*
rm -fr /system/app/Cricket-Connect*
rm -fr /system/app/CricketLauncher_MyAccount*
rm -fr /system/app/DigitalLocker*
rm -fr /system/app/EditorsDocs*
rm -fr /system/app/Evernote*
rm -fr /system/app/Famigo*
rm -fr /system/app/FeaturedApps*
rm -fr /system/app/FrenchPack*
rm -fr /system/app/GadgetGuardian*
rm -fr /system/app/IPLog*
rm -fr /system/app/IQDataUploadReport*
rm -fr /system/app/iWnnIME*
rm -fr /system/app/KoreanIME*
rm -fr /system/app/Magazines*
rm -fr /system/app/Mi-EasyAccess*
rm -fr /system/app/MobileZone*
rm -fr /system/app/MuveLauncher-release*
rm -fr /system/app/Navigator*
rm -fr /system/app/Newsstand*
rm -fr /system/app/NotesPad*
rm -fr /system/app/NoteWidget*
rm -fr /system/app/Peel_*
rm -fr /system/app/Plants_Vs_Zombies*
rm -fr /system/app/PlayGames*
rm -fr /system/app/PlusOne*
rm -fr /system/app/RealRacing*
rm -fr /system/app/Shop*
rm -fr /system/app/Shopmusic*
rm -fr /system/app/slackerradio*
rm -fr /system/app/SpanishPack*
rm -fr /system/app/SPR_Skyfire_*
rm -fr /system/app/SprintID*
rm -fr /system/app/SprintInstaller*
rm -fr /system/app/SprintZone*
rm -fr /system/app/StoryAlbum*
rm -fr /system/app/Swype*
rm -fr /system/app/Timer*
rm -fr /system/app/TouchPal*
rm -fr /system/app/WhatsApp*
rm -fr /system/app/WiFiShare*
rm -fr /system/app/WorldTime*
rm -fr /system/app/xtra_t_app*
rm -fr /system/app/YPmobile*
rm -fr /system/app/ZteNote*
rm -fr /system/partner-app/Cricket411*
rm -fr /system/partner-app/Cricket_MyBackup*
rm -fr /system/partner-app/CricketMoviusProdHTTPS*
rm -fr /system/partner-app/cricketnav*
rm -fr /system/partner-app/GameloftHub*
rm -fr /system/partner-app/MyMizmo*
rm -fr /system/partner-app/wifi*
rm -fr /system/priv-app/BodyGuardApp*
rm -fr /system/priv-app/DemoMode*
rm -fr /system/priv-app/DogfoodSurvey*
rm -fr /system/priv-app/DriveActivator*
rm -fr /system/priv-app/fswriter*
rm -fr /system/priv-app/GuideMe*
rm -fr /system/priv-app/LGBrowser*
rm -fr /system/priv-app/LGEmail*
rm -fr /system/priv-app/LGMemo*
rm -fr /system/priv-app/LGQMemo*
rm -fr /system/priv-app/LGTasks*
rm -fr /system/priv-app/Moodles*
rm -fr /system/priv-app/MotoAssist*
rm -fr /system/priv-app/MotoCare*
rm -fr /system/priv-app/SamsungLink*
rm -fr /system/priv-app/SecureFolder*
rm -fr /system/priv-app/Sprint_Installer*
rm -fr /system/priv-app/SprintID*
rm -fr /system/priv-app/SprintInstaller*
rm -fr /system/priv-app/SprintZone*
rm -fr /system/priv-app/StoryAlbum*
rm -fr /system/priv-app/Word_Samsung*
rm -fr /system/priv-app/Zone-Sprint*
rm -fr /system/priv-app/ZteBrowser*


#--------------------------------------------------------------###BLOAT - detailed

#--------------------------------Google not-needed "extra" keyboards, will not uninstall normal keyboard.
rm -fr /system/app/GoogleHindiIME*
rm -fr /system/app/GooglePinyinIME*
rm -fr /system/app/GoogleJapanIME*
###rm -fr /data/app/com.google.android.inputmethod.cantonese*
###rm -fr /data/app/com.google.android.apps.inputmethod.cantonese*
###rm -fr /data/app/com.google.android.inputmethod.zhuyin*
###rm -fr /data/app/com.google.android.apps.inputmethod.zhuyin*
###rm -fr /data/app/com.google.android.apps.inputmethod.pinyin*
###rm -fr /data/app/com.google.android.inputmethod.pinyin*
###rm -fr /data/app/com.google.android.apps.inputmethod.hindi*
###rm -fr /data/app/com.google.android.apps.inputmethod.japanese*
###rm -fr /data/app/com.google.android.apps.inputmethod.korean*
###rm -fr /data/app/com.google.android.inputmethod.hindi*
###rm -fr /data/app/com.google.android.inputmethod.japanese*
###rm -fr /data/app/com.google.android.inputmethod.korean*

#--------------------------------Samsung Game/Hub
rm -fr /system/app/SamsungGame*
rm -fr /system/app/SamsungHub*
###rm -fr /data/app/com.sec.android.app.gamehub*
###rm -fr /data/app/com.sec.everglades*


#--------------------------------Samsung Travel Widget (background service and widget that downloads and replace background of tourist-sites around the world) - best to be removed after you've made sure the widget is not active on one of the 'home-pages'.
rm -fr /system/app/TravelService*
rm -fr /system/app/TravelWidget*
###rm -fr /data/app/com.samsung.android.service.travel*
###rm -fr /data/app/com.samsung.android.tripwidget*

#--------------------------------TripAdvisor
rm -fr /system/app/TripAdvisor*
###rm -fr /data/app/com.tripadvisor*

#--------------------------------YouTube
rm -fr /system/app/YouTube*
###rm -fr /data/app/com.google.android.youtube*
###rm -fr /data/app/com.google.android.apps.youtube*


#--------------------------------Google Drive (used to be called 'Google Docs' in very old versions, not to be confused with current 'Google Docs')
rm -fr /system/app/Drive*
rm -fr /system/app/GoogleDrive*
###rm -fr /data/app/com.google.android.apps.docs*

#--------------------------------Google Chrome
rm -fr /system/app/Chrome*
rm -fr /system/app/ChromeWithBrowser*
###rm -fr /data/app/com.chrome*
###rm -fr /data/app/com.android.chrome*


#--------------------------------Google Books
rm -fr /system/app/Books*
###rm -fr /data/app/com.google.android.apps.books*


#--------------------------------Samsung ChatOn
rm -fr /system/app/ChatON*
###rm -fr /data/app/com.coolots.chaton*
###rm -fr /data/app/com.sec.chaton*

#--------------------------------Google Talk/Hangouts
rm -fr /system/app/Hangouts*
###rm -fr /data/app/com.google.android.talk*

#--------------------------------Google News / 'Google News and Weather'
rm -fr /system/priv-app/GoogleNews*
###rm -fr /data/app/com.google.android.apps.magazines*
###rm -fr /data/app/com.google.android.apps.genie.geniewidget*

#--------------------------------Google Translate
rm -fr /system/app/Translate*
###rm -fr /data/app/com.google.android.apps.translate*

#--------------------------------Yahoo News/Stock
rm -fr /system/app/YahooNews*
rm -fr /system/app/YahooStocks*
###rm -fr /data/app/com.yahoo*
###rm -fr /data/app/com.sec.android.widgetapp.ap.yahoonews*
###rm -fr /data/app/com.sec.android.widgetapp.ap.yahoostock*

#--------------------------------Office
rm -fr /system/app/moffice*
rm -fr /system/partner-app/moffice*
rm -fr /system/priv-app/PowerPoint*
rm -fr /system/app/OfficeSuite*
###rm -fr /data/app/com.mobisystems.office*
rm -fr /system/app/PolarisViewer*
###rm -fr /data/app/com.infraware.docmaster*
###rm -fr /data/app/com.infraware.office*
###rm -fr /data/app/com.infraware.polaris*
rm -fr /system/app/Quickoffice*
###rm -fr /data/app/com.qo.android.htc*
###rm -fr /data/app/com.quickoffice.android*

#--------------------------------Google TalkBack
rm -fr /system/app/talkback*
###rm -fr /data/app/com.google.android.marvin.talkback*

#--------------------------------Skype
rm -fr /system/app/MSSkype*
###rm -fr /data/app/com.skype*

#--------------------------------Google Wallet/Pay
rm -fr /system/priv-app/Wallet*
rm -fr /system/priv-app/GooglePay*
###rm -fr /data/app/com.google.android.apps.wallet*
###rm -fr /data/app/com.google.android.apps.nbu.paisa.user*
###rm -fr /data/app/com.google.android.apps.gmoney*

#--------------------------------Samsung Wallet/Pay/Billing
rm -fr /system/priv-app/SamsungBilling*
rm -fr /system/app/SamsungWallet*
rm -fr /system/priv-app/SamsungWallet*
rm -fr /system/priv-app/SamsungPay*
###rm -fr /data/app/com.sec.android.wallet*
###rm -fr /data/app/com.sec.android.app.billing*
###rm -fr /data/app/com.samsung.android.spay*
###rm -fr /data/app/com.samsung.android.samsungpay*

#--------------------------------Samsung Apps
rm -fr /system/app/SamsungApps*
rm -fr /system/priv-app/SamsungApps*
###rm -fr /data/app/com.sec.android.widget.samsungapps*
###rm -fr /data/app/com.sec.android.app.samsungapps*

#--------------------------------Samsung Translate
rm -fr /system/app/S_Translat*
###rm -fr /data/app/com.sec.android.app.translator*

#--------------------------------Twitter
rm -fr /system/app/Twitter*
rm -fr /system/partner-app/Twitter*
###rm -fr /data/app/com.twitter*

#--------------------------------Instagram
rm -fr /system/app/Instagram*
rm -fr /system/app/FBInstagram*
###rm -fr /data/app/com.instagram.android*

#--------------------------------Facebook
rm -fr /system/app/facebook*
rm -fr /system/app/Facebook*
rm -fr /system/priv-app/FBInstaller*
rm -fr /system/app/FBAppManager*
rm -fr /system/partner-app/facebook*
rm -fr /system/partner-app/Facebook*
###rm -fr /data/app/com.facebook*

#--------------------------------PayPal
rm -fr /system/app/Paypal*
rm -fr /system/app/PayWithPaypal*
rm -fr /system/priv-app/Paypal*
rm -fr /system/priv-app/PayWithPaypal*
###rm -fr /data/app/com.sec.android.stub.paywithpaypal*
###rm -fr /data/app/com.paypal*

#--------------------------------Samsung Health
rm -fr /system/priv-app/HealthService*
rm -fr /system/priv-app/SHealth*
###rm -fr /data/app/com.sec.android.service.health*
###rm -fr /data/app/com.sec.android.app.shealth*

#--------------------------------Ant+ (Sport Radio Connection)
rm -fr /system/app/AntHal*
rm -fr /system/app/ANTPlus*
rm -fr /system/app/ANTRadio*
rm -fr /system/framework/com.dsi.ant.antradio*
###rm -fr /data/app/com.dsi.ant.server*
###rm -fr /data/app/com.dsi.ant.plugins*
###rm -fr /data/app/com.dsi.ant.sample*

#--------------------------------Google Maps
rm -fr /system/app/Maps*
rm -fr /system/framework/com.google.android.maps*
###rm -fr /data/app/com.google.android.apps.maps*

#--------------------------------DropBox
rm -fr /system/app/Dropbox*
rm -fr /system/framework/com.dropbox*
rm -fr /system/lib/libDropbox*
###rm -fr /data/app/com.dropbox*
###rm -fr /data/app/com.sec.android.cloudagent.dropbox*
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
###

###BLOAT (related files)
###rm -fr /system/app/Email*
###rm -fr /system/app/Exchange*
###rm -fr /system/priv-app/Email*
###rm -fr /system/priv-app/Exchange*
rm -fr /oem/amazon
rm -fr /oem/app/Amazon*
rm -fr /oem/app/AudibleSprint
rm -fr /oem/app/Facebook*
rm -fr /oem/app/FcbkAppManagerSprint
rm -fr /oem/app/FcbkInstallerSprint
rm -fr /oem/app/InstagramStubSprint
rm -fr /oem/app/PrimePhotosSprint
rm -fr /oem/app/SprintZone
rm -fr /oem/priv-app/Amazon*
rm -fr /oem/priv-app/AudibleSprint
rm -fr /oem/priv-app/Facebook*
rm -fr /oem/priv-app/FcbkAppManagerSprint
rm -fr /oem/priv-app/FcbkInstallerSprint
rm -fr /oem/priv-app/InstagramStubSprint
rm -fr /oem/priv-app/PrimePhotosSprint
rm -fr /oem/priv-app/SprintZone
rm -fr /system/app/aaIgnite*
rm -fr /system/app/AntHal*
rm -fr /system/app/ANTPlus*
rm -fr /system/app/ANTRadio*
rm -fr /system/app/ATTSmartWiFi*
rm -fr /system/app/BatteryTracer*
rm -fr /system/app/BodyGuardApp*
rm -fr /system/app/Books*
rm -fr /system/app/BoostZone*
rm -fr /system/app/Bug2Go*
rm -fr /system/app/CangjieQwertyPack*
rm -fr /system/app/ChatON*
rm -fr /system/app/Chrome*
rm -fr /system/app/ChromeWithBrowser*
rm -fr /system/app/ChsHandWritePack*
rm -fr /system/app/ChsPack*
rm -fr /system/app/ChtPack*
rm -fr /system/app/CityID*
rm -fr /system/app/CloudPrint*
rm -fr /system/app/com.mobitv.client.tv*
rm -fr /system/app/ConnectionsOptimizer*
rm -fr /system/app/Cricket-Connect*
rm -fr /system/app/CricketLauncher_MyAccount*
rm -fr /system/app/DemoMode*
rm -fr /system/app/DigitalLocker*
rm -fr /system/app/DogfoodSurvey*
rm -fr /system/app/Drive*
rm -fr /system/app/DriveActivator*
rm -fr /system/app/DriveMode*
rm -fr /system/app/Dropbox*
rm -fr /system/app/EditorsDocs*
rm -fr /system/app/ELMAgent*
rm -fr /system/app/Evernote*
rm -fr /system/app/ExchangeZTE*
rm -fr /system/app/facebook*
rm -fr /system/app/Facebook*
rm -fr /system/app/Famigo*
rm -fr /system/app/FBAppManager*
rm -fr /system/app/FBInstagram*
rm -fr /system/app/FBInstaller*
rm -fr /system/app/FeaturedApps*
rm -fr /system/app/FotaClient*
rm -fr /system/app/FrenchPack*
rm -fr /system/app/fswriter*
rm -fr /system/app/GadgetGuardian*
rm -fr /system/app/Gmail*
rm -fr /system/app/GoogleDrive*
rm -fr /system/app/GoogleHindiIME*
rm -fr /system/app/GoogleJapanIME*
rm -fr /system/app/GoogleNews*
rm -fr /system/app/GooglePay*
rm -fr /system/app/GooglePinyinIME*
rm -fr /system/app/GuideMe*
rm -fr /system/app/Hangouts*
rm -fr /system/app/HealthService*
rm -fr /system/app/Instagram*
rm -fr /system/app/IPLog*
rm -fr /system/app/IQDataUploadReport*
rm -fr /system/app/iWnnIME*
rm -fr /system/app/Kies*
rm -fr /system/app/KoreanIME*
rm -fr /system/app/LGBrowser*
rm -fr /system/app/LGEmail*
rm -fr /system/app/LGMemo*
rm -fr /system/app/LGQMemo*
rm -fr /system/app/LGTasks*
rm -fr /system/app/LocalFOTA*
rm -fr /system/app/Magazines*
rm -fr /system/app/Maps*
rm -fr /system/app/Mi-EasyAccess*
rm -fr /system/app/MobilePrint*
rm -fr /system/app/MobileZone*
rm -fr /system/app/moffice*
rm -fr /system/app/Moodles*
rm -fr /system/app/MotoAssist*
rm -fr /system/app/MotoCare*
rm -fr /system/app/MSSkype*
rm -fr /system/app/Music2*
rm -fr /system/app/MuveLauncher-release*
rm -fr /system/app/Navigator*
rm -fr /system/app/Newsstand*
rm -fr /system/app/NotesPad*
rm -fr /system/app/NoteWidget*
rm -fr /system/app/OfficeSuite*
rm -fr /system/app/Paypal*
rm -fr /system/app/PayWithPaypal*
rm -fr /system/app/Peel_*
rm -fr /system/app/Plants_Vs_Zombies*
rm -fr /system/app/PlayGames*
rm -fr /system/app/PlusOne*
rm -fr /system/app/PolarisViewer*
rm -fr /system/app/PowerPoint*
rm -fr /system/app/Quickoffice*
rm -fr /system/app/RealRacing*
rm -fr /system/app/S_Translat*
rm -fr /system/app/SamsungApps*
rm -fr /system/app/SamsungBilling*
rm -fr /system/app/SamsungGame*
rm -fr /system/app/SamsungHub*
rm -fr /system/app/SamsungLink*
rm -fr /system/app/SamsungPay*
rm -fr /system/app/SamsungWallet*
rm -fr /system/app/SecureFolder*
rm -fr /system/app/SHealth*
rm -fr /system/app/Shop*
rm -fr /system/app/Shopmusic*
rm -fr /system/app/slackerradio*
rm -fr /system/app/SOAgent*
rm -fr /system/app/SpanishPack*
rm -fr /system/app/SPR_Skyfire_*
rm -fr /system/app/Sprint_Installer*
rm -fr /system/app/SprintID*
rm -fr /system/app/SprintInstaller*
rm -fr /system/app/SprintZone*
rm -fr /system/app/StoryAlbum*
rm -fr /system/app/Swype*
rm -fr /system/app/talkback*
rm -fr /system/app/Timer*
rm -fr /system/app/TouchPal*
rm -fr /system/app/Translate*
rm -fr /system/app/TravelService*
rm -fr /system/app/TravelWidget*
rm -fr /system/app/TripAdvisor*
rm -fr /system/app/Twitter*
rm -fr /system/app/Videos*
rm -fr /system/app/Wallet*
rm -fr /system/app/WhatsApp*
rm -fr /system/app/WiFiShare*
rm -fr /system/app/Word_Samsung*
rm -fr /system/app/WorldTime*
rm -fr /system/app/wssyncmlnps*
rm -fr /system/app/xtra_t_app*
rm -fr /system/app/YahooNews*
rm -fr /system/app/YahooStocks*
rm -fr /system/app/YouTube*
rm -fr /system/app/YPmobile*
rm -fr /system/app/Zone-Sprint*
rm -fr /system/app/ZteBrowser*
rm -fr /system/app/ZteNote*
rm -fr /system/etc/install-recovery.cfg
rm -fr /system/etc/recovery-resource.dat
rm -fr /system/framework/com.dropbox*
rm -fr /system/framework/com.dsi.ant.antradio*
rm -fr /system/framework/com.google.android.maps*
rm -fr /system/lib/libDropbox*
rm -fr /system/lib/libgames_rtmp_jni.so
rm -fr /system/lib/libSwypeCore.so
rm -fr /system/lib/libvideochat_jni.so
rm -fr /system/media/video/AndroidInSpace*mp4
rm -fr /system/media/video/Sunset*mp4
rm -fr /system/partner-app/Cricket411*
rm -fr /system/partner-app/Cricket_MyBackup*
rm -fr /system/partner-app/CricketMoviusProdHTTPS*
rm -fr /system/partner-app/cricketnav*
rm -fr /system/partner-app/facebook*
rm -fr /system/partner-app/Facebook*
rm -fr /system/partner-app/GameloftHub*
rm -fr /system/partner-app/moffice*
rm -fr /system/partner-app/MyMizmo*
rm -fr /system/partner-app/Twitter*
rm -fr /system/partner-app/wifi*
rm -fr /system/priv-app/aaIgnite*
rm -fr /system/priv-app/AntHal*
rm -fr /system/priv-app/ANTPlus*
rm -fr /system/priv-app/ANTRadio*
rm -fr /system/priv-app/ATTSmartWiFi*
rm -fr /system/priv-app/BatteryTracer*
rm -fr /system/priv-app/BodyGuardApp*
rm -fr /system/priv-app/Books*
rm -fr /system/priv-app/BoostZone*
rm -fr /system/priv-app/Bug2Go*
rm -fr /system/priv-app/CangjieQwertyPack*
rm -fr /system/priv-app/ChatON*
rm -fr /system/priv-app/Chrome*
rm -fr /system/priv-app/ChromeWithBrowser*
rm -fr /system/priv-app/ChsHandWritePack*
rm -fr /system/priv-app/ChsPack*
rm -fr /system/priv-app/ChtPack*
rm -fr /system/priv-app/CityID*
rm -fr /system/priv-app/CloudPrint*
rm -fr /system/priv-app/com.mobitv.client.tv*
rm -fr /system/priv-app/ConnectionsOptimizer*
rm -fr /system/priv-app/Cricket-Connect*
rm -fr /system/priv-app/CricketLauncher_MyAccount*
rm -fr /system/priv-app/DemoMode*
rm -fr /system/priv-app/DigitalLocker*
rm -fr /system/priv-app/DogfoodSurvey*
rm -fr /system/priv-app/Drive*
rm -fr /system/priv-app/DriveActivator*
rm -fr /system/priv-app/DriveMode*
rm -fr /system/priv-app/Dropbox*
rm -fr /system/priv-app/EditorsDocs*
rm -fr /system/priv-app/ELMAgent*
rm -fr /system/priv-app/Evernote*
rm -fr /system/priv-app/ExchangeZTE*
rm -fr /system/priv-app/facebook*
rm -fr /system/priv-app/Facebook*
rm -fr /system/priv-app/Famigo*
rm -fr /system/priv-app/FBAppManager*
rm -fr /system/priv-app/FBInstagram*
rm -fr /system/priv-app/FBInstaller*
rm -fr /system/priv-app/FeaturedApps*
rm -fr /system/priv-app/FotaClient*
rm -fr /system/priv-app/FrenchPack*
rm -fr /system/priv-app/fswriter*
rm -fr /system/priv-app/GadgetGuardian*
rm -fr /system/priv-app/Gmail*
rm -fr /system/priv-app/GoogleDrive*
rm -fr /system/priv-app/GoogleHindiIME*
rm -fr /system/priv-app/GoogleJapanIME*
rm -fr /system/priv-app/GoogleNews*
rm -fr /system/priv-app/GooglePay*
rm -fr /system/priv-app/GooglePinyinIME*
rm -fr /system/priv-app/GuideMe*
rm -fr /system/priv-app/Hangouts*
rm -fr /system/priv-app/HealthService*
rm -fr /system/priv-app/Instagram*
rm -fr /system/priv-app/IPLog*
rm -fr /system/priv-app/IQDataUploadReport*
rm -fr /system/priv-app/iWnnIME*
rm -fr /system/priv-app/Kies*
rm -fr /system/priv-app/KoreanIME*
rm -fr /system/priv-app/LGBrowser*
rm -fr /system/priv-app/LGEmail*
rm -fr /system/priv-app/LGMemo*
rm -fr /system/priv-app/LGQMemo*
rm -fr /system/priv-app/LGTasks*
rm -fr /system/priv-app/LocalFOTA*
rm -fr /system/priv-app/Magazines*
rm -fr /system/priv-app/Maps*
rm -fr /system/priv-app/Mi-EasyAccess*
rm -fr /system/priv-app/MobilePrint*
rm -fr /system/priv-app/MobileZone*
rm -fr /system/priv-app/moffice*
rm -fr /system/priv-app/Moodles*
rm -fr /system/priv-app/MotoAssist*
rm -fr /system/priv-app/MotoCare*
rm -fr /system/priv-app/MSSkype*
rm -fr /system/priv-app/Music2*
rm -fr /system/priv-app/MuveLauncher-release*
rm -fr /system/priv-app/Navigator*
rm -fr /system/priv-app/Newsstand*
rm -fr /system/priv-app/NotesPad*
rm -fr /system/priv-app/NoteWidget*
rm -fr /system/priv-app/OfficeSuite*
rm -fr /system/priv-app/Paypal*
rm -fr /system/priv-app/PayWithPaypal*
rm -fr /system/priv-app/Peel_*
rm -fr /system/priv-app/Plants_Vs_Zombies*
rm -fr /system/priv-app/PlayGames*
rm -fr /system/priv-app/PlusOne*
rm -fr /system/priv-app/PolarisViewer*
rm -fr /system/priv-app/PowerPoint*
rm -fr /system/priv-app/Quickoffice*
rm -fr /system/priv-app/RealRacing*
rm -fr /system/priv-app/S_Translat*
rm -fr /system/priv-app/SamsungApps*
rm -fr /system/priv-app/SamsungBilling*
rm -fr /system/priv-app/SamsungGame*
rm -fr /system/priv-app/SamsungHub*
rm -fr /system/priv-app/SamsungLink*
rm -fr /system/priv-app/SamsungPay*
rm -fr /system/priv-app/SamsungWallet*
rm -fr /system/priv-app/SecureFolder*
rm -fr /system/priv-app/SHealth*
rm -fr /system/priv-app/Shop*
rm -fr /system/priv-app/Shopmusic*
rm -fr /system/priv-app/slackerradio*
rm -fr /system/priv-app/SOAgent*
rm -fr /system/priv-app/SpanishPack*
rm -fr /system/priv-app/SPR_Skyfire_*
rm -fr /system/priv-app/Sprint_Installer*
rm -fr /system/priv-app/SprintID*
rm -fr /system/priv-app/SprintInstaller*
rm -fr /system/priv-app/SprintZone*
rm -fr /system/priv-app/StoryAlbum*
rm -fr /system/priv-app/Swype*
rm -fr /system/priv-app/talkback*
rm -fr /system/priv-app/Timer*
rm -fr /system/priv-app/TouchPal*
rm -fr /system/priv-app/Translate*
rm -fr /system/priv-app/TravelService*
rm -fr /system/priv-app/TravelWidget*
rm -fr /system/priv-app/TripAdvisor*
rm -fr /system/priv-app/Twitter*
rm -fr /system/priv-app/Videos*
rm -fr /system/priv-app/Wallet*
rm -fr /system/priv-app/WhatsApp*
rm -fr /system/priv-app/WiFiShare*
rm -fr /system/priv-app/Word_Samsung*
rm -fr /system/priv-app/WorldTime*
rm -fr /system/priv-app/wssyncmlnps*
rm -fr /system/priv-app/xtra_t_app*
rm -fr /system/priv-app/YahooNews*
rm -fr /system/priv-app/YahooStocks*
rm -fr /system/priv-app/YouTube*
rm -fr /system/priv-app/YPmobile*
rm -fr /system/priv-app/Zone-Sprint*
rm -fr /system/priv-app/ZteBrowser*
rm -fr /system/priv-app/ZteNote*
rm -fr /system/recovery-from-boot.p

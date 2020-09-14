<h1>debloat_deknox_by_eladkarako</h1>

An Edify script that is powered by temporary tools such as busybox and su (included),  
cleaning bad bloatwares and KNOX related apps, files, folders.  
  
Run ZIP from your custom recovery and make sure to clean cache and dalvik cache afterwards,  
you may optionally do factory reset.  
The first reboot will take some time due to the fact that packages were removed and the cache(s) are re-calculated.  


Note:
It is advised you modify default.prop (boot.img) and build.prop (/system) acording to  
https://gist.github.com/eladkarako/5694eada31277fdc75cee4043461372e#file-tweaked_default-prop  
(commenting-out/removing any already existing keys with different value),  
this will complete the KNOX and TIMA disabling process and allow some unrestricted usage,  
and set your linux to permissive.  

<hr/>

You can modify or "build" this thing yourself, it is very easy.  
or download the recent build from the https://github.com/eladkarako/debloat_deknox_by_eladkarako/releases  

To do it youself:  
download the content: https://github.com/eladkarako/debloat_deknox_by_eladkarako/archive/master.zip  
unzip, remove non-related files/folders (<code>README.md</code>, <code>.github</code>, <code>.gitattributes</code>),  
zip just the files, rename the file whatever you wish (no spaces, use underscores, keep it under 30 characters),  
optionally align the zip with <code>zipalign.exe -v 4 myarchive.zip myarchive_aligned.zip</code>
delete the old zip, rename the new aligned zip whatever you want, upload it over your sd-card,  
flash it with TWRP or any CUSTOM recovery.  

you don't need to sign it.

<hr/>

<br/>

<br/>

<h1><sub>and...</sub> <a href="https://paypal.me/e1adkarak0/5">just buy me a f*cking coffee already, it's 2AM! ☕︎</a></h1>

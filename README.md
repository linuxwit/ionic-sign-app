签名应用方法
==============
1.生成签名文件
keytool -genkey -alias android.keystore -keyalg RSA -validity 20000 -keystore android.keystore

2.编译生成发布版本
ionic build --release
cp platforms/android/ant-build/CordovaApp-release-unsigned.apk CordovaApp-release-unsigned.apk

3.对文件进行签名
/usr/lib/jvm/jdk1.6.0_45/bin/jarsigner -verbose -keystore android.keystore -signedjar yourappname.apk CordovaApp-release-unsigned.apk android.keystore
rm -rf CordovaApp-release-unsigned.apk

4.安装签名后的安装包
adb install yourappname.apk

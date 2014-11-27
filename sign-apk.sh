echo 'step 1:generate the key file'
keytool -genkey -alias android.keystore -keyalg RSA -validity 20000 -keystore android.keystore 
echo 'step 2:build the project in release mode'
ionic build --release
echo 'step 3:copy the file to current path'
cp platforms/android/ant-build/CordovaApp-release-unsigned.apk CordovaApp-release-unsigned.apk
echo 'step 4:sign the apk'
/usr/lib/jvm/jdk1.6.0_45/bin/jarsigner -verbose -keystore android.keystore -signedjar yourapp.apk  CordovaApp-release-unsigned.apk android.keystore
rm -rf CordovaApp-release-unsigned.apk
echo 'step 4:install the apk to your phone'
adb install yourapp.apk

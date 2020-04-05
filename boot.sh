# export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))

#
# Check if there is npm project
#
[ ! -f /code/app/package.json ] \
  && printf "\
    You have to init or clone project. See README\n" \
  && exit;

# cd /code/app/android
# ./gradlew build
# ./gradlew clean

adb connect ${DEVICE_IP}

CONNECTED_DEVICES="$(adb devices | awk '$2=="device"{print$1}' | wc -l)"
[ $CONNECTED_DEVICES = "0" ] \
  && printf "\
    No devices connected. \n\
    Check your device and accept popup with 'Always accept' option. \n\
    Then run container again.\n" \
  && exit;

cd /code/app
npx concurrently \
  --names "PACKAGE,RUN-ANDROID"\
  --prefix-colors "bgBlack.white,bgWhite.cyan"\
  "npm start" "npm run android"

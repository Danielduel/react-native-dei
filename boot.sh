# export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))

#
# Check if there is npm project
#
[ ! -f /code/app/package.json ] \
  && echo "You have to init or clone project. See README" \
  && exit;

# cd /code/app/android
# ./gradlew build
# ./gradlew clean

adb connect ${DEVICE_IP}
cd /code/app
npx concurrently \
  --names "PACKAGE,RUN-ANDROID"\
  --prefix-colors "bgBlack.white,bgWhite.cyan"\
  "npm start" "npm run android"

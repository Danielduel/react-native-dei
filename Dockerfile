FROM danielduel/react-native-dei-core:0.0.4

#
# Copy adb certificates from host OS
#
RUN mkdir -pm 0750 /root/.android
ADD certificates/adbkey /root/.android/adbkey
ADD certificates/adbkey.pub /root/.android/adbkey.pub

RUN yarn global add concurrently

#
# Copy boot sequence
#
ADD ./boot.sh /boot.sh

# Start the server by default
CMD ["sh", "/boot.sh"]

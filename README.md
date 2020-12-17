A Flutter plugin for iOS and Android for picking images from the image library, and taking new pictures with the camera, cropping the image and include it in a form field.

## Installation[](https://pub.dev/packages/image_picker_form_field#installation)

First, add  `image_picker_form_field`  as a  [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).


### iOS[](https://pub.dev/packages/image_picker_form_field#ios)

Add the following keys to your  _Info.plist_  file, located in  `<project root>/ios/Runner/Info.plist`:

-   `NSPhotoLibraryUsageDescription`  - describe why your app needs permission for the photo library. This is called  _Privacy - Photo Library Usage Description_  in the visual editor.
-   `NSCameraUsageDescription`  - describe why your app needs access to the camera. This is called  _Privacy - Camera Usage Description_  in the visual editor.
-   `NSMicrophoneUsageDescription`  - describe why your app needs access to the microphone, if you intend to record videos. This is called  _Privacy - Microphone Usage Description_  in the visual editor.

### Android[](https://pub.dev/packages/image_picker_form_field#android)

#### API 29+
-   Add UCropActivity into your AndroidManifest.xml
```xml
<activity
    android:name="com.yalantis.ucrop.UCropActivity"
    android:screenOrientation="portrait"
    android:theme="@style/Theme.AppCompat.Light.NoActionBar"/>
```

#### API < 29

Add  `android:requestLegacyExternalStorage="true"`  as an attribute to the  `<application>`  tag in AndroidManifest.xml. The  [attribute](https://developer.android.com/training/data-storage/compatibility)  is  `false`  by default on apps targeting Android Q.


### Example[](https://pub.dev/packages/image_picker#example)

```dart
ImagePickerFormField(  
  child: Container(  
    height: 40,  
  child: Center(child: Text("Select Photo")),  
  width: double.infinity,  
  decoration: BoxDecoration(  
        borderRadius: BorderRadius.all(Radius.circular(8)),  
  border: Border.all(  
            color: Theme.of(context).disabledColor, width: 1)),  
  ),  
  previewEnabled: true,  
  autovalidate: true,  
  context: context,  
  onSaved: (File value) {  
    print("on saved called");  
  },  
  validator: (File value) {  
    if (value == null)  
      return "Please select a photo!";  
 else return null;  },  
  initialValue: null, //File("some source")  
)
```
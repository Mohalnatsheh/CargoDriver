package io.flutter.plugins;

import androidx.annotation.Keep;
import androidx.annotation.NonNull;
import io.flutter.Log;

import io.flutter.embedding.engine.FlutterEngine;

/**
 * Generated file. Do not edit.
 * This file is generated by the Flutter tool based on the
 * plugins that support the Android platform.
 */
@Keep
public final class GeneratedPluginRegistrant {
  private static final String TAG = "GeneratedPluginRegistrant";
  public static void registerWith(@NonNull FlutterEngine flutterEngine) {
    try {
      flutterEngine.getPlugins().add(new com.ryanheise.audio_session.AudioSessionPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin audio_session, com.ryanheise.audio_session.AudioSessionPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.flutter.plugins.firebase.firestore.FlutterFirebaseFirestorePlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin cloud_firestore, io.flutter.plugins.firebase.firestore.FlutterFirebaseFirestorePlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new dev.fluttercommunity.plus.connectivity.ConnectivityPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin connectivity_plus, dev.fluttercommunity.plus.connectivity.ConnectivityPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new dev.fluttercommunity.plus.device_info.DeviceInfoPlusPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin device_info_plus, dev.fluttercommunity.plus.device_info.DeviceInfoPlusPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.mr.flutter.plugin.filepicker.FilePickerPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin file_picker, com.mr.flutter.plugin.filepicker.FilePickerPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.flutter.plugins.firebase.auth.FlutterFirebaseAuthPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin firebase_auth, io.flutter.plugins.firebase.auth.FlutterFirebaseAuthPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.flutter.plugins.firebase.core.FlutterFirebaseCorePlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin firebase_core, io.flutter.plugins.firebase.core.FlutterFirebaseCorePlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.flutter.plugins.firebase.crashlytics.FlutterFirebaseCrashlyticsPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin firebase_crashlytics, io.flutter.plugins.firebase.crashlytics.FlutterFirebaseCrashlyticsPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.flutter.plugins.firebase.database.FirebaseDatabasePlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin firebase_database, io.flutter.plugins.firebase.database.FirebaseDatabasePlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.example.flutter_braintree.FlutterBraintreePlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin flutter_braintree_betc, com.example.flutter_braintree.FlutterBraintreePlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.fluttercandies.flutter_image_compress.ImageCompressPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin flutter_image_compress_common, com.fluttercandies.flutter_image_compress.ImageCompressPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.pichillilorenzo.flutter_inappwebview_android.InAppWebViewFlutterPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin flutter_inappwebview_android, com.pichillilorenzo.flutter_inappwebview_android.InAppWebViewFlutterPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.jayesh.flutter_native_contact_picker.FlutterNativeContactPickerPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin flutter_native_contact_picker, com.jayesh.flutter_native_contact_picker.FlutterNativeContactPickerPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new co.paystack.flutterpaystack.FlutterPaystackPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin flutter_paystack, co.paystack.flutterpaystack.FlutterPaystackPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.paymentsdk.flutter_paymentsdk_bridge.FlutterPaytabsBridgePlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin flutter_paytabs_bridge, com.paymentsdk.flutter_paymentsdk_bridge.FlutterPaytabsBridgePlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.flutter.plugins.flutter_plugin_android_lifecycle.FlutterAndroidLifecyclePlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin flutter_plugin_android_lifecycle, io.flutter.plugins.flutter_plugin_android_lifecycle.FlutterAndroidLifecyclePlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.inway.ringtone.player.FlutterRingtonePlayerPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin flutter_ringtone_player, io.inway.ringtone.player.FlutterRingtonePlayerPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.github.ponnamkarthik.toast.fluttertoast.FlutterToastPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin fluttertoast, io.github.ponnamkarthik.toast.fluttertoast.FlutterToastPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.baseflow.geocoding.GeocodingPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin geocoding_android, com.baseflow.geocoding.GeocodingPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.baseflow.geolocator.GeolocatorPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin geolocator_android, com.baseflow.geolocator.GeolocatorPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.flutter.plugins.googlemaps.GoogleMapsPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin google_maps_flutter_android, io.flutter.plugins.googlemaps.GoogleMapsPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.flutter.plugins.googlesignin.GoogleSignInPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin google_sign_in_android, io.flutter.plugins.googlesignin.GoogleSignInPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.flutter.plugins.imagepicker.ImagePickerPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin image_picker_android, io.flutter.plugins.imagepicker.ImagePickerPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.ryanheise.just_audio.JustAudioPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin just_audio, com.ryanheise.just_audio.JustAudioPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.lyokone.location.LocationPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin location, com.lyokone.location.LocationPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.alexmiller.map_launcher.MapLauncherPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin map_launcher, com.alexmiller.map_launcher.MapLauncherPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.onesignal.flutter.OneSignalPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin onesignal_flutter, com.onesignal.flutter.OneSignalPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.crazecoder.openfile.OpenFilePlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin open_file_android, com.crazecoder.openfile.OpenFilePlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new dev.fluttercommunity.plus.packageinfo.PackageInfoPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin package_info_plus, dev.fluttercommunity.plus.packageinfo.PackageInfoPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.flutter.plugins.pathprovider.PathProviderPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin path_provider_android, io.flutter.plugins.pathprovider.PathProviderPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new in.appyflow.paytm.PaytmPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin paytm, in.appyflow.paytm.PaytmPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.scer.pdfx.PdfxPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin pdfx, io.scer.pdfx.PdfxPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.baseflow.permissionhandler.PermissionHandlerPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin permission_handler_android, com.baseflow.permissionhandler.PermissionHandlerPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.razorpay.razorpay_flutter.RazorpayFlutterPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin razorpay_flutter, com.razorpay.razorpay_flutter.RazorpayFlutterPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin shared_preferences_android, io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.tekartik.sqflite.SqflitePlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin sqflite_android, com.tekartik.sqflite.SqflitePlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.flutter.stripe.StripeAndroidPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin stripe_android, com.flutter.stripe.StripeAndroidPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.flutter.plugins.urllauncher.UrlLauncherPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin url_launcher_android, io.flutter.plugins.urllauncher.UrlLauncherPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.flutter.plugins.videoplayer.VideoPlayerPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin video_player_android, io.flutter.plugins.videoplayer.VideoPlayerPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new dev.fluttercommunity.plus.wakelock.WakelockPlusPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin wakelock_plus, dev.fluttercommunity.plus.wakelock.WakelockPlusPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.flutter.plugins.webviewflutter.WebViewFlutterPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin webview_flutter_android, io.flutter.plugins.webviewflutter.WebViewFlutterPlugin", e);
    }
  }
}

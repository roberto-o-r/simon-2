//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <audioplayers/AudioplayersPlugin.h>
#import <firebase_analytics/FirebaseAnalyticsPlugin.h>
#import <firebase_core/FirebaseCorePlugin.h>
#import <firebase_crashlytics/FirebaseCrashlyticsPlugin.h>
#import <path_provider/PathProviderPlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [AudioplayersPlugin registerWithRegistrar:[registry registrarForPlugin:@"AudioplayersPlugin"]];
  [FLTFirebaseAnalyticsPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseAnalyticsPlugin"]];
  [FLTFirebaseCorePlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseCorePlugin"]];
  [FirebaseCrashlyticsPlugin registerWithRegistrar:[registry registrarForPlugin:@"FirebaseCrashlyticsPlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
}

@end

//
//  AppDelegate.m
//  NEO
//
//  Created by Neo on 06/12/24.
//

#import "AppDelegate.h"
#import "Storage.h"
#import "LoginViewController.h"
#import "HomeViewController.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//
//    UIWindow *window = [[UIWindow alloc] init];
//    self.window = [[UIWindow alloc] initWithFrame: window.coordinateSpace.bounds];
//    self.window = window;
//    NSString *accessToken = [Storage checkAccessToken];

//    if (accessToken) {
//        HomeViewController *homeViewController = [[HomeViewController alloc] init];
//        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController: homeViewController];
//        self.window.rootViewController = navigationController;
//    } else {
//        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController: [[LoginViewController alloc] init]];
//        self.window.rootViewController = navigationController;
//    }
//    [self.window makeKeyAndVisible];
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end

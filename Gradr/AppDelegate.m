//
//  AppDelegate.m
//  Gradr
//
//  Created by Sarat Tallamraju on 10/27/16.
//  Copyright © 2016 Sarat Tallamraju. All rights reserved.
//

#import "AppDelegate.h"
#import "GradrViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    GradrViewController *vc = [[GradrViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    navigationController.navigationBar.translucent = NO;
    // navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.99 green:0.65 blue:0.65 alpha:1.0];
    // navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.window.rootViewController = navigationController;
    
    CGFloat navTitleColor = 0.99;
    
    NSDictionary *navbarTitleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                               [UIColor colorWithRed:navTitleColor green:navTitleColor blue:navTitleColor alpha:1.0], NSForegroundColorAttributeName, nil];
    
    [[UINavigationBar appearance] setTitleTextAttributes:navbarTitleTextAttributes];
    
    UIColor *lightRed = [UIColor colorWithRed:0.83 green:0.42 blue:0.42 alpha:1.0];
    [[UINavigationBar appearance] setBarTintColor: lightRed];
    [[UINavigationBar appearance] setTintColor: [UIColor whiteColor]];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

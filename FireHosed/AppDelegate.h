//
//  AppDelegate.h
//  FireHosed
//
//  Created by Randy Edmonds on 6/16/16.
//  Copyright © 2016 RandyEdmonds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


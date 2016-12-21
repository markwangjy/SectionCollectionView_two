//
//  AppDelegate.h
//  CollectionSentionLayout
//
//  Created by 王吉源 on 16/12/15.
//  Copyright © 2016年 王吉源. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


//
//  AppDelegate.h
//  HackerBooksPro
//
//  Created by Alberto Di Martino on 4/20/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

@import UIKit;
@class AGTCoreDataStack;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) AGTCoreDataStack *stack;

@end


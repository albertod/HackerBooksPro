//
//  UIViewController+Navigation.m
//  HackerBooks
//
//  Created by Alberto Di Martino on 4/17/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#import "UIViewController+Navigation.h"


//Parenthesis --> category
@implementation UIViewController (Navigation)

-(UINavigationController *) wrappedInNavigation{
    
    UINavigationController *nav = [UINavigationController new];
    [nav pushViewController:self animated:NO];

    return nav;
}

@end

//
//  ADMCoreBookViewController.h
//  HackerBooks
//
//  Created by Alberto Di Martino on 4/17/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#import "AGTCoreDataTableViewController.h"
@class ADMCoreBook;
@class ADMCoreBooksTableViewController;


@protocol ADMLibraryTableViewControllerDelegate <NSObject>

-(void) libraryTableViewControllerDelegate: (ADMCoreBooksTableViewController *)booksTVC didSelectBook: (ADMCoreBook *) aBook;

@end

@interface ADMCoreBooksTableViewController : AGTCoreDataTableViewController

@property (weak,nonatomic) id<ADMLibraryTableViewControllerDelegate> delegate;

@end

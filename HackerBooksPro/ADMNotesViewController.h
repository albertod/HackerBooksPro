//
//  ADMNotesViewController.h
//  HackerBooksPro
//
//  Created by Alberto Di Martino on 4/20/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#import "AGTCoreDataTableViewController.h"

@class ADMCoreBook;

@interface ADMNotesViewController : AGTCoreDataTableViewController

-(id) initWithFetchedResultsController:(NSFetchedResultsController *)aFetchedResultsController
                                 style:(UITableViewStyle)aStyle
                                 book:(ADMCoreBook *) book;

@end

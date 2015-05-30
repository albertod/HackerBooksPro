//
//  ADMBookViewController.h
//  HackerBooks
//
//  Created by Alberto Di Martino on 4/1/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

@import UIKit;
#import "ADMCoreBook.h"
#import "ADMCoreBooksTableViewController.h"

@interface ADMBookViewController : UIViewController  <UISplitViewControllerDelegate,ADMLibraryTableViewControllerDelegate>

/* Basic properties from as practice */
@property (nonatomic,strong) ADMCoreBook *model;
@property (nonatomic, weak) IBOutlet UIImageView *coverView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *tagsLabel;
@property (nonatomic, weak) IBOutlet UILabel *authorLabel;

//NSFetchedResultController properties for the fetch on CoreData
@property (nonatomic,strong) NSFetchedResultsController *fetchedResultController;

//bottom to show PDF, need to show in another controller


//Instance Methods
-(IBAction)displayPDF:(id)sender;
-(id)  initWithModel:(ADMCoreBook *)model fetchedResultController:(NSFetchedResultsController *) aFetchedResultController;
@end

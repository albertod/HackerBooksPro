//
//  ADMBookViewController.m
//  HackerBooks
//
//  Created by Alberto Di Martino on 4/1/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#import "ADMSimplePDFViewController.h"
#import "ADMBookViewController.h"
#import "ADMCoreImage.h"
#import "ADMCorePDF.h"


@interface ADMBookViewController ()

@end


@implementation ADMBookViewController

#pragma mark - Init
-(id) initWithModel:(ADMCoreBook *)model fetchedResultController:(NSFetchedResultsController *) aFetchedResultController{
    
    if(self = [super init]){
        _model = model;
        self.title = [model title];
        _fetchedResultController = aFetchedResultController;
    }
    
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    //this it to make sure to not use all the screen if there is an imageview
    //makes space for toolbar
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self syncviewWithModel];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    [self syncviewWithModel];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)displayPDF:(id)sender{
    
    ADMSimplePDFViewController *pdfVC = [[ADMSimplePDFViewController alloc] initWithModel:self.model.pdf book:self.model];
    [self.navigationController pushViewController:pdfVC animated:YES];
    
}

-(void) syncviewWithModel{
    
    self.tagsLabel.text = [self parseSetToString:self.model.tag];
    self.authorLabel.text = [self parseSetToString:self.model.author];
    self.coverView.image = [UIImage imageWithData:self.model.image.imageData];
    self.title = self.model.title;
    self.titleLabel.text = self.model.title;
  
}

#pragma mark UISplitViewDelegate
-(void) splitViewController:(UISplitViewController *)svc willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode{
    
    //Find out if the left table is visible
    if(displayMode == UISplitViewControllerDisplayModeAllVisible){
        
        //We are in vertical mode (all visible,not UITable)
        self.navigationItem.leftBarButtonItem = nil;
        
    }else{
        //we are in landscape, so hide the button
        self.navigationItem.leftBarButtonItem = svc.displayModeButtonItem;
    }
}

#pragma mark ADMLibraryTableViewControllerDelegate
-(void) libraryTableViewControllerDelegate:(ADMCoreBooksTableViewController *)booksTVC didSelectBook:(ADMCoreBook *)aBook {
    //the user selected a new character
    self.model = aBook;
    //sysncronize view with model
    [self syncviewWithModel];
}

#pragma mark Utils

-(NSString *)parseSetToString:(NSSet *)tagsSet {
    
    NSArray *myArray = [tagsSet allObjects];
    NSString *myStr = [myArray componentsJoinedByString:@","];
    return myStr;
}


@end

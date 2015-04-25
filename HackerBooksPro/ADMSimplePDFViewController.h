//
//  ADMSimplePDFViewController.h
//  HackerBooks
//
//  Created by Alberto Di Martino on 4/3/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

@import UIKit;
#import "ADMCoreBook.h"

@interface ADMSimplePDFViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic,weak) IBOutlet UIWebView *pdfViewer;
@property(nonatomic,strong) ADMCorePDF* model;
@property (nonatomic,strong) ADMCoreBook* book;
@property (nonatomic,weak) IBOutlet UIActivityIndicatorView *activityView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *favoriteButton;

-(id)initWithModel:(ADMCorePDF *)model book:(ADMCoreBook *)book;

-(IBAction)flipFavorite:(id)sender;

@end

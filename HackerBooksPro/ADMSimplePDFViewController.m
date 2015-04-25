//
//  ADMSimplePDFViewController.m
//  HackerBooks
//
//  Created by Alberto Di Martino on 4/3/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#import "ADMSimplePDFViewController.h"
#import "ADMCorePDF.h"

@interface ADMSimplePDFViewController ()

@end

@implementation ADMSimplePDFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self observeBookNotifications]; //Sign up for notification
}

-(void) viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}


-(id)initWithModel:(ADMCorePDF *)model book:(ADMCoreBook *)book{
    
    
    if(self =[super initWithNibName:nil
                             bundle:nil]){
        
        _model = model;
        _book = book;
    }
    return  self;
}


-(void) viewWillAppear:(BOOL)animated{
    
    //Sycronize model with the View
    //Make sure dont use the all screen, so we are able to return
    [super viewWillAppear:animated];
    self.activityView.hidden = YES;
    [self syncWithModel];
}

#pragma mark - Favorite
-(IBAction)flipFavorite:(id)sender{
    
    BOOL isFavorite = [self.book isFavoriteValue];
    [self.book setIsFavoriteValue:!isFavorite];
    [self syncWithModel];
}


#pragma mark - Notification
-(void) notifyThatBookDidChange:(NSNotification *) notification{
    
    // sacamos el nuevo libro
    ADMCoreBook *newBook = [notification.userInfo objectForKey:BOOK_KEY];
    self.book = newBook;
    [self syncWithModel];
}

#pragma mark -Util
-(NSURL *) documentsDirectory{
    
    NSFileManager *fm = [NSFileManager defaultManager];
    
    NSURL *docs = [[fm URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    
    return docs;
}

-(NSURL *) localURLForRemoteURL:(NSURL *) remoteURL{
    
    NSString *fileName = [remoteURL lastPathComponent];
    NSURL *local = [[self documentsDirectory]URLByAppendingPathComponent:fileName];
    
    return local;
}

-(void) syncWithModel{
    
        self.title = self.book.title;
    
        NSFileManager *fm = [NSFileManager defaultManager];
    
        NSURL *localURL = [self localURLForRemoteURL:[NSURL URLWithString:self.book.pdfURL]];
    
        if ([fm fileExistsAtPath:[localURL path]]) {
            
            [self.pdfViewer loadData:[NSData dataWithContentsOfURL:localURL]
                          MIMEType:@"application/pdf"
                  textEncodingName:@"UTF-8"
                           baseURL:nil];
    
        }else{
            // No está en local
            // Hay que descargar y guardar
            self.activityView.hidden = NO;
            [self.activityView startAnimating];
    
            dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.book.pdfURL]];
    
                dispatch_async(dispatch_get_main_queue(), ^{
                                    [self.pdfViewer loadData:data
                                    MIMEType:@"application/pdf"
                                    textEncodingName:@"UTF-8"
                                    baseURL:nil];
                    [self.activityView stopAnimating];
                    self.activityView.hidden = YES;
    
                    [data writeToURL:localURL
                          atomically:YES];
                });
            
            });
        }
    
    if(self.book.isFavorite){
        self.favoriteButton.title = @"★";
    }else{
        self.favoriteButton.title = @"☆";
    }
    
}


#pragma mark -  Notificaciones
-(void) observeBookNotifications{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self
           selector:@selector(notifyThatBookDidChange:)
               name:ADMCOREBOOK_DID_CHANGE_NOTIFICATION
             object:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end

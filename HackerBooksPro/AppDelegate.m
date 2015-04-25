//
//  AppDelegate.m
//  HackerBooksPro
//
//  Created by Alberto Di Martino on 4/20/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#import "AppDelegate.h"

#import "AGTCoreDataStack.h"
#import "ADMCoreBook.h"
#import "ADMCoreBookViewController.h"
#import "ADMCoreAnnotation.h"
#import "UIViewController+Navigation.h"
#import "ADMSimplePDFViewController.h"
#import "AGTMultiDictionary.h"


@interface AppDelegate ()

@property(strong,nonatomic) AGTMultiDictionary* bookDB;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    //Create an instance of the stack of coreDataStack
    self.stack = [AGTCoreDataStack coreDataStackWithModelName:@"Model"];
    //Now we ahve ready our coreData to create objects
    
    //[self createDummyData];
    
    //Download Data From JSON
    
    
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://t.co/K9ziV0z3SJ"]];
    [self initWithJSONData:data];
    
    //Organize by alfabeth If tie modification data
    // Buscar
    
    NSFetchRequest *req = [NSFetchRequest
                           fetchRequestWithEntityName:[ADMCoreBook entityName]];
    
    req.sortDescriptors = @[[NSSortDescriptor
                             sortDescriptorWithKey:ADMCoreBookAttributes.title
                             ascending:YES
                             selector:@selector(caseInsensitiveCompare:)]];
    req.fetchBatchSize = 20;
    //req.predicate = [NSPredicate predicateWithFormat:@"book = %@", [ADMCoreBook entityName]];
    
    
    //FetchedResult Controller
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                                         managedObjectContext:self.stack.context
                                                                           sectionNameKeyPath:nil
                                                                                    cacheName:nil];
    
   
    //View controller for books
    
    
    ADMCoreBookViewController *vc = [[ADMCoreBookViewController alloc]
                                     initWithFetchedResultsController:fc
                                     style:UITableViewStylePlain];
    
    ADMCoreBook *book1 = [ADMCoreBook bookWithTitle:@"El libro de ti"
                                           imageURL:@"http://hackershelf.com/media/cache/97/bf/97bfce708365236e0a5f3f9e26b4a796.jpg" pdfURL:@"https://progit2.s3.amazonaws.com/en/2015-03-06-439c2/progit-en.376.pdf" context:self.stack.context];

    
    ADMSimplePDFViewController *pdfVC = [[ADMSimplePDFViewController alloc] initWithModel:book1.pdf book:book1];
    
    
    // Creo los navigations
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:vc];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:pdfVC];
    
    // Creo el SplitView
    UISplitViewController *splitVC = [UISplitViewController new];
    splitVC.viewControllers = @[nav1,nav2];
    
    
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.rootViewController = splitVC;

    
    //self.window.rootViewController = [vc wrappedInNavigation];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
  
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.

    //Save
    [self.stack saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Error saving in app delegate@ %@", error);
    }];

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
}

#pragma mark - Utils

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




-(void) initWithJSONData:(NSData*) data{
    
    
    
    NSFileManager *fm = [NSFileManager defaultManager];
    
    NSURL *localURL = [self localURLForRemoteURL:[NSURL URLWithString:@"https://t.co/K9ziV0z3SJ"]];
    
    if ([fm fileExistsAtPath:[localURL path]]) {

        NSError *err;
        id json = [NSJSONSerialization JSONObjectWithData:data
                                                  options:0
                                                    error:&err ];
        if (json == nil) {
            // There was an error
            NSLog(@"Error while parsing json data.\n%@", err);
            
        }else{
            _bookDB = [AGTMultiDictionary dictionary];
            [self processJSONArray: json];
            //            [self setupNotifications]
        }
    }
    
    else{
        // No está en local
        // Hay que descargar y guardar
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
            
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://t.co/K9ziV0z3SJ"]];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //We finished dowloading the JSON, knwo do serialization
                NSError *err;
                id json = [NSJSONSerialization JSONObjectWithData:data
                                                          options:0
                                                            error:&err ];
                if (json == nil) {
                    // There was an error
                    NSLog(@"Error while parsing json data.\n%@", err);
                    
                }else{
                    _bookDB = [AGTMultiDictionary dictionary];
                    [self processJSONArray: json];
                    //            [self setupNotifications]
                }
                
                [data writeToURL:localURL
                      atomically:YES];
            });
            
        });
        
    }

}

#pragma mark - JSON Processing
-(void) processJSONArray:(NSArray*)json{
    
    
    for (NSDictionary *dict in json) {
        
        [ADMCoreBook initWithJSONDictionary:dict context:self.stack.context];

    }
    
    //Save at the END
    //Save
    [self.stack saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Error saving in app delegate@ %@", error);
    }];
}


-(void) createDummyData{
    
    [self.stack zapAllData];
    
    ADMCoreBook *book1 = [ADMCoreBook bookWithTitle:@"El libro de ti"
                                           imageURL:@"http://hackershelf.com/media/cache/97/bf/97bfce708365236e0a5f3f9e26b4a796.jpg" pdfURL:@"http://hackershelf.com/media/cache/b4/24/b42409de128aa7f1c9abbbfa549914de.jpg" context:self.stack.context];
    
    
         ADMCoreBook *book2 = [ADMCoreBook bookWithTitle:@"El libro de tu papa"
                    imageURL:@"http://hackershelf.com/media/cache/97/bf/97bfce708365236e0a5f3f9e26b4a796.jpg" pdfURL:@"http://hackershelf.com/media/cache/b4/24/b42409de128aa7f1c9abbbfa549914de.jpg" context:self.stack.context];
    
    
          [ADMCoreAnnotation noteWithName:@"book manolo" book:book1 context:self.stack.context];
          [ADMCoreAnnotation noteWithName:@"book pablo" book:book1 context:self.stack.context];
    
          [ADMCoreAnnotation noteWithName:@"book clotilda" book:book2 context:self.stack.context];
          [ADMCoreAnnotation noteWithName:@"book mana" book:book2 context:self.stack.context];
    
    
    
    //Save
    [self.stack saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Error saving in app delegate@ %@", error);
    }];
    
}


@end
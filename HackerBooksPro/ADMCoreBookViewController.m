//
//  ADMCoreBookViewController.m
//  HackerBooks
//
//  Created by Alberto Di Martino on 4/17/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#import "ADMCoreBookViewController.h"
#import "ADMCoreBook.h"
#import "ADMCoreAnnotation.h"
#import "ADMNotesViewController.h"

@interface ADMCoreBookViewController ()

@end

@implementation ADMCoreBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"HackerbookPro";
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Retrive book for every cell

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguar cual es el libro
    ADMCoreBook *b = [self.fetchedResultsController
                       objectAtIndexPath:indexPath];
    
    // Crear una celda
    static NSString *cellID = @"bookCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleValue1
                reuseIdentifier:cellID];
    }
    
    // Configurarla (sincronizar libreta -> celda)
    cell.textLabel.text = b.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)[b.note count]];
    
    // Devolverla
    return cell;
    
    
}

#pragma mark - To delete a book on table using edit section
-(void) tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(editingStyle == UITableViewCellEditingStyleDelete){
        
        ADMCoreBook *book = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        [self.fetchedResultsController.managedObjectContext deleteObject:book];
    }
    
}

#pragma mark -Table Delegate, when a row is selected
//Make a push to see the note on the book
-(void) tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 
    // Averiguar la libreta
    ADMCoreBook *book = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Crear un contorlador de notas
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[ADMCoreAnnotation entityName]];
    req.sortDescriptors = @[[NSSortDescriptor
                             sortDescriptorWithKey:ADMCoreAnnotationAttributes.name
                             ascending:YES
                             selector:@selector(caseInsensitiveCompare:)],
                            [NSSortDescriptor
                             sortDescriptorWithKey:ADMCoreAnnotationAttributes.modificationDate
                             ascending:NO]];
    req.fetchBatchSize = 20;
    
    req.predicate = [NSPredicate predicateWithFormat:@"book = %@", book];
    
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc]
                                      initWithFetchRequest:req
                                      managedObjectContext:book.managedObjectContext
                                      sectionNameKeyPath:nil cacheName:nil];
    
    ADMNotesViewController *nVC = [[ADMNotesViewController alloc] initWithFetchedResultsController:fc
                                                                                             style:UITableViewStylePlain
                                                                                              book:book];
    
    
    // Hacer un push
    [self.navigationController pushViewController:nVC
                                         animated:YES];

    //Send notification to change PDF
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    NSNotification *n = [NSNotification notificationWithName:ADMCOREBOOK_DID_CHANGE_NOTIFICATION
                                                      object:self
                                                    userInfo:@{BOOK_KEY:book}];
    
    // to let know book has ben changed (PDF viewer would ge tthe notification)
    [nc postNotification:n];
    
}


//we Don't create book so we dont need the button
//#pragma mark - Utils
//-(void) addNewBookButton{
//    
//    UIBarButtonItem *add = [[UIBarButtonItem alloc]
//                            initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
//                            target:self action:@selector(addNewBook:)];
//    
//    self.navigationItem.rightBarButtonItem = add;
//    
//}
//
//#pragma mark -  Actions
//-(void) addNewBook:(id) sender{
//    
//    [ADMCoreBook bookWithTitle:@"New Book" imageURL:@"" pdfURL:@""
//                       context:self.fetchedResultsController.managedObjectContext];
//    
//}

@end

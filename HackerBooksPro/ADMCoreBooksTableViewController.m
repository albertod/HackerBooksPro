//
//  ADMCoreBookViewController.m
//  HackerBooks
//
//  Created by Alberto Di Martino on 4/17/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#import "ADMCoreBooksTableViewController.h"
#import "ADMCoreBook.h"
#import "ADMCoreAnnotation.h"
#import "ADMNotesViewController.h"
#import "ADMCoreTag.h"
#import "ADMCoreImage.h"


@interface ADMCoreBooksTableViewController ()

@end

@implementation ADMCoreBooksTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"HackerbookPro";
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Retrive a book for every cell

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Uncomment to debeug the fetchedResultController
    self.debug = YES;
    //Averiguar la sesion (tag)
    ADMCoreTag *tag = [[self.fetchedResultsController fetchedObjects]objectAtIndex:indexPath.section];
    
    
    //Averiguar cual es el libro
    NSArray *test =  [tag.book allObjects];
    ADMCoreBook *b = [test objectAtIndex:indexPath.row];
    
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
    cell.imageView.image = [UIImage imageWithData:b.image.imageData];
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
 
    
    
    ADMCoreTag *tag = [[self.fetchedResultsController fetchedObjects]objectAtIndex:indexPath.section];
    // Averiguar la libreta
    ADMCoreBook *book = [[tag.book allObjects]objectAtIndex:indexPath.row];
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
    
    req.predicate = [NSPredicate predicateWithFormat:@"book == %@", book];
    
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

@end

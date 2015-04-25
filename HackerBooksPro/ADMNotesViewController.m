//
//  ADMNotesViewController.m
//  HackerBooksPro
//
//  Created by Alberto Di Martino on 4/20/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#import "ADMNotesViewController.h"
#import "ADMCoreBook.h"
#import "ADMCoreAnnotation.h"
#import "ADMCorePhoto.h"
#import "AGTNoteViewController.h"



@interface ADMNotesViewController ()
@property (nonatomic, strong) ADMCoreBook *book;
@end

@implementation ADMNotesViewController


-(id) initWithFetchedResultsController:(NSFetchedResultsController *)aFetchedResultsController
                                 style:(UITableViewStyle)aStyle
                                  book:(ADMCoreBook *) book{
    
    if (self = [super initWithFetchedResultsController:aFetchedResultsController
                                                 style:aStyle]) {
       
        _book = book;
        self.title = self.book.title;
    }
    return self;
}

-(void) viewDidLoad{
    
    [super viewDidLoad];
    
    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                         target:self action:@selector(addNewNote:)];
    
    self.navigationItem.rightBarButtonItem = add;
}

#pragma mark - Action

-(void) addNewNote:(id) sender{
    
    [ADMCoreAnnotation noteWithName:@"New Note" book:self.book context:self.book.managedObjectContext];
}

#pragma mark - Get cells
-(UITableViewCell *) tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    // Averiguar la nota
    ADMCoreAnnotation *note = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    
    // Crear la celda
    static NSString *noteCellId = @"NoteCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:noteCellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:noteCellId];
    }
    // Sincornizar nota -> celda
    cell.imageView.image = note.photo.photo;
    cell.textLabel.text = note.name;
    
    // devolverla
    return cell;
    
}

#pragma mark - TO Delete cells

-(void) tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        ADMCoreAnnotation *note = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        [self.fetchedResultsController.managedObjectContext deleteObject:note];
    }
    
}


#pragma mark - Select a cell

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ADMCoreAnnotation *note = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //Create controller
    AGTNoteViewController *nVC = [[AGTNoteViewController alloc] initWithModel:note];
    
    //make push
    [self.navigationController pushViewController:nVC animated:YES];
    
}



@end

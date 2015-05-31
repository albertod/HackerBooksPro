#import "ADMCoreBook.h"
#import "ADMCoreImage.h"
#import "ADMCorePDF.h"
#import "ADMCoreTag.h"

/* JSON Properties */
#define TITLE @"title"
#define AUTHORS @"authors"
#define IMAGE_URL @"image_url"
#define PDF_URL @"pdf_url"
#define TAGS @"tags"

@interface ADMCoreBook ()

// Private interface goes here.

@end

@implementation ADMCoreBook

//+(NSArray *) observableKeyNames{
//    
//    return @[ADMCoreBookRelationships.note,ADMCoreBookRelationships.tag,ADMCoreBookRelationships.image]; //Method to be overwritten by subclasses
//}


#pragma mark - Class Methods
+(instancetype) bookWithTitle:(NSString * )title
                     imageURL:(NSString *) imageURL
                     pdfURL  :(NSString *) pdfURL
                      context:(NSManagedObjectContext *) context
                         tags:(NSString *) theTags
{
    
    ADMCoreBook *book = [self insertInManagedObjectContext:context];
    
    [book setTitle:title];
    [book setImageURL:imageURL];
    [book setPdfURL:pdfURL];
    [book setImage:[ADMCoreImage insertInManagedObjectContext:context]];
    [book setIsFavoriteValue:FALSE];
    //Parsetags and add to the book
    [ADMCoreTag parseBookTags:theTags context:context aBook:book];
    
    [context save:nil];
    return book;
}


+(instancetype) initWithJSONDictionary:(NSDictionary*) dict context:(NSManagedObjectContext*) context{
    
    
    // Must tokenize authors and tags
    return [self bookWithTitle:[dict objectForKey:TITLE]
                      imageURL:[dict objectForKey:IMAGE_URL]
                        pdfURL:[dict objectForKey:PDF_URL]
                       context:context
                          tags: [dict objectForKey:TAGS]];
}

#pragma mark -  Utils
-(NSArray*) tokenize:(NSString*) commaSeparatedString{
    
    NSArray *tokens = [commaSeparatedString componentsSeparatedByString:@","];
    NSMutableArray *clean = [NSMutableArray arrayWithCapacity:tokens.count];
    
    for (NSString *token in tokens) {
        [clean addObject:[token stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
    }
    
    return clean;
}
@end

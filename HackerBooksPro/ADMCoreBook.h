#import "_ADMCoreBook.h"

@interface ADMCoreBook : _ADMCoreBook {}


#define ADMCOREBOOK_DID_CHANGE_NOTIFICATION @"ADMCOREBOOK_DID_CHANGE_NOTIFICATION"
#define BOOK_KEY @"BOOK"


+(instancetype) bookWithTitle:(NSString * )title
                     imageURL:(NSString *) imageURL
                     pdfURL  :(NSString *) pdfURL
                      context:(NSManagedObjectContext *) context
                      tags:(NSString *) theTags;

+(instancetype) initWithJSONDictionary:(NSDictionary*) dict context:(NSManagedObjectContext*) context;

@end

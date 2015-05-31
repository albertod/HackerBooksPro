#import "ADMCoreTag.h"
#import "ADMCoreBook.h"

@interface ADMCoreTag ()

// Private interface goes here.

@end

@implementation ADMCoreTag

+(void) parseBookTags: (NSString*)tags context: (NSManagedObjectContext *)context aBook:(ADMCoreBook*)book{
    

    NSArray *tagsStoredInContext = [tags componentsSeparatedByString:@", "];
    NSMutableSet *allTags = [NSMutableSet new];
    
    for(NSString *aTag in tagsStoredInContext){
        NSFetchRequest *fetch = [NSFetchRequest fetchRequestWithEntityName:@"Tag"];
        NSPredicate *p = [NSPredicate predicateWithFormat:@"tagName == %@",aTag];
        [fetch setPredicate:p];
        NSArray *tagsFetched = [context executeFetchRequest:fetch error:nil];
        
        if(tagsFetched.count != 0){
            [book addTagObject:[tagsFetched lastObject]]; //add last result from the NSFetchrequest
        }else{
            //Tag has not been fetched
            ADMCoreTag *fetchedTag = [self insertInManagedObjectContext:context];
            fetchedTag.tagName = aTag;
            [allTags addObject:fetchedTag];
            book.tag = allTags;
        }
    }
}

@end

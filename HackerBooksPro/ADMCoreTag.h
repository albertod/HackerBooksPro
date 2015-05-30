#import "_ADMCoreTag.h"

@interface ADMCoreTag : _ADMCoreTag {}

+(void) parseBookTags: (NSString*)tags context: (NSManagedObjectContext *)context aBook:(ADMCoreBook*)book;

@end

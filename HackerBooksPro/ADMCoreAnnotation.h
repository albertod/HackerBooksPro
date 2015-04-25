#import "_ADMCoreAnnotation.h"

@interface ADMCoreAnnotation : _ADMCoreAnnotation {}

+(instancetype) noteWithName:(NSString *) name
                        book:(ADMCoreBook *) book
                     context:(NSManagedObjectContext *) context;

@end

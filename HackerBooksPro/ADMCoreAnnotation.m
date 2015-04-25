#import "ADMCoreAnnotation.h"
#import "ADMCorePhoto.h"

@interface ADMCoreAnnotation ()

// Private interface goes here.

@end

@implementation ADMCoreAnnotation

+(NSArray *)observableKeyNames{
    
    return  @[ADMCoreAnnotationAttributes.name,ADMCoreAnnotationAttributes.text,ADMCoreAnnotationRelationships.photo];
    
}

+(instancetype) noteWithName:(NSString *) name
                        book:(ADMCoreBook *) book
                     context:(NSManagedObjectContext *) context{
    
    ADMCoreAnnotation *note = [self insertInManagedObjectContext:context];
    
    note.name = name;
    note.creationDate = [NSDate date];
    note.modificationDate = [NSDate date];
    note.photo = [ADMCorePhoto insertInManagedObjectContext:context];
    note.book  = book;
    
    return note;
}

#pragma mark - KVO

//KVO method called when a propertie change, so we update modification date
-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    
    self.modificationDate = [NSDate date];
    
}

@end

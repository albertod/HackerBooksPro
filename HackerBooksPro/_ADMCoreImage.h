// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ADMCoreImage.h instead.

@import CoreData;
#import "ADMCoreBaseClass.h"

extern const struct ADMCoreImageAttributes {
	__unsafe_unretained NSString *imageData;
} ADMCoreImageAttributes;

extern const struct ADMCoreImageRelationships {
	__unsafe_unretained NSString *book;
} ADMCoreImageRelationships;

@class ADMCoreBook;

@interface ADMCoreImageID : NSManagedObjectID {}
@end

@interface _ADMCoreImage : ADMCoreBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ADMCoreImageID* objectID;

@property (nonatomic, strong) NSData* imageData;

//- (BOOL)validateImageData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) ADMCoreBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@end

@interface _ADMCoreImage (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitiveImageData;
- (void)setPrimitiveImageData:(NSData*)value;

- (ADMCoreBook*)primitiveBook;
- (void)setPrimitiveBook:(ADMCoreBook*)value;

@end

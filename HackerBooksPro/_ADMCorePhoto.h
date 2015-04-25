// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ADMCorePhoto.h instead.

@import CoreData;
#import "ADMCoreBaseClass.h"

extern const struct ADMCorePhotoAttributes {
	__unsafe_unretained NSString *photoData;
} ADMCorePhotoAttributes;

extern const struct ADMCorePhotoRelationships {
	__unsafe_unretained NSString *note;
} ADMCorePhotoRelationships;

@class ADMCoreAnnotation;

@interface ADMCorePhotoID : NSManagedObjectID {}
@end

@interface _ADMCorePhoto : ADMCoreBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ADMCorePhotoID* objectID;

@property (nonatomic, strong) NSData* photoData;

//- (BOOL)validatePhotoData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) ADMCoreAnnotation *note;

//- (BOOL)validateNote:(id*)value_ error:(NSError**)error_;

@end

@interface _ADMCorePhoto (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePhotoData;
- (void)setPrimitivePhotoData:(NSData*)value;

- (ADMCoreAnnotation*)primitiveNote;
- (void)setPrimitiveNote:(ADMCoreAnnotation*)value;

@end

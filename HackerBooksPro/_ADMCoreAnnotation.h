// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ADMCoreAnnotation.h instead.

@import CoreData;
#import "ADMCoreBaseClass.h"

extern const struct ADMCoreAnnotationAttributes {
	__unsafe_unretained NSString *creationDate;
	__unsafe_unretained NSString *modificationDate;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *text;
} ADMCoreAnnotationAttributes;

extern const struct ADMCoreAnnotationRelationships {
	__unsafe_unretained NSString *book;
	__unsafe_unretained NSString *photo;
} ADMCoreAnnotationRelationships;

@class ADMCoreBook;
@class ADMCorePhoto;

@interface ADMCoreAnnotationID : NSManagedObjectID {}
@end

@interface _ADMCoreAnnotation : ADMCoreBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ADMCoreAnnotationID* objectID;

@property (nonatomic, strong) NSDate* creationDate;

//- (BOOL)validateCreationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* modificationDate;

//- (BOOL)validateModificationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* text;

//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) ADMCoreBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) ADMCorePhoto *photo;

//- (BOOL)validatePhoto:(id*)value_ error:(NSError**)error_;

@end

@interface _ADMCoreAnnotation (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveCreationDate;
- (void)setPrimitiveCreationDate:(NSDate*)value;

- (NSDate*)primitiveModificationDate;
- (void)setPrimitiveModificationDate:(NSDate*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (ADMCoreBook*)primitiveBook;
- (void)setPrimitiveBook:(ADMCoreBook*)value;

- (ADMCorePhoto*)primitivePhoto;
- (void)setPrimitivePhoto:(ADMCorePhoto*)value;

@end

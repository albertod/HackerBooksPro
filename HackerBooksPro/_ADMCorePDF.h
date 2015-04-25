// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ADMCorePDF.h instead.

@import CoreData;
#import "ADMCoreBaseClass.h"

extern const struct ADMCorePDFAttributes {
	__unsafe_unretained NSString *pdfData;
} ADMCorePDFAttributes;

extern const struct ADMCorePDFRelationships {
	__unsafe_unretained NSString *book;
} ADMCorePDFRelationships;

@class ADMCoreBook;

@interface ADMCorePDFID : NSManagedObjectID {}
@end

@interface _ADMCorePDF : ADMCoreBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ADMCorePDFID* objectID;

@property (nonatomic, strong) NSData* pdfData;

//- (BOOL)validatePdfData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) ADMCoreBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@end

@interface _ADMCorePDF (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePdfData;
- (void)setPrimitivePdfData:(NSData*)value;

- (ADMCoreBook*)primitiveBook;
- (void)setPrimitiveBook:(ADMCoreBook*)value;

@end

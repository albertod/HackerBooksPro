// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ADMCoreBook.h instead.

@import CoreData;
#import "ADMCoreBaseClass.h"

extern const struct ADMCoreBookAttributes {
	__unsafe_unretained NSString *imageURL;
	__unsafe_unretained NSString *isFavorite;
	__unsafe_unretained NSString *pdfURL;
	__unsafe_unretained NSString *title;
} ADMCoreBookAttributes;

extern const struct ADMCoreBookRelationships {
	__unsafe_unretained NSString *author;
	__unsafe_unretained NSString *image;
	__unsafe_unretained NSString *note;
	__unsafe_unretained NSString *pdf;
	__unsafe_unretained NSString *tag;
} ADMCoreBookRelationships;

@class ADMCoreAuthor;
@class ADMCoreImage;
@class ADMCoreAnnotation;
@class ADMCorePDF;
@class ADMCoreTag;

@interface ADMCoreBookID : NSManagedObjectID {}
@end

@interface _ADMCoreBook : ADMCoreBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ADMCoreBookID* objectID;

@property (nonatomic, strong) NSString* imageURL;

//- (BOOL)validateImageURL:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* isFavorite;

@property (atomic) BOOL isFavoriteValue;
- (BOOL)isFavoriteValue;
- (void)setIsFavoriteValue:(BOOL)value_;

//- (BOOL)validateIsFavorite:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* pdfURL;

//- (BOOL)validatePdfURL:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* title;

//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *author;

- (NSMutableSet*)authorSet;

@property (nonatomic, strong) ADMCoreImage *image;

//- (BOOL)validateImage:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *note;

- (NSMutableSet*)noteSet;

@property (nonatomic, strong) ADMCorePDF *pdf;

//- (BOOL)validatePdf:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *tag;

- (NSMutableSet*)tagSet;

@end

@interface _ADMCoreBook (AuthorCoreDataGeneratedAccessors)
- (void)addAuthor:(NSSet*)value_;
- (void)removeAuthor:(NSSet*)value_;
- (void)addAuthorObject:(ADMCoreAuthor*)value_;
- (void)removeAuthorObject:(ADMCoreAuthor*)value_;

@end

@interface _ADMCoreBook (NoteCoreDataGeneratedAccessors)
- (void)addNote:(NSSet*)value_;
- (void)removeNote:(NSSet*)value_;
- (void)addNoteObject:(ADMCoreAnnotation*)value_;
- (void)removeNoteObject:(ADMCoreAnnotation*)value_;

@end

@interface _ADMCoreBook (TagCoreDataGeneratedAccessors)
- (void)addTag:(NSSet*)value_;
- (void)removeTag:(NSSet*)value_;
- (void)addTagObject:(ADMCoreTag*)value_;
- (void)removeTagObject:(ADMCoreTag*)value_;

@end

@interface _ADMCoreBook (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveImageURL;
- (void)setPrimitiveImageURL:(NSString*)value;

- (NSNumber*)primitiveIsFavorite;
- (void)setPrimitiveIsFavorite:(NSNumber*)value;

- (BOOL)primitiveIsFavoriteValue;
- (void)setPrimitiveIsFavoriteValue:(BOOL)value_;

- (NSString*)primitivePdfURL;
- (void)setPrimitivePdfURL:(NSString*)value;

- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;

- (NSMutableSet*)primitiveAuthor;
- (void)setPrimitiveAuthor:(NSMutableSet*)value;

- (ADMCoreImage*)primitiveImage;
- (void)setPrimitiveImage:(ADMCoreImage*)value;

- (NSMutableSet*)primitiveNote;
- (void)setPrimitiveNote:(NSMutableSet*)value;

- (ADMCorePDF*)primitivePdf;
- (void)setPrimitivePdf:(ADMCorePDF*)value;

- (NSMutableSet*)primitiveTag;
- (void)setPrimitiveTag:(NSMutableSet*)value;

@end

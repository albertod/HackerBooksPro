// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ADMCoreTag.h instead.

@import CoreData;
#import "ADMCoreBaseClass.h"

extern const struct ADMCoreTagAttributes {
	__unsafe_unretained NSString *tagName;
} ADMCoreTagAttributes;

extern const struct ADMCoreTagRelationships {
	__unsafe_unretained NSString *book;
} ADMCoreTagRelationships;

@class ADMCoreBook;

@interface ADMCoreTagID : NSManagedObjectID {}
@end

@interface _ADMCoreTag : ADMCoreBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ADMCoreTagID* objectID;

@property (nonatomic, strong) NSString* tagName;

//- (BOOL)validateTagName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *book;

- (NSMutableSet*)bookSet;

@end

@interface _ADMCoreTag (BookCoreDataGeneratedAccessors)
- (void)addBook:(NSSet*)value_;
- (void)removeBook:(NSSet*)value_;
- (void)addBookObject:(ADMCoreBook*)value_;
- (void)removeBookObject:(ADMCoreBook*)value_;

@end

@interface _ADMCoreTag (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveTagName;
- (void)setPrimitiveTagName:(NSString*)value;

- (NSMutableSet*)primitiveBook;
- (void)setPrimitiveBook:(NSMutableSet*)value;

@end

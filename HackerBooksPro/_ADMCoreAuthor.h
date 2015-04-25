// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ADMCoreAuthor.h instead.

@import CoreData;
#import "ADMCoreBaseClass.h"

extern const struct ADMCoreAuthorAttributes {
	__unsafe_unretained NSString *name;
} ADMCoreAuthorAttributes;

extern const struct ADMCoreAuthorRelationships {
	__unsafe_unretained NSString *book;
} ADMCoreAuthorRelationships;

@class ADMCoreBook;

@interface ADMCoreAuthorID : NSManagedObjectID {}
@end

@interface _ADMCoreAuthor : ADMCoreBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ADMCoreAuthorID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *book;

- (NSMutableSet*)bookSet;

@end

@interface _ADMCoreAuthor (BookCoreDataGeneratedAccessors)
- (void)addBook:(NSSet*)value_;
- (void)removeBook:(NSSet*)value_;
- (void)addBookObject:(ADMCoreBook*)value_;
- (void)removeBookObject:(ADMCoreBook*)value_;

@end

@interface _ADMCoreAuthor (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveBook;
- (void)setPrimitiveBook:(NSMutableSet*)value;

@end

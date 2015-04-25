// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ADMCoreBook.m instead.

#import "_ADMCoreBook.h"

const struct ADMCoreBookAttributes ADMCoreBookAttributes = {
	.imageURL = @"imageURL",
	.isFavorite = @"isFavorite",
	.pdfURL = @"pdfURL",
	.title = @"title",
};

const struct ADMCoreBookRelationships ADMCoreBookRelationships = {
	.author = @"author",
	.image = @"image",
	.note = @"note",
	.pdf = @"pdf",
	.tag = @"tag",
};

@implementation ADMCoreBookID
@end

@implementation _ADMCoreBook

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Book";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Book" inManagedObjectContext:moc_];
}

- (ADMCoreBookID*)objectID {
	return (ADMCoreBookID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"isFavoriteValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"isFavorite"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic imageURL;

@dynamic isFavorite;

- (BOOL)isFavoriteValue {
	NSNumber *result = [self isFavorite];
	return [result boolValue];
}

- (void)setIsFavoriteValue:(BOOL)value_ {
	[self setIsFavorite:@(value_)];
}

- (BOOL)primitiveIsFavoriteValue {
	NSNumber *result = [self primitiveIsFavorite];
	return [result boolValue];
}

- (void)setPrimitiveIsFavoriteValue:(BOOL)value_ {
	[self setPrimitiveIsFavorite:@(value_)];
}

@dynamic pdfURL;

@dynamic title;

@dynamic author;

- (NSMutableSet*)authorSet {
	[self willAccessValueForKey:@"author"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"author"];

	[self didAccessValueForKey:@"author"];
	return result;
}

@dynamic image;

@dynamic note;

- (NSMutableSet*)noteSet {
	[self willAccessValueForKey:@"note"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"note"];

	[self didAccessValueForKey:@"note"];
	return result;
}

@dynamic pdf;

@dynamic tag;

- (NSMutableSet*)tagSet {
	[self willAccessValueForKey:@"tag"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"tag"];

	[self didAccessValueForKey:@"tag"];
	return result;
}

@end


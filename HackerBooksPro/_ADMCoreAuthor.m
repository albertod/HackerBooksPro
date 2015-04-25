// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ADMCoreAuthor.m instead.

#import "_ADMCoreAuthor.h"

const struct ADMCoreAuthorAttributes ADMCoreAuthorAttributes = {
	.name = @"name",
};

const struct ADMCoreAuthorRelationships ADMCoreAuthorRelationships = {
	.book = @"book",
};

@implementation ADMCoreAuthorID
@end

@implementation _ADMCoreAuthor

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Author" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Author";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Author" inManagedObjectContext:moc_];
}

- (ADMCoreAuthorID*)objectID {
	return (ADMCoreAuthorID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic name;

@dynamic book;

- (NSMutableSet*)bookSet {
	[self willAccessValueForKey:@"book"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"book"];

	[self didAccessValueForKey:@"book"];
	return result;
}

@end


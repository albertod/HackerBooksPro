// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ADMCoreTag.m instead.

#import "_ADMCoreTag.h"

const struct ADMCoreTagAttributes ADMCoreTagAttributes = {
	.tagName = @"tagName",
};

const struct ADMCoreTagRelationships ADMCoreTagRelationships = {
	.book = @"book",
};

@implementation ADMCoreTagID
@end

@implementation _ADMCoreTag

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Tag" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Tag";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Tag" inManagedObjectContext:moc_];
}

- (ADMCoreTagID*)objectID {
	return (ADMCoreTagID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic tagName;

@dynamic book;

- (NSMutableSet*)bookSet {
	[self willAccessValueForKey:@"book"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"book"];

	[self didAccessValueForKey:@"book"];
	return result;
}

@end


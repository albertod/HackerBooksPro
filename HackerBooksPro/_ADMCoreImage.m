// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ADMCoreImage.m instead.

#import "_ADMCoreImage.h"

const struct ADMCoreImageAttributes ADMCoreImageAttributes = {
	.imageData = @"imageData",
};

const struct ADMCoreImageRelationships ADMCoreImageRelationships = {
	.book = @"book",
};

@implementation ADMCoreImageID
@end

@implementation _ADMCoreImage

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Image" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Image";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Image" inManagedObjectContext:moc_];
}

- (ADMCoreImageID*)objectID {
	return (ADMCoreImageID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic imageData;

@dynamic book;

@end


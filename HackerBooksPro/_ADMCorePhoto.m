// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ADMCorePhoto.m instead.

#import "_ADMCorePhoto.h"

const struct ADMCorePhotoAttributes ADMCorePhotoAttributes = {
	.photoData = @"photoData",
};

const struct ADMCorePhotoRelationships ADMCorePhotoRelationships = {
	.note = @"note",
};

@implementation ADMCorePhotoID
@end

@implementation _ADMCorePhoto

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Photo";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Photo" inManagedObjectContext:moc_];
}

- (ADMCorePhotoID*)objectID {
	return (ADMCorePhotoID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic photoData;

@dynamic note;

@end


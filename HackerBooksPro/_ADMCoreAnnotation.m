// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ADMCoreAnnotation.m instead.

#import "_ADMCoreAnnotation.h"

const struct ADMCoreAnnotationAttributes ADMCoreAnnotationAttributes = {
	.creationDate = @"creationDate",
	.modificationDate = @"modificationDate",
	.name = @"name",
	.text = @"text",
};

const struct ADMCoreAnnotationRelationships ADMCoreAnnotationRelationships = {
	.book = @"book",
	.photo = @"photo",
};

@implementation ADMCoreAnnotationID
@end

@implementation _ADMCoreAnnotation

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Annotation" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Annotation";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Annotation" inManagedObjectContext:moc_];
}

- (ADMCoreAnnotationID*)objectID {
	return (ADMCoreAnnotationID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic creationDate;

@dynamic modificationDate;

@dynamic name;

@dynamic text;

@dynamic book;

@dynamic photo;

@end


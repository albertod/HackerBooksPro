// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ADMCorePDF.m instead.

#import "_ADMCorePDF.h"

const struct ADMCorePDFAttributes ADMCorePDFAttributes = {
	.pdfData = @"pdfData",
};

const struct ADMCorePDFRelationships ADMCorePDFRelationships = {
	.book = @"book",
};

@implementation ADMCorePDFID
@end

@implementation _ADMCorePDF

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"PDF" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"PDF";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"PDF" inManagedObjectContext:moc_];
}

- (ADMCorePDFID*)objectID {
	return (ADMCorePDFID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic pdfData;

@dynamic book;

@end


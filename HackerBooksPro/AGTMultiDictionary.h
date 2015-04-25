//
//  AGTMultiDictionary.h
//  HackerBooks
//
//  Created by Fernando Rodríguez Romero on 11/04/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//
/**
 Contains a set of objects for each key.
 */
#import <Foundation/Foundation.h>

@interface AGTMultiDictionary : NSObject

+(instancetype)dictionary;

-(void) addObject:(id) object forKey:(id<NSCopying>) key;
-(NSSet *) objectsForKey:(id<NSCopying>) key;

-(void) removeObject:(id)object forKey:(id<NSCopying>)key;

-(NSUInteger) count;
-(NSArray*) allKeys;

@end

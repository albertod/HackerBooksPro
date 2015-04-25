//
//  ADMCoreBaseClass.m
//  HackerBooks
//
//  Created by Alberto Di Martino on 4/16/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#import "ADMCoreBaseClass.h"

@interface ADMCoreBaseClass ()


@end


@implementation ADMCoreBaseClass

+(NSArray *) observableKeyNames{
    
    return @[]; //Method to be overwritten by subclasses
}


#pragma mark -Lyfecyle

/*CoreData manages the whole lyfecycle of objects during running time, but we can know the different stage of it. CoreData (as ViewController) sends messages to objects of the type shoud,did,will but with different names */


//Call the first time an object is created (only executed 1 time on the whole program)
-(void) awakeFromInsert{
    
    [super awakeFromInsert];
    [self setupKVO];
    
}


//Called on NSManagedObject everytime it is created/or come back from fault an object (searched object for example),
//(it is called n times)

-(void) awakeFromFetch{
    [super awakeFromFetch];
    [self setupKVO];
    
}

//When object is going to be destroyed
-(void) willTurnIntoFault{
    
    [super willTurnIntoFault];
    [self tearDownKVO];
    
}

#pragma mark - KVO
-(void) setupKVO{
    
    // Observamos todas las propiedades EXCEPTO modificationDate
    for (NSString *key in [[self class] observableKeyNames]) {
        
        [self addObserver:self
               forKeyPath:key
                  options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew
                  context:NULL];
        
    }
    
}

-(void) tearDownKVO{
    // me doy de baja de todas las notificaciones
    for (NSString *key in [[self class] observableKeyNames]) {
        
        [self removeObserver:self
                  forKeyPath:key];
    }
}



@end

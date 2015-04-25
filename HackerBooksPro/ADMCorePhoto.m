#import "ADMCorePhoto.h"

@interface ADMCorePhoto ()

// Private interface goes here.

@end

@implementation ADMCorePhoto


-(void) setPhoto:(UIImage *)photo{
    
    // Convertir la UIImage en un NSData
    self.photoData = UIImageJPEGRepresentation(photo, 0.9);
}

-(UIImage *) photo{
    
    // Convertir la NSData en UIImage
    return [UIImage imageWithData:self.photoData];
}

@end

#import "ADMCoreImage.h"

@interface ADMCoreImage ()

// Private interface goes here.

@end

@implementation ADMCoreImage


-(void) setImage:(UIImage *)image{
    
    // Convertir la UIImage en un NSData
    self.imageData = UIImageJPEGRepresentation(image, 0.9);
}

-(UIImage *) image{
    
    // Convertir la NSData en UIImage
    return [UIImage imageWithData:self.imageData];
}

@end

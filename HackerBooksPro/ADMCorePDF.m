#import "ADMCorePDF.h"

@interface ADMCorePDF ()

// Private interface goes here.

@end

@implementation ADMCorePDF

-(void) setPdfData:(NSData *)pdfData{
    
    self.pdfData = pdfData;
    
}


-(NSData *)pdfData{
    
    return self.pdfData;
}



@end

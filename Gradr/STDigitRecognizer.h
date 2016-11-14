//
//  digitrecognizer.h
//  Gradr
//
//  Created by Sarat Tallamraju on 11/13/16.
//  Copyright © 2016 Sarat Tallamraju. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STDigitRecognizer : NSObject

-(instancetype) initWithString: (NSString*) inputString;

-(NSString*) getClassifierFilename;

@end

//
//  digitrecognizer.m
//  Gradr
//
//  Created by Sarat Tallamraju on 11/13/16.
//  Copyright © 2016 Sarat Tallamraju. All rights reserved.
//

#import "SRTDigitRecognizer.h"
#include "digitrecognizerwrapper.h"

@interface SRTDigitRecognizer () {
    DigitRecognizerCpp *digitRecognizer;
}

@end

@implementation SRTDigitRecognizer

-(instancetype) initWithString: (NSString*) inputString {
    self = [super init];
    if (self) {
        digitRecognizer = newDigitRecognizer([inputString cStringUsingEncoding:NSASCIIStringEncoding]);
    }
    return self;
}

-(NSString*) getInputString {
    const char* inputString = DigitRecognizer_getInputString(digitRecognizer);
    return [NSString stringWithUTF8String: inputString];
}

-(void) dealloc {
    deleteDigitRecognizer(digitRecognizer);
}

@end

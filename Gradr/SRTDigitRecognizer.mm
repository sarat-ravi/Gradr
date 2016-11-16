//
//  digitrecognizer.m
//  Gradr
//
//  Created by Sarat Tallamraju on 11/13/16.
//  Copyright © 2016 Sarat Tallamraju. All rights reserved.
//

#import "SRTDigitRecognizer.h"
#include "digitrecognizer.hpp"
#include "OpenCV2/opencv.hpp"

@interface SRTDigitRecognizer () {
    std::shared_ptr<srt::DigitRecognizer> digitRecognizer;
}

@end

@implementation SRTDigitRecognizer

-(instancetype) initWithString: (NSString*) inputString {
    self = [super init];
    if (self) {
        digitRecognizer = std::make_shared<srt::DigitRecognizer>([inputString cStringUsingEncoding:NSASCIIStringEncoding]);
    }
    return self;
}

-(int) recognizeDigitFromImage: (UIImage*) image atFrame: (CGRect) bounds {
    return 7;
}

-(NSString*) getInputString {
    const char* inputString = digitRecognizer->getInputString().c_str();
    return [NSString stringWithUTF8String: inputString];
}

@end

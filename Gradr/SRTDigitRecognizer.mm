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

- (cv::Mat)cvMatFromUIImage:(UIImage *)image {
    CGColorSpaceRef colorSpace = CGImageGetColorSpace(image.CGImage);
    CGFloat cols = image.size.width;
    CGFloat rows = image.size.height;

    cv::Mat cvMat(rows, cols, CV_8UC4); // 8 bits per component, 4 channels (color channels + alpha)

    CGContextRef contextRef = CGBitmapContextCreate(cvMat.data,                 // Pointer to  data
                                                 cols,                       // Width of bitmap
                                                 rows,                       // Height of bitmap
                                                 8,                          // Bits per component
                                                 cvMat.step[0],              // Bytes per row
                                                 colorSpace,                 // Colorspace
                                                 kCGImageAlphaNoneSkipLast |
                                                 kCGBitmapByteOrderDefault); // Bitmap info flags

    CGContextDrawImage(contextRef, CGRectMake(0, 0, cols, rows), image.CGImage);
    CGContextRelease(contextRef);

    return cvMat;
}

- (cv::Rect)cvRectFromCGRect:(CGRect) rect {
    cv::Rect cvRect(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    return cvRect;
}


-(int) recognizeDigitFromImage: (UIImage*) image atFrame: (CGRect) bounds {
    cv::Mat mat = [self cvMatFromUIImage: image];
    cv::Rect rect = [self cvRectFromCGRect: bounds];
    return digitRecognizer->recognizeDigit(mat, rect);
}

-(NSString*) getInputString {
    const char* inputString = digitRecognizer->getInputString().c_str();
    return [NSString stringWithUTF8String: inputString];
}

@end

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
    std::shared_ptr<cv::Mat> inputMat;
    std::shared_ptr<cv::Mat> processedMat;
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

- (std::shared_ptr<cv::Mat>)cvMatFromUIImage:(UIImage *)image {
    CGColorSpaceRef colorSpace = CGImageGetColorSpace(image.CGImage);
    CGFloat cols = image.size.width;
    CGFloat rows = image.size.height;

    std::shared_ptr<cv::Mat> cvMat = std::make_shared<cv::Mat>(rows, cols, CV_8UC4); // 8 bits per component, 4 channels (color channels + alpha)

    CGContextRef contextRef = CGBitmapContextCreate(cvMat->data,                 // Pointer to  data
                                                 cols,                       // Width of bitmap
                                                 rows,                       // Height of bitmap
                                                 8,                          // Bits per component
                                                 cvMat->step[0],              // Bytes per row
                                                 colorSpace,                 // Colorspace
                                                 kCGImageAlphaNoneSkipLast |
                                                 kCGBitmapByteOrderDefault); // Bitmap info flags

    CGContextDrawImage(contextRef, CGRectMake(0, 0, cols, rows), image.CGImage);
    // CGContextRelease(contextRef);

    return cvMat;
}

- (cv::Rect)cvRectFromCGRect:(CGRect) rect {
    cv::Rect cvRect(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    return cvRect;
}

- (std::shared_ptr<cv::Mat>) dilateMat: (std::shared_ptr<cv::Mat>) mat {
    int dilationSize = 10;
    cv::Mat element = cv::getStructuringElement(cv::MORPH_RECT,
                              cv::Size(2*dilationSize + 1, 2*dilationSize+1), cv::Point(dilationSize, dilationSize));
    
    std::shared_ptr<cv::Mat> dilatedMat = std::make_shared<cv::Mat>();
    cv::dilate(*mat, *dilatedMat, element);
    return dilatedMat;
}

- (std::shared_ptr<cv::Mat>) resizeMat: (std::shared_ptr<cv::Mat>) mat {
    cv::Size targetSize(28, 28);
    std::shared_ptr<cv::Mat> targetMat = std::make_shared<cv::Mat>();
    cv::resize(*mat, *targetMat, targetSize);
    return targetMat;
}

- (std::shared_ptr<cv::Mat>) convertToGray: (std::shared_ptr<cv::Mat>) mat {
    std::shared_ptr<cv::Mat> targetMatGray = std::make_shared<cv::Mat>();
    cv::cvtColor(*mat, *targetMatGray, CV_RGB2GRAY);
    return targetMatGray;
}

- (std::shared_ptr<cv::Mat>) invertMat: (std::shared_ptr<cv::Mat>) mat {
    std:cv::Mat invertedTargetMatGray = cv::Scalar::all(255) - *mat;
    std::shared_ptr<cv::Mat> invertedTargetMatGrayPtr = std::make_shared<cv::Mat>(invertedTargetMatGray);
    return invertedTargetMatGrayPtr;
}

- (std::shared_ptr<cv::Mat>)processMat:(std::shared_ptr<cv::Mat>) imageMat {
    // Dialate
    // Resize
    // Convert to grayscale
    // Invert
    
    std::shared_ptr<cv::Mat> mat = imageMat;
    
    mat = [self invertMat: mat];
    mat = [self dilateMat: mat];
    mat = [self resizeMat: mat];
    mat = [self convertToGray: mat];
    processedMat = mat;
    
    return mat;
}


-(UIImage *)getInputImage {
    return [self getUIImageFromCVMat: inputMat];
}

-(UIImage *)getProcessedImage {
    return [self getUIImageFromCVMat: processedMat];
}

-(UIImage *)getUIImageFromCVMat:(std::shared_ptr<cv::Mat>)cvMat
{
    NSData *data = [NSData dataWithBytes:cvMat->data length:cvMat->elemSize()*cvMat->total()];
    CGColorSpaceRef colorSpace;
    
    if (cvMat->elemSize() == 1) {
        colorSpace = CGColorSpaceCreateDeviceGray();
    } else {
        colorSpace = CGColorSpaceCreateDeviceRGB();
    }
    
    CGDataProviderRef provider = CGDataProviderCreateWithCFData((__bridge CFDataRef)data);
    
    // Creating CGImage from cv::Mat
    CGImageRef imageRef = CGImageCreate(cvMat->cols,                                 //width
                                        cvMat->rows,                                 //height
                                        8,                                          //bits per component
                                        8 * cvMat->elemSize(),                       //bits per pixel
                                        cvMat->step[0],                            //bytesPerRow
                                        colorSpace,                                 //colorspace
                                        kCGImageAlphaNone|kCGBitmapByteOrderDefault,// bitmap info
                                        provider,                                   //CGDataProviderRef
                                        NULL,                                       //decode
                                        false,                                      //should interpolate
                                        kCGRenderingIntentDefault                   //intent
                                        );
    
    
    // Getting UIImage from CGImage
    UIImage *finalImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    CGDataProviderRelease(provider);
    CGColorSpaceRelease(colorSpace);
    
    return finalImage;
}


-(int) recognizeDigitFromImage: (UIImage*) image atFrame: (CGRect) bounds {
    std::shared_ptr<cv::Mat> mat = [self cvMatFromUIImage: image];
    // NOTE: inputMat and procesedMat are used for debugging purposes.
    inputMat = mat;
    cv::Rect rect = [self cvRectFromCGRect: bounds];
    std::shared_ptr<cv::Mat> processedMatPtr = [self processMat: mat];
    return digitRecognizer->recognizeDigit(processedMatPtr, rect);
}

-(NSString*) getInputString {
    const char* inputString = digitRecognizer->getInputString().c_str();
    return [NSString stringWithUTF8String: inputString];
}

@end

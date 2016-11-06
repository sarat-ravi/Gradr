//
//  CanvasView.h
//  Gradr
//
//  Created by Sarat Tallamraju on 11/5/16.
//  Copyright © 2016 Sarat Tallamraju. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>

@interface CanvasView : GLKView

@property (assign, nonatomic) UIColor *strokeColor;
@property (assign, nonatomic) BOOL hasSignature;
@property (strong, nonatomic) UIImage *signatureImage;

- (void)erase;

@end

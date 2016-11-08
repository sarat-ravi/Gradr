//
//  CanvasView.h
//  Gradr
//
//  Created by Sarat Tallamraju on 11/5/16.
//  Copyright © 2016 Sarat Tallamraju. All rights reserved.
//

#pragma once

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>

@protocol CanvasViewDelegate<NSObject>
@optional

-(void) onDrawAtLocation:(CGPoint)location translation:(CGPoint)translation velocity:(CGPoint)velocity;
-(void) onDrawingFinished;

@end

@interface CanvasView : GLKView

@property (assign, nonatomic) UIColor *strokeColor;
@property (assign, nonatomic) BOOL hasDrawing;
@property (strong, nonatomic) UIImage *drawnImage;

@property (weak, nonatomic) id<CanvasViewDelegate> canvasDelegate;

- (void)erase;

@end

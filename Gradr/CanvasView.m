//
//  CanvasView.m
//  Gradr
//
//  Created by Sarat Tallamraju on 11/5/16.
//  Copyright © 2016 Sarat Tallamraju. All rights reserved.
//

#import "CanvasView.h"

@implementation CanvasView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initComponents];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder: aDecoder];
    if (self) {
        [self initComponents];
    }
    return self;
}

- (void)initComponents {
    UINib *nib = [UINib nibWithNibName: @"CanvasView" bundle:nil];
    [nib instantiateWithOwner: self options:nil];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onDrawing:)];
    [self addGestureRecognizer:panGesture];
}

- (IBAction)onDrawing:(UIPanGestureRecognizer *)sender {
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            NSLog(@"Started");
            break;
        case UIGestureRecognizerStateChanged:
            NSLog(@"Changed");
            CGPoint delta = [sender translationInView: self];
            break;
        case UIGestureRecognizerStateEnded:
            NSLog(@"Ended");
            CGPoint velocity = [sender velocityInView: self];
            break;
        default:
            break;
    }
}

@end

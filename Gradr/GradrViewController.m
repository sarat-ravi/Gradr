//
//  GradrViewController.m
//  Gradr
//
//  Created by Sarat Tallamraju on 11/2/16.
//  Copyright © 2016 Sarat Tallamraju. All rights reserved.
//

#import "GradrViewController.h"
#import "CanvasView.h"

@interface GradrViewController ()
@property (strong, nonatomic) IBOutlet UILabel *totalScoreLabel;
@property (strong, nonatomic) IBOutlet CanvasView *canvasView;
@property (strong, nonatomic) IBOutlet UIImageView *debugOutputImage;

// @property (strong, nonatomic) G8Tesseract *tesseract;

@end

@implementation GradrViewController

- (IBAction)onEraseButtonClicked:(id)sender {
    NSLog(@"Erase button clicked");
    [self onImageDrawnOnCanvas: self.canvasView];
}

- (void)onImageDrawnOnCanvas: (CanvasView*) canvasView {
    UIImage *image = canvasView.drawnImage;
    float number = [self recognizeNumberFromImage: image];
    [canvasView erase];
}

- (float)recognizeNumberFromImage: (UIImage*)image {
    G8Tesseract *tesseract = [[G8Tesseract alloc] initWithLanguage: @"eng"];
    tesseract.delegate = self;
    tesseract.charWhitelist = @"0123456789";
    tesseract.image = image;
    [tesseract recognize];
    
    NSLog(@"recognized text: %@", [tesseract recognizedText]);
    
    NSArray *characterBoxes = [tesseract recognizedBlocksByIteratorLevel:G8PageIteratorLevelSymbol];
    UIImage *imageWithBlocks = [tesseract imageWithBlocks:characterBoxes drawText:YES thresholded:NO];
    self.debugOutputImage.image = imageWithBlocks;
    
    return 0.0;
}

- (void)progressImageRecognitionForTesseract:(G8Tesseract *)tesseract {
    NSLog(@"recognition progress: %lu", (unsigned long)tesseract.progress);
}

- (BOOL)shouldCancelImageRecognitionForTesseract:(G8Tesseract *)tesseract {
    return NO;  // return YES, if you need to interrupt tesseract before it finishes
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // self.tesseract.maximumRecognitionTime = 2.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

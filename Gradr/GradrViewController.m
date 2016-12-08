//
//  GradrViewController.m
//  Gradr
//
//  Created by Sarat Tallamraju on 11/2/16.
//  Copyright © 2016 Sarat Tallamraju. All rights reserved.
//

#import "GradrViewController.h"
#import "SRTDigitRecognizer.h"
#import "CanvasView.h"

@interface GradrViewController ()
@property (strong, nonatomic) IBOutlet UILabel *totalScoreLabel;
@property (strong, nonatomic) SRTDigitRecognizer *digitRecognizer;
@property (strong, nonatomic) IBOutlet CanvasView *canvasView;

// Left and right images for debugging purposes.
@property (strong, nonatomic) IBOutlet UIImageView *leftImage;
@property (strong, nonatomic) IBOutlet UIImageView *rightImage;

@end

@implementation GradrViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Get path of classifier.
    NSString* resourcePath = [[NSBundle mainBundle] resourcePath];
    NSString * knowledgePath = [resourcePath stringByAppendingPathComponent:@"Knowledge"];
    NSString * classifierPath = [knowledgePath stringByAppendingPathComponent:@"trainedHandwrittenDigitsClassifier.yml"];
    NSLog(@"Classifier Path: %@", classifierPath);
    
    // Initialize Digit recognizer.
    self.digitRecognizer = [[SRTDigitRecognizer alloc] initWithString: classifierPath];
}

- (IBAction)onEraseButtonClicked:(id)sender {
    NSLog(@"Erase button clicked");
    UIImage *canvasImage = self.canvasView.drawing;
    int recognizedNumber = [self.digitRecognizer recognizeDigitFromImage: canvasImage atFrame: self.canvasView.frame];
    NSLog(@"Recognized digit: %i", recognizedNumber);
    
    [self.leftImage setImage: [self.digitRecognizer getInputImage]];
    [self.rightImage setImage: [self.digitRecognizer getProcessedImage]];
    [self.canvasView erase];
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

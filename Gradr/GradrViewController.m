//
//  GradrViewController.m
//  Gradr
//
//  Created by Sarat Tallamraju on 11/2/16.
//  Copyright © 2016 Sarat Tallamraju. All rights reserved.
//

#import "GradrViewController.h"

@interface GradrViewController ()
@property (strong, nonatomic) IBOutlet UILabel *totalScoreLabel;

@end

@implementation GradrViewController

- (IBAction)onEraseButtonClicked:(id)sender {
    NSLog(@"Erase button clicked");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

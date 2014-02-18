//
//  SettingsViewController.m
//  TipCal
//
//  Created by Deepak Agrawal on 2/17/14.
//  Copyright (c) 2014 Deepak Agrawal. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *defaultTip;
- (IBAction)onTap:(id)sender;
-(void) persistDefaultValue;
- (IBAction)defaultTipChange:(id)sender;

- (int)getDefaultTipPercentage;
- (void) updateValues;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateValues];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self persistDefaultValue];
}

- (void)persistDefaultValue {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    float defaultPercentage = [self.defaultTip.text integerValue];
    
    [defaults setInteger:defaultPercentage forKey:@"defaultTip"];
    [defaults synchronize];
}

- (IBAction)defaultTipChange:(id)sender {
        [self persistDefaultValue];
}

- (int)getDefaultTipPercentage {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultTip = [defaults integerForKey:@"defaultTip"];
    return defaultTip;
}
- (void)updateValues{
    self.defaultTip.text = [NSString stringWithFormat:@"%d", [self getDefaultTipPercentage]];
}
@end

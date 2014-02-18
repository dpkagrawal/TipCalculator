//
//  TipViewController.m
//  TipCal
//
//  Created by Deepak Agrawal on 2/17/14.
//  Copyright (c) 2014 Deepak Agrawal. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
- (IBAction)onTap:(id)sender;

- (void) updateValues;
- (void) onSettingsButton;
- (float) getDefaultTipPercentage;
@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateValues];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues {
    float billAmount = [self.billTextField.text floatValue];
    
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
    
    float defaultTip = [self getDefaultTipPercentage];

    float tipAmount;
    if(defaultTip != 0)
    {
        tipAmount = billAmount * (defaultTip/100);
    }
    else
    {
        tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];

    }
    
    float totalAmount = billAmount + tipAmount;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
    
}

- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

- (float)getDefaultTipPercentage {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    float defaultTip = [defaults floatForKey:@"defaultTip"];
    return defaultTip;
}
@end

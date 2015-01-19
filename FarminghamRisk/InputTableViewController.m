//
//  InputTableViewController.m
//  FarminghamRisk
//
//  Created by Amogh Param on 1/17/15.
//  Copyright (c) 2015 Amogh Param. All rights reserved.
//

#import "InputTableViewController.h"
#import "ScoreModel.h"
#import "OutputTableViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "DetailTableViewController.h"


@interface InputTableViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *smokerField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *medicationField;

@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (weak, nonatomic) IBOutlet UITextField *totalCholesterolField;
@property (weak, nonatomic) IBOutlet UITextField *HDLCholesterolField;
@property (weak, nonatomic) IBOutlet UITextField *systolicBloodPressureField;

@property (nonatomic,strong) ScoreModel *scoreModel;

@end

@implementation InputTableViewController

-(ScoreModel *)scoreModel{
    if(!_scoreModel){
        _scoreModel = [[ScoreModel alloc] initWithAge:0 gender:MALE totalCholesterol:0 HDLCholesterol:0 smoker:YES systolicBloodPressure:0 medication:YES];
    }
    return _scoreModel;
}

- (IBAction)ageChanged:(id)sender {
    UITextField *textField = (UITextField *) sender;
    NSString *ageText = textField.text;
    if([self hasIllegalCharactersForString:ageText] ||
       [ageText isEqualToString:@""] ||
       [self fieldNotInRange: @"age"])
    {
        [self markTextField:self.ageField as:NO];
    }
    else if (![ageText isEqualToString:@""]) {
        [self markTextField:self.ageField as:YES];
        self.scoreModel.age = [NSNumber numberWithInt:[ageText intValue]];
    }
}

- (IBAction)genderSwitch:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    self.scoreModel.gender = selectedSegment;
}

- (IBAction)totalCholesterolChanged:(id)sender {
    UITextField *textField = (UITextField *) sender;
    NSString *totalCholesterolText = textField.text;
    if([self hasIllegalCharactersForString:totalCholesterolText] ||
       [totalCholesterolText isEqualToString:@""] ||
       [self fieldNotInRange: @"totalCholesterol"])
    {
        [self markTextField:self.totalCholesterolField as:NO];
    }
    else if (![totalCholesterolText isEqualToString:@""]) {
        [self markTextField:self.totalCholesterolField as:YES];
        self.scoreModel.totalCholesterol = [NSNumber numberWithInt:[totalCholesterolText intValue]];
    }
}

- (IBAction)HDLCholesterolChanged:(id)sender {
    UITextField *textField = (UITextField *) sender;
    NSString *HDLCholesterolText = textField.text;
    if([self hasIllegalCharactersForString:HDLCholesterolText] ||
       [HDLCholesterolText isEqualToString:@""] ||
       [self fieldNotInRange: @"HDLCholesterol"])
    {
        [self markTextField:self.HDLCholesterolField as:NO];
    }
    else if (![HDLCholesterolText isEqualToString:@""]) {
        [self markTextField:self.HDLCholesterolField as:YES];
        self.scoreModel.HDLCholesterol = [NSNumber numberWithInt:[HDLCholesterolText intValue]];
    }
    
    
}

- (IBAction)systolicBloodPressureChanged:(id)sender {
    UITextField *textField = (UITextField *) sender;
    NSString *systolicBloodPressureText = textField.text;
    if([self hasIllegalCharactersForString:systolicBloodPressureText] ||
       [systolicBloodPressureText isEqualToString:@""] ||
       [self fieldNotInRange: @"systolicBloodPressure"])
    {
        [self markTextField:self.systolicBloodPressureField as:NO];
    }
    else if (![systolicBloodPressureText isEqualToString:@""]) {
        [self markTextField:self.systolicBloodPressureField as:YES];
        self.scoreModel.systolicBloodPressure = [NSNumber numberWithInt:[systolicBloodPressureText intValue]];
    }
}

- (IBAction)smokingSwitch:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    self.scoreModel.smoker = !(BOOL)selectedSegment;
    
}

- (IBAction)medicationSwitch:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    self.scoreModel.medication = !(BOOL)selectedSegment;
}


-(void)awakeFromNib{
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:133/255.0f green:203/255.0f blue:255/255.0f alpha:1]];
    self.scoreModel = [[ScoreModel alloc] initWithAge:0 gender:MALE totalCholesterol:0 HDLCholesterol:0 smoker:YES systolicBloodPressure:0 medication:YES];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    BOOL shouldPerformSegue = YES;
    if([identifier isEqualToString:@"Calculate"]){
        
        if ([self.ageField.text isEqualToString:@""] || [self hasIllegalCharactersForString:self.ageField.text]) {
            [self markTextField: self.ageField as:NO];
            shouldPerformSegue = NO;
        }
        
        if ([self.totalCholesterolField.text isEqualToString:@""] || [self hasIllegalCharactersForString:self.totalCholesterolField.text]) {
            [self markTextField: self.totalCholesterolField as:NO];
            shouldPerformSegue = NO;
        }
        
        if ([self.HDLCholesterolField.text isEqualToString:@""] || [self hasIllegalCharactersForString:self.HDLCholesterolField.text]) {
            [self markTextField: self.HDLCholesterolField as:NO];
            shouldPerformSegue = NO;
        }
        
        if ([self.systolicBloodPressureField.text isEqualToString:@""] || [self hasIllegalCharactersForString:self.systolicBloodPressureField.text]) {
            [self markTextField: self.systolicBloodPressureField as:NO];
            shouldPerformSegue = NO;
        }
        
        if ([self fieldNotInRange:@"age"] ||
            [self fieldNotInRange:@"totalCholesterol"] ||
            [self fieldNotInRange:@"HDLCholesterol"] ||
            [self fieldNotInRange:@"systolicBloodPressure"]) {
            shouldPerformSegue = NO;
        }
        
        return shouldPerformSegue;
    }
    return YES;
}

-(BOOL)hasIllegalCharactersForString:(NSString *)string{
    NSCharacterSet *s = [NSCharacterSet characterSetWithCharactersInString:@"1234567890."];
    s = [s invertedSet];
    NSRange r = [string rangeOfCharacterFromSet:s];
    if(r.location != NSNotFound){
        return YES;
    }
    return NO;
}

-(void)markTextField:(UITextField *)textField as:(BOOL)correctness{
    textField.layer.cornerRadius=8.0f;
    textField.layer.masksToBounds=YES;
    textField.layer.borderWidth= 1.0f;
    if (correctness) {
        textField.layer.borderColor=[[UIColor colorWithRed:133/255.0f green:203/255.0f blue:255/255.0f alpha:1] CGColor];
    }
    else{
        textField.layer.borderColor=[[UIColor redColor]CGColor];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *destinationVC = segue.destinationViewController;

    if ([destinationVC isKindOfClass:[OutputTableViewController class]]) {
        [self.scoreModel calculateFarminghamScore];
        OutputTableViewController *outputVC = (OutputTableViewController *) destinationVC;
        outputVC.scoreModel = self.scoreModel;
    }
    
    if ([destinationVC isKindOfClass:[DetailTableViewController class]]) {
        DetailTableViewController *outputVC = (DetailTableViewController *) destinationVC;
        UITableViewCell *cell = (UITableViewCell *)sender;
        NSString *cellText = [NSString stringWithFormat: @"%@",cell.textLabel.text ];
        outputVC.titleText = cellText;
        if([cellText isEqualToString:@"Total Cholesterol"]){
            outputVC.detail = @"Total cholesterol is the sum of all the cholesterol in your blood. The higher your total cholesterol, the greater your risk for heart disease. Here are the total values that matter to you: \n\nLess than 200 mg/dL 'Desirable' level that puts you at lower risk for heart disease. A cholesterol level of 200 mg/dL or greater increases your risk. \n\n 200 to 239 mg/dL 'Borderline-high.' \n\n 240 mg/dL and above 'High' blood cholesterol. A person with this level has more than twice the risk of heart disease compared to someone whose cholesterol is below 200 mg/dL.";
            outputVC.color = [UIColor colorWithRed:255/255.0f green:133/255.0f blue:133/255.0f alpha:1];
        }
        else if([cell.textLabel.text isEqualToString:@"HDL Cholesterol"]){
            outputVC.detail = @"High density lipoproteins (HDL) is the 'good' cholesterol. HDL carry cholesterol in the blood from other parts of the body back to the liver, which leads to its removal from the body. So HDL help keep cholesterol from building up in the walls of the arteries. \n\nHere are the HDL-Cholesterol Levels that matter to you:\n\nLess than 40 mg/dL A major risk factor for heart disease\n\n40 to 59 mg/dL The higher your HDL, the better\n\n60 mg/dL and above An HDL of 60 mg/dL and above is considered protective against heart disease.";
            outputVC.color = [UIColor colorWithRed:133/255.0f green:255/255.0f blue:133/255.0f alpha:1];
        }
        else if([cell.textLabel.text isEqualToString:@"Systolic Blood Pressure"]){
            outputVC.detail = @"Systolic blood pressure is the first number of your blood pressure reading. For example, if your reading is 120/80 (120 over 80), your systolic blood pressure is 120. \n\n\n\n\n\n\n\n\n\n";
            outputVC.color = [UIColor colorWithRed:203/255.0f green:133/255.0f blue:203/255.0f alpha:1];
        }
        else if([cell.textLabel.text isEqualToString:@"Smoker"]){
            outputVC.titleText = @"Smoker?";
            outputVC.detail = @"Select “yes” if you have smoked any cigarettes in the past month. \n\n\n\n\n\n\n\n\n\n";
            outputVC.color = [UIColor colorWithRed:133/255.0f green:133/255.0f blue:133/255.0f alpha:1];
        }
    }
}

- (BOOL)fieldNotInRange: (NSString *)fieldType{
    if ([fieldType isEqualToString:[NSString stringWithFormat:@"age" ]]) {
        if([self.ageField.text integerValue] > 130){
            return YES;
        }
        return NO;
    }
    else if ([fieldType isEqualToString:[NSString stringWithFormat:@"totalCholesterol" ]]) {
        if([self.totalCholesterolField.text integerValue] < 130 || [self.totalCholesterolField.text integerValue] > 320){
            return YES;
        }
        return NO;
    }
    else if ([fieldType isEqualToString:[NSString stringWithFormat:@"HDLCholesterol" ]]) {
        if([self.HDLCholesterolField.text integerValue] < 20 || [self.HDLCholesterolField.text integerValue] > 100){
            return YES;
        }
        return NO;
    }
    else if ([fieldType isEqualToString:[NSString stringWithFormat:@"systolicBloodPressure" ]]) {
        if([self.systolicBloodPressureField.text integerValue] <  90 || [self.systolicBloodPressureField.text integerValue] > 200){
            return YES;
        }
        return NO;
    }
    return YES;
}

@end

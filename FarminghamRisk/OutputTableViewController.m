//
//  OutputTableViewController.m
//  FarminghamRisk
//
//  Created by Amogh Param on 1/17/15.
//  Copyright (c) 2015 Amogh Param. All rights reserved.
//

#import "OutputTableViewController.h"
#import "ScoreModel.h"

@interface OutputTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *percentageOfRisk;
@property (weak, nonatomic) IBOutlet UILabel *percentageCommentLabel;

@property (weak, nonatomic) IBOutlet UILabel *ageField;
@property (weak, nonatomic) IBOutlet UILabel *genderField;
@property (weak, nonatomic) IBOutlet UILabel *totalCholesterolField;
@property (weak, nonatomic) IBOutlet UILabel *HDLCholesterolField;
@property (weak, nonatomic) IBOutlet UILabel *systolicBloodPressureField;
@property (weak, nonatomic) IBOutlet UILabel *smokerField;
@property (weak, nonatomic) IBOutlet UILabel *medicationField;

@property (nonatomic,strong) ScoreModel *scoreModel;

@end

@implementation OutputTableViewController

-(void)viewWillAppear:(BOOL)animated{
    if (self.scoreModel!= nil) {
        self.ageField.text = [NSString stringWithFormat:@"%@ years",self.scoreModel.age];
        
        if(self.scoreModel.gender){
            self.genderField.text = [NSString stringWithFormat:@"Female"];
        }
        else{
            self.genderField.text = [NSString stringWithFormat:@"Male"];
        }
        
        self.totalCholesterolField.text = [NSString stringWithFormat:@"%@ mg/dL",self.scoreModel.totalCholesterol];
        self.HDLCholesterolField.text = [NSString stringWithFormat:@"%@ mg/dL",self.scoreModel.HDLCholesterol];
        self.systolicBloodPressureField.text = [NSString stringWithFormat:@"%@ mm/Hg",self.scoreModel.systolicBloodPressure];
        
        if (self.scoreModel.smoker) {
            self.smokerField.text = [NSString stringWithFormat:@"Yes"];
        }
        else{
            self.smokerField.text = [NSString stringWithFormat:@"No"];
        }
        if (self.scoreModel.medication) {
            self.medicationField.text = [NSString stringWithFormat:@"Yes"];
        }
        else{
            self.medicationField.text = [NSString stringWithFormat:@"No"];
        }
        
        if ([self.scoreModel.percentageOfRisk floatValue] == 0.0f) {
            self.percentageOfRisk.text = [NSString stringWithFormat:@"<%@%%",self.scoreModel.percentageOfRisk];
        }
        else if([self.scoreModel.percentageOfRisk floatValue] == 30.0f){
            self.percentageOfRisk.text = [NSString stringWithFormat:@">%@%%",self.scoreModel.percentageOfRisk];
        }
        else{
            self.percentageOfRisk.text = [NSString stringWithFormat:@"%@%%",self.scoreModel.percentageOfRisk];
        }
        self.percentageCommentLabel.text = [NSString stringWithFormat:@"Means %@ of 100 people with this level of risk will have a heart attack in the next 10 years.",self.scoreModel.percentageOfRisk];
    }
}

-(void)setScoreModel:(ScoreModel *)scoreModel{
    _scoreModel = scoreModel;
}

@end

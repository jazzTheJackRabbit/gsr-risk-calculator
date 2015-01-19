//
//  ScoreModel.m
//  FarminghamRisk
//
//  Created by Amogh Param on 1/17/15.
//  Copyright (c) 2015 Amogh Param. All rights reserved.
//

#import "ScoreModel.h"

@implementation ScoreModel

-(void)setPercentageOfRisk:(NSNumber *)percentageOfRisk{
    _percentageOfRisk = percentageOfRisk;
}

-(void) setAge:(NSNumber *)age
{
    if (age > 0)
    {
        _age = age;
    }
    else
    {
        NSLog(@"Age is negative or 0");
    }
}

-(void) setGender:(NSInteger)gender
{
    _gender = gender;
}

-(void) setHDLCholesterol:(NSNumber *)HDLCholesterol
{
    if(HDLCholesterol){
        _HDLCholesterol = HDLCholesterol;
    }
}

-(void) setSmoker:(BOOL)smoker
{
    _smoker = smoker;
}

-(void) setSystolicBloodPressure:(NSNumber *)systolicBloodPressure
{
    if(systolicBloodPressure){
        _systolicBloodPressure = systolicBloodPressure;
    }
}

-(void) setMedication:(BOOL)medication
{
    _medication = medication;
}


-(ScoreModel *) initWithAge: (NSNumber *)age
                     gender: (NSInteger) gender
           totalCholesterol: (NSNumber *) totalCholesterol
              HDLCholesterol: (NSNumber *) HDLCholesterol
                     smoker: (BOOL) smoker
      systolicBloodPressure: (NSNumber *) systolicBloodPressure
                 medication: (BOOL) medication

{
    self.age = age;
    self.gender = gender;
    self.totalCholesterol = totalCholesterol;
    self.HDLCholesterol = HDLCholesterol;
    self.smoker = smoker;
    self.systolicBloodPressure = systolicBloodPressure;
    self.medication = medication;
    return self;
}

-(void)calculateFarminghamScore{
    NSInteger points = 0;
    float percentage = 0.0f;
    /******************************
                  MALE
     ******************************/
    if (self.gender == MALE) {
        /*
         Age: 
         20–34 years: Minus 9 points. 
         35–39 years: Minus 4 points. 
         40–44 years: 0 points. 
         45–49 years: 3 points. 
         50–54 years: 6 points. 
         55–59 years: 8 points. 
         60–64 years: 10 points. 
         65–69 years: 11 points. 
         70–74 years: 12 points. 
         75–79 years: 13 points.
         */
        
        /*****************************/
        /* Age */
        /*****************************/
        
        if([self.age integerValue] >= 20 && [self.age integerValue] <= 34){
            points += -9;
        }
        else if([self.age integerValue] >= 35 && [self.age integerValue] <= 39){
            points += -4;
        }
        else if([self.age integerValue] >= 40 && [self.age integerValue] <= 44){
            points += 0;
        }
        else if([self.age integerValue] >= 45 && [self.age integerValue] <= 49){
            points += 3;
        }
        else if([self.age integerValue] >= 50 && [self.age integerValue] <= 54){
            points += 6;
        }
        else if([self.age integerValue] >= 55 && [self.age integerValue] <= 59){
            points += 8;
        }
        else if([self.age integerValue] >= 60 && [self.age integerValue] <= 64){
            points += 10;
        }
        else if([self.age integerValue] >= 65 && [self.age integerValue] <= 69){
            points += 11;
        }
        else if([self.age integerValue] >= 70 && [self.age integerValue] <= 74){
            points += 12;
        }
        else if([self.age integerValue] >= 75 && [self.age integerValue] <= 79){
            points += 13;
        }
        
        /*****************************/
        /* Age and Total Cholesterol */
        /*****************************/
        
        /*
         
         Total cholesterol, mg/dL: 
         Age 20–39 years: 
            Under 160: 0 points. 160-199: 4 points. 200-239: 7 points. 240-279: 9 points. 280 or higher: 11 points.
         */
        
        if([self.age integerValue] >= 20 && [self.age integerValue] <= 39){
            if ([self.totalCholesterol integerValue] < 160) {
                points += 0;
            }
            else if([self.totalCholesterol integerValue] >= 160 && [self.totalCholesterol integerValue] <= 199 ) {
                points += 4;
            }
            else if([self.totalCholesterol integerValue] >= 200 && [self.totalCholesterol integerValue] <= 239 ) {
                points += 7;
            }
            else if([self.totalCholesterol integerValue] >= 240 && [self.totalCholesterol integerValue] <= 279 ) {
                points += 9;
            }
            else if([self.totalCholesterol integerValue] >= 280) {
                points += 11;
            }
        }
        
        /*
         Age 40–49 years:
         Under 160: 0 points. 160-199: 3 points. 200-239: 5 points. 240-279: 6 points. 280 or higher: 8 points.
         */
        
        else if([self.age integerValue] >= 40 && [self.age integerValue] <= 49){
            if ([self.totalCholesterol integerValue] < 160) {
                points += 0;
            }
            else if([self.totalCholesterol integerValue] >= 160 && [self.totalCholesterol integerValue] <= 199 ) {
                points += 3;
            }
            else if([self.totalCholesterol integerValue] >= 200 && [self.totalCholesterol integerValue] <= 239 ) {
                points += 5;
            }
            else if([self.totalCholesterol integerValue] >= 240 && [self.totalCholesterol integerValue] <= 279 ) {
                points += 6;
            }
            else if([self.totalCholesterol integerValue] >= 280) {
                points += 8;
            }
        }
        
        /*
         Age 50–59 years:
         Under 160: 0 points. 160-199: 2 points. 200-239: 3 points. 240-279: 4 points. 280 or higher: 5 points.
         */
        
        else if([self.age integerValue] >= 50 && [self.age integerValue] <= 59){
            if ([self.totalCholesterol integerValue] < 160) {
                points += 0;
            }
            else if([self.totalCholesterol integerValue] >= 160 && [self.totalCholesterol integerValue] <= 199 ) {
                points += 2;
            }
            else if([self.totalCholesterol integerValue] >= 200 && [self.totalCholesterol integerValue] <= 239 ) {
                points += 3;
            }
            else if([self.totalCholesterol integerValue] >= 240 && [self.totalCholesterol integerValue] <= 279 ) {
                points += 4;
            }
            else if([self.totalCholesterol integerValue] >= 280) {
                points += 5;
            }
        }
        
        /*
         Age 60–69 years:
         Under 160: 0 points. 160-199: 1 point. 200-239: 1 point. 240-279: 2 points. 280 or higher: 3 points.
         */
        
        else if([self.age integerValue] >= 60 && [self.age integerValue] <= 69){
            if ([self.totalCholesterol integerValue] < 160) {
                points += 0;
            }
            else if([self.totalCholesterol integerValue] >= 160 && [self.totalCholesterol integerValue] <= 199 ) {
                points += 1;
            }
            else if([self.totalCholesterol integerValue] >= 200 && [self.totalCholesterol integerValue] <= 239 ) {
                points += 1;
            }
            else if([self.totalCholesterol integerValue] >= 240 && [self.totalCholesterol integerValue] <= 279 ) {
                points += 2;
            }
            else if([self.totalCholesterol integerValue] >= 280) {
                points += 3;
            }
        }
        /*
         Age 70–79 years:
         Under 160: 0 points. 160-199: 0 points. 200-239: 0 points. 240-279: 1 point. 280 or higher: 1 point.
         */
        else if([self.age integerValue] >= 70 && [self.age integerValue] <= 79){
            if ([self.totalCholesterol integerValue] < 160) {
                points += 0;
            }
            else if([self.totalCholesterol integerValue] >= 160 && [self.totalCholesterol integerValue] <= 199 ) {
                points += 0;
            }
            else if([self.totalCholesterol integerValue] >= 200 && [self.totalCholesterol integerValue] <= 239 ) {
                points += 0;
            }
            else if([self.totalCholesterol integerValue] >= 240 && [self.totalCholesterol integerValue] <= 279 ) {
                points += 1;
            }
            else if([self.totalCholesterol integerValue] >= 280) {
                points += 1;
            }
        }
        
        
        /*****************************/
        /* Smoker */
        /*****************************/
        /*
         If cigarette smoker: 
            Age 20–39 years: 8 points. 
            Age 40–49 years: 5 points. 
            Age 50–59 years: 3 points. 
            Age 60–69 years: 1 point. 
            Age 70–79 years: 1 point.
         
         All non smokers: 0 points.
         */
        
        if(self.smoker){
            if([self.age integerValue] >= 20 && [self.age integerValue] <= 39){
                points += 8;
            }
            else if([self.age integerValue] >= 40 && [self.age integerValue] <= 49){
                points += 5;
            }
            else if([self.age integerValue] >= 50 && [self.age integerValue] <= 59){
                points += 3;
            }
            else if([self.age integerValue] >= 60 && [self.age integerValue] <= 69){
                points += 1;
            }
            else if([self.age integerValue] >= 70 && [self.age integerValue] <= 79){
                points += 1;
            }
        }
        
        /*****************************/
        /* HDL Cholesterol */
        /*****************************/
        
        /*
         HDL cholesterol, mg/dL: 60 or higher: Minus 1 point. 50-59: 0 points. 40-49: 1 point. Under 40: 2 points.
         */
        
        if ([self.HDLCholesterol integerValue] >= 60) {
            points += -1;
        }
        else if([self.HDLCholesterol integerValue] >= 50 && [self.HDLCholesterol integerValue] <= 59 ) {
            points += 0;
        }
        else if([self.HDLCholesterol integerValue] >= 40 && [self.HDLCholesterol integerValue] <= 49 ) {
            points += 1;
        }
        else if([self.HDLCholesterol integerValue] < 40) {
            points += 2;
        }
        
        /*
         Systolic blood pressure, mm Hg: 
         Untreated: Under 120: 0 points. 120-129: 0 points. 130-139: 1 point. 140-159: 1 point. 160 or higher: 2 points. •
         */
        if (!self.medication) {
            if ([self.systolicBloodPressure integerValue] < 120) {
                points += 0;
            }
            else if([self.systolicBloodPressure integerValue] >= 120 && [self.systolicBloodPressure integerValue] <= 129 ) {
                points += 0;
            }
            else if([self.systolicBloodPressure integerValue] >= 130 && [self.systolicBloodPressure integerValue] <= 139 ) {
                points += 1;
            }
            else if([self.systolicBloodPressure integerValue] >= 140 && [self.systolicBloodPressure integerValue] <= 159 ) {
                points += 1;
            }
            else if([self.systolicBloodPressure integerValue] >= 160){
                points += 2;
            }
        }
        /*
         Treated: Under 120: 0 points. 120-129: 1 point. 130-139: 2 points. 140-159: 2 points. 160 or higher: 3 points.
         */
        else{
            if ([self.systolicBloodPressure integerValue] < 120) {
                points += 0;
            }
            else if([self.systolicBloodPressure integerValue] >= 120 && [self.systolicBloodPressure integerValue] <= 129 ) {
                points += 1;
            }
            else if([self.systolicBloodPressure integerValue] >= 130 && [self.systolicBloodPressure integerValue] <= 139 ) {
                points += 2;
            }
            else if([self.systolicBloodPressure integerValue] >= 140 && [self.systolicBloodPressure integerValue] <= 159 ) {
                points += 2;
            }
            else if([self.systolicBloodPressure integerValue] >= 160){
                points += 3;
            }
        }
        
        /*
         10-year risk in %: 
            Points total: 
         
         0 point: <1%. 
         1-4 points: 1%. 
         5-6 points: 2%. 
         7 points: 3%. 
         8 points: 4%. 
         9 points: 5%. 
         10 points: 6%. 
         11 points: 8%. 
         12 points: 10%. 
         13 points: 12%. 
         14 points: 16%. 
         15 points: 20%. 
         16 points: 25%. 
         17 points or more: Over 30%.[16]
         */
        
        if (points == 0) {
            percentage = 0.00f;
        }
        else if(points >= 1 && points <= 4 ) {
            percentage = 0.01f;
        }
        else if(points >= 5 && points <= 6 ) {
            percentage = 0.02f;
        }
        else if(points == 7) {
            percentage = 0.03f;
        }
        else if(points == 8) {
            percentage = 0.04f;
        }
        else if(points == 9) {
            percentage = 0.05f;
        }
        else if(points == 10) {
            percentage = 0.06f;
        }
        else if(points == 11) {
            percentage = 0.08f;
        }
        else if(points == 12) {
            percentage = 0.10f;
        }
        else if(points == 13) {
            percentage = 0.12f;
        }
        else if(points == 14) {
            percentage = 0.16f;
        }
        else if(points == 15) {
            percentage = 0.20f;
        }
        else if(points == 16) {
            percentage = 0.25f;
        }
        else if(points >= 17) {
            percentage = 0.30f;
        }
    }
    /******************************
                FEMALE
     ******************************/
    else{
        
        /*
         Age: 20–34 years: Minus 7 points.
         35–39 years: Minus 3 points.
         40–44 years: 0 points.
         45–49 years: 3 points.
         50–54 years: 6 points.
         55–59 years: 8 points.
         60–64 years: 10 points.
         65–69 years: 12 points.
         70–74 years: 14 points.
         75–79 years: 16 points.
         */
        
        /*****************************/
        /* Age */
        /*****************************/
        
        if([self.age integerValue] >= 20 && [self.age integerValue] <= 34){
            points += -7;
        }
        else if([self.age integerValue] >= 35 && [self.age integerValue] <= 39){
            points += -3;
        }
        else if([self.age integerValue] >= 40 && [self.age integerValue] <= 44){
            points += 0;
        }
        else if([self.age integerValue] >= 45 && [self.age integerValue] <= 49){
            points += 3;
        }
        else if([self.age integerValue] >= 50 && [self.age integerValue] <= 54){
            points += 6;
        }
        else if([self.age integerValue] >= 55 && [self.age integerValue] <= 59){
            points += 8;
        }
        else if([self.age integerValue] >= 60 && [self.age integerValue] <= 64){
            points += 10;
        }
        else if([self.age integerValue] >= 65 && [self.age integerValue] <= 69){
            points += 12;
        }
        else if([self.age integerValue] >= 70 && [self.age integerValue] <= 74){
            points += 14;
        }
        else if([self.age integerValue] >= 75 && [self.age integerValue] <= 79){
            points += 16;
        }
        
        /*****************************/
        /* Age and Total Cholesterol */
        /*****************************/
        
        /*
         
         Total cholesterol, mg/dL:
         Age 20–39 years:
         Under 160: 0 points.
         160-199: 4 points.
         200-239: 8 points.
         240-279: 11 points.
         280 or higher: 13 points.
         
         */
        
        if([self.age integerValue] >= 20 && [self.age integerValue] <= 39){
            if ([self.totalCholesterol integerValue] < 160) {
                points += 0;
            }
            else if([self.totalCholesterol integerValue] >= 160 && [self.totalCholesterol integerValue] <= 199 ) {
                points += 4;
            }
            else if([self.totalCholesterol integerValue] >= 200 && [self.totalCholesterol integerValue] <= 239 ) {
                points += 8;
            }
            else if([self.totalCholesterol integerValue] >= 240 && [self.totalCholesterol integerValue] <= 279 ) {
                points += 11;
            }
            else if([self.totalCholesterol integerValue] >= 280) {
                points += 13;
            }
        }
        
        /*
         • Age 40–49 years:
         Under 160: 0 points.
         160-199: 3 points.
         200-239: 6 points.
         240-279: 8 points.
         280 or higher: 10 points.
         */
        
        else if([self.age integerValue] >= 40 && [self.age integerValue] <= 49){
            if ([self.totalCholesterol integerValue] < 160) {
                points += 0;
            }
            else if([self.totalCholesterol integerValue] >= 160 && [self.totalCholesterol integerValue] <= 199 ) {
                points += 3;
            }
            else if([self.totalCholesterol integerValue] >= 200 && [self.totalCholesterol integerValue] <= 239 ) {
                points += 6;
            }
            else if([self.totalCholesterol integerValue] >= 240 && [self.totalCholesterol integerValue] <= 279 ) {
                points += 8;
            }
            else if([self.totalCholesterol integerValue] >= 280) {
                points += 10;
            }
        }
        
        /*
         • Age 50–59 years:
         Under 160: 0 points.
         160-199: 2 points.
         200-239: 4 points. 240-279: 5 points.
         280 or higher: 7 points.
         */
        
        else if([self.age integerValue] >= 50 && [self.age integerValue] <= 59){
            if ([self.totalCholesterol integerValue] < 160) {
                points += 0;
            }
            else if([self.totalCholesterol integerValue] >= 160 && [self.totalCholesterol integerValue] <= 199 ) {
                points += 2;
            }
            else if([self.totalCholesterol integerValue] >= 200 && [self.totalCholesterol integerValue] <= 239 ) {
                points += 4;
            }
            else if([self.totalCholesterol integerValue] >= 240 && [self.totalCholesterol integerValue] <= 279 ) {
                points += 5;
            }
            else if([self.totalCholesterol integerValue] >= 280) {
                points += 7;
            }
        }
        
        /*
         • Age 60–69 years:
         Under 160: 0 points.
         160-199: 1 point.
         200-239: 2 points.
         240-279: 3 points.
         280 or higher: 4 points.
         */
        
        else if([self.age integerValue] >= 60 && [self.age integerValue] <= 69){
            if ([self.totalCholesterol integerValue] < 160) {
                points += 0;
            }
            else if([self.totalCholesterol integerValue] >= 160 && [self.totalCholesterol integerValue] <= 199 ) {
                points += 1;
            }
            else if([self.totalCholesterol integerValue] >= 200 && [self.totalCholesterol integerValue] <= 239 ) {
                points += 2;
            }
            else if([self.totalCholesterol integerValue] >= 240 && [self.totalCholesterol integerValue] <= 279 ) {
                points += 3;
            }
            else if([self.totalCholesterol integerValue] >= 280) {
                points += 4;
            }
        }
        /*
         • Age 70–79 years:
         Under 160: 0 points.
         160-199: 1 point.
         200-239: 1 point.
         240-279: 2 points.
         280 or higher: 2 points.
         */
        else if([self.age integerValue] >= 70 && [self.age integerValue] <= 79){
            if ([self.totalCholesterol integerValue] < 160) {
                points += 0;
            }
            else if([self.totalCholesterol integerValue] >= 160 && [self.totalCholesterol integerValue] <= 199 ) {
                points += 1;
            }
            else if([self.totalCholesterol integerValue] >= 200 && [self.totalCholesterol integerValue] <= 239 ) {
                points += 1;
            }
            else if([self.totalCholesterol integerValue] >= 240 && [self.totalCholesterol integerValue] <= 279 ) {
                points += 2;
            }
            else if([self.totalCholesterol integerValue] >= 280) {
                points += 2;
            }
        }
        
        
        /*****************************/
        /* Smoker */
        /*****************************/
        /*
         If cigarette smoker:
           Age 20–39 years: 9 points.
         • Age 40–49 years: 7 points.
         • Age 50–59 years: 4 points. 
         • Age 60–69 years: 2 points. 
         • Age 70–79 years: 1 point.
         
         All non smokers: 0 points.
        */
        
        if(self.smoker){
            if([self.age integerValue] >= 20 && [self.age integerValue] <= 39){
                points += 9;
            }
            else if([self.age integerValue] >= 40 && [self.age integerValue] <= 49){
                points += 7;
            }
            else if([self.age integerValue] >= 50 && [self.age integerValue] <= 59){
                points += 4;
            }
            else if([self.age integerValue] >= 60 && [self.age integerValue] <= 69){
                points += 2;
            }
            else if([self.age integerValue] >= 70 && [self.age integerValue] <= 79){
                points += 1;
            }
        }
         
        /*****************************/
        /* HDL Cholesterol */
        /*****************************/
        
        /*
         HDL cholesterol, mg/dL: 
            60 or higher: Minus 1 point. 
            50-59: 0 points. 
            40-49: 1 point. 
            Under 40: 2 points.
         */
    
        if ([self.HDLCholesterol integerValue] >= 60) {
            points += -1;
        }
        else if([self.HDLCholesterol integerValue] >= 50 && [self.HDLCholesterol integerValue] <= 59 ) {
            points += 0;
        }
        else if([self.HDLCholesterol integerValue] >= 40 && [self.HDLCholesterol integerValue] <= 49 ) {
            points += 1;
        }
        else if([self.HDLCholesterol integerValue] < 40) {
            points += 2;
        }
    
        /*
         Systolic blood pressure, mm Hg:
            Untreated:
                Under 120: 0 points.
                120-129: 1 point. 
                130-139: 2 points. 
                140-159: 3 points. 
                160 or higher: 4 points. 
         */
        if (!self.medication) {
            if ([self.systolicBloodPressure integerValue] < 120) {
                points += 0;
            }
            else if([self.systolicBloodPressure integerValue] >= 120 && [self.systolicBloodPressure integerValue] <= 129 ) {
                points += 1;
            }
            else if([self.systolicBloodPressure integerValue] >= 130 && [self.systolicBloodPressure integerValue] <= 139 ) {
                points += 2;
            }
            else if([self.systolicBloodPressure integerValue] >= 140 && [self.systolicBloodPressure integerValue] <= 159 ) {
                points += 3;
            }
            else if([self.systolicBloodPressure integerValue] >= 160){
                points += 4;
            }
        }
        /*
         • Treated: 
                Under 120: 0 points. 
                120-129: 3 points. 
                130-139: 4 points. 
                140-159: 5 points. 
                160 or higher: 6 points.
         
         */
        else{
            if ([self.systolicBloodPressure integerValue] < 120) {
                points += 0;
            }
            else if([self.systolicBloodPressure integerValue] >= 120 && [self.systolicBloodPressure integerValue] <= 129 ) {
                points += 3;
            }
            else if([self.systolicBloodPressure integerValue] >= 130 && [self.systolicBloodPressure integerValue] <= 139 ) {
                points += 4;
            }
            else if([self.systolicBloodPressure integerValue] >= 140 && [self.systolicBloodPressure integerValue] <= 159 ) {
                points += 5;
            }
            else if([self.systolicBloodPressure integerValue] >= 160){
                points += 6;
            }
        }
        
        /*
         10-year risk in %: 
            Points total: 
                Under 9 points: <1%.
                9-12 points: 1%. 
                13-14 points: 2%. 
                15 points: 3%. 
                16 points: 4%. 
                17 points: 5%. 
                18 points: 6%.
                19 points: 8%. 
                20 points: 11%. 
                21=14%, 
                22=17%, 
                23=22%, 
                24=27%, 
                >25= Over 30%
         */
        if (points < 9) {
            percentage = 0.01f;
        }
        else if(points >= 9 && points <= 12 ) {
            percentage = 0.02f;
        }
        else if(points >= 13 && points <= 14 ) {
            percentage = 0.02f;
        }
        else if(points == 15) {
            percentage = 0.03f;
        }
        else if(points == 16) {
            percentage = 0.04f;
        }
        else if(points == 17) {
            percentage = 0.05f;
        }
        else if(points == 18) {
            percentage = 0.06f;
        }
        else if(points == 19) {
            percentage = 0.08f;
        }
        else if(points == 20) {
            percentage = 0.11f;
        }
        else if(points == 21) {
            percentage = 0.14f;
        }
        else if(points == 22) {
            percentage = 0.17f;
        }
        else if(points == 23) {
            percentage = 0.22f;
        }
        else if(points == 24) {
            percentage = 0.27f;
        }
        else if(points >= 25) {
            percentage = 0.30f;
        }
    }
    
    self.percentageOfRisk = [NSNumber numberWithFloat:(percentage*100)];
}

-(void) displayProperties
{
    NSLog(@"Age of person is: %d",[self.age intValue]);
    NSLog(@"Gender of person is: %d",self.gender);
    NSLog(@"Total Cholesterol of person is: %d",[self.totalCholesterol intValue]);
    NSLog(@"HDL Cholesterol of person is: %d",[self.HDLCholesterol intValue]);
    NSLog(@"Smoker status of person is: %d",self.smoker);
    NSLog(@"Medication of person is: %d",self.medication);
}
@end

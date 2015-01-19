//
//  ScoreModel.h
//  FarminghamRisk
//
//  Created by Amogh Param on 1/17/15.
//  Copyright (c) 2015 Amogh Param. All rights reserved.
//

#import <Foundation/Foundation.h>
#define MALE false
#define FEMALE true

@interface ScoreModel : NSObject

/*
 Age: Years
 Gender: M/F
 Total Cholesterol: mg/dL
 HDL Cholesterol: mg/dL
 Smoker: No   Yes
 Systolic Blood Pressure: mm/Hg
 Are you currently on any medication to treat high blood pressure:  No   Yes
*/

@property (nonatomic,strong) NSNumber *age;
@property (nonatomic,assign) NSInteger gender;
@property (nonatomic,strong) NSNumber *totalCholesterol;
@property (nonatomic,strong) NSNumber *HDLCholesterol;
@property (nonatomic,assign) BOOL smoker;
@property (nonatomic,strong) NSNumber *systolicBloodPressure;
@property (nonatomic,assign) BOOL medication;

@property (nonatomic,strong) NSNumber *percentageOfRisk;


-(ScoreModel *) initWithAge: (NSNumber *)age
                     gender: (NSInteger) gender
           totalCholesterol: (NSNumber *) totalCholesterol
             HDLCholesterol: (NSNumber *) HDLCholesterol
                     smoker: (BOOL) smoker
      systolicBloodPressure: (NSNumber *) systolicBloodPressure
                 medication: (BOOL) medication;
-(void) displayProperties;
-(void) calculateFarminghamScore;
@end

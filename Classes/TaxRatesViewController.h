//
//  TaxRatesViewController.h
//  TaxRates
//
//  Created by Shabda Raaj on 02/02/11.
//  Copyright 2011 Agiliq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaxRatesViewController : UIViewController <UITextFieldDelegate> {
    IBOutlet UITextField* income;
    IBOutlet UITextField* investment;
    IBOutlet UITextField* infraInvestment;    
    IBOutlet UITextField* insurancePremiums;
    IBOutlet UITextField* housingInterest;
    
    IBOutlet UILabel* finalTax;
    


}

@property (nonatomic, retain) UITextField *income;
@property (nonatomic, retain) UITextField *housingInterest;
@property (nonatomic, retain) UITextField *investment;
@property (nonatomic, retain) UITextField *infraInvestment;
@property (nonatomic, retain) UITextField *insurancePremiums;
@property (nonatomic, retain) UILabel *finalTax;

- (IBAction) calculateTax;
- (IBAction) hideKeyboard;

@end


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
    IBOutlet UITextField* infra_investment;    
    IBOutlet UITextField* insurance_premiums;
    IBOutlet UITextField* housing_interest;
    
    IBOutlet UILabel* final_tax;
    


}

@property (nonatomic, retain) UITextField *income;
@property (nonatomic, retain) UITextField *housing_interest;
@property (nonatomic, retain) UITextField *investment;
@property (nonatomic, retain) UITextField *infra_investment;
@property (nonatomic, retain) UITextField *insurance_premiums;
@property (nonatomic, retain) UILabel *final_tax;

- (IBAction) calculate_tax;
- (IBAction) hideKeyboard;

@end


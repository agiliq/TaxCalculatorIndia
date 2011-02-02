//
//  TaxRatesViewController.m
//  TaxRates
//
//  Created by Shabda Raaj on 02/02/11.
//  Copyright 2011 Agiliq. All rights reserved.
//

#import "TaxRatesViewController.h"

@implementation TaxRatesViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

@synthesize income, housing_interest, investment, infra_investment, insurance_premiums, final_tax;

int getTax(int taxable_income);

- (IBAction) calculate_tax{
    NSString* income_full = income.text;
    NSString* housing = housing_interest.text;
    NSString* inv = investment.text;    
    NSString* infra_inv = infra_investment.text;    
    NSString* premium = insurance_premiums.text; 
    
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber* income_num = [f numberFromString:income_full];
    NSNumber* inv_num = [f numberFromString:inv];
    NSNumber* infra_inv_num = [f numberFromString:infra_inv];
    NSNumber* housing_num = [f numberFromString:housing];
    NSNumber* premium_num = [f numberFromString:premium];
    NSLog(@"Deductions are %@, %@, %@, %@", inv_num, infra_inv_num, housing_num, premium_num);    
    [f release];
    int income_i = [income_num intValue];
    int inv_i = [inv_num intValue];
    int infra_inv_i = [infra_inv_num intValue];
    int housing_i = [housing_num intValue];
    int premium_i = [premium_num intValue];
    NSLog(@"Deductions are %d, %d, %d, %d", inv_i, infra_inv_i, housing_i, premium_i);
    
    //Ok, now lets get the max allowed investments
    inv_i = MAX(0, MIN(inv_i, 100000));
    infra_inv_i = MAX(0, MIN(infra_inv_i, 20000));
    housing_i = MAX(0, MIN(housing_i, 150000));
    premium_i = MAX(0, MIN(premium_i, 35000));
    NSLog(@"Deductions are %d, %d, %d, %d", inv_i, infra_inv_i, housing_i, premium_i);
    
    int total_deductions =  inv_i + infra_inv_i + housing_i + premium_i;
    int taxable_income = MAX(0, income_i - total_deductions);
    int tax = getTax(taxable_income);
    
    final_tax.text = [[NSString alloc] initWithFormat: @"%d",tax];
    NSLog(@"Tax is: %d", tax);
    
    
    
    [income resignFirstResponder];
}


- (IBAction) hideKeyboard{
    [income resignFirstResponder];    
    [housing_interest resignFirstResponder];
    [investment resignFirstResponder];
    [infra_investment resignFirstResponder];
    [insurance_premiums resignFirstResponder];
    
}


int getTax(int taxable_income){
    int tax_on_this_slab;
    if (taxable_income < 160000) {
        return 0;
    }
    else if (taxable_income < 500000){
        tax_on_this_slab = 0.1 * (taxable_income - 160000);
        return tax_on_this_slab;
    }
    else if (taxable_income < 800000){
        tax_on_this_slab = 0.2 * (taxable_income - 500000);
        return tax_on_this_slab + 34000;
    
    }
    else {
        tax_on_this_slab = 0.3 * (taxable_income - 800000);
        return tax_on_this_slab + 94000;
    }
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


- (void)dealloc {
    [super dealloc];
}

@end

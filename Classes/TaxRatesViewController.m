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

@synthesize income, housingInterest, investment, infraInvestment, insurancePremiums, finalTax;

int getTax(int taxableIncome);

- (IBAction) calculateTax{
    NSString* incomeFull = income.text;
    NSString* housing = housingInterest.text;
    NSString* inv = investment.text;    
    NSString* infraInv = infraInvestment.text;    
    NSString* premium = insurancePremiums.text; 
    
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber* incomeNum = [f numberFromString:incomeFull];
    NSNumber* invNum = [f numberFromString:inv];
    NSNumber* infraInvNum = [f numberFromString:infraInv];
    NSNumber* housingNum = [f numberFromString:housing];
    NSNumber* premiumNum = [f numberFromString:premium];
    NSLog(@"Deductions are %@, %@, %@, %@", invNum, infraInvNum, housingNum, premiumNum);    
    [f release];
    int incomeInt = [incomeNum intValue];
    int invInt = [invNum intValue];
    int infraInvInt = [infraInvNum intValue];
    int housingInt = [housingNum intValue];
    int premiumInt = [premiumNum intValue];
    NSLog(@"Deductions are %d, %d, %d, %d", invInt, infraInvInt, housingInt, premiumInt);
    
    //Ok, now lets get the max allowed investments
    invInt = MAX(0, MIN(invInt, 100000));
    infraInvInt = MAX(0, MIN(infraInvInt, 20000));
    housingInt = MAX(0, MIN(housingInt, 150000));
    premiumInt = MAX(0, MIN(premiumInt, 35000));
    NSLog(@"Deductions are %d, %d, %d, %d", invInt, infraInvInt, housingInt, premiumInt);
    
    int totalDeductions =  invInt + infraInvInt + housingInt + premiumInt;
    int taxableIncome = MAX(0, incomeInt - totalDeductions);
    int tax = getTax(taxableIncome);
    
    finalTax.text = [[NSString alloc] initWithFormat: @"%d",tax];
    NSLog(@"Tax is: %d", tax);
    
    
    
    [income resignFirstResponder];
}


- (IBAction) hideKeyboard{
    [income resignFirstResponder];    
    [housingInterest resignFirstResponder];
    [investment resignFirstResponder];
    [infraInvestment resignFirstResponder];
    [insurancePremiums resignFirstResponder];
    
}


int getTax(int taxableIncome){
    int taxOnThisSlab;
    if (taxableIncome < 160000) {
        return 0;
    }
    else if (taxableIncome < 500000){
        taxOnThisSlab = 0.1 * (taxableIncome - 160000);
        return taxOnThisSlab;
    }
    else if (taxableIncome < 800000){
        taxOnThisSlab = 0.2 * (taxableIncome - 500000);
        return taxOnThisSlab + 34000;
    
    }
    else {
        taxOnThisSlab = 0.3 * (taxableIncome - 800000);
        return taxOnThisSlab + 94000;
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


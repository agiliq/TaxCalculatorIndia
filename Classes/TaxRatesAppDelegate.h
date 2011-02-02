//
//  TaxRatesAppDelegate.h
//  TaxRates
//
//  Created by Shabda Raaj on 02/02/11.
//  Copyright 2011 Agiliq. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TaxRatesViewController;

@interface TaxRatesAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TaxRatesViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TaxRatesViewController *viewController;

@end


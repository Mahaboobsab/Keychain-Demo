//
//  ViewController.h
//  KeychainDemo
//
//  Created by Mahaboobsab Nadaf on 25/05/17.
//  Copyright © 2017 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Keychain.h"
@interface ViewController : UIViewController
{
    Keychain * keychain;
    
}
@property (strong, nonatomic) IBOutlet UITextField *keyBox;
@property (strong, nonatomic) IBOutlet UITextField *valueBox;

- (IBAction)addItem:(id)sender;

- (IBAction)updateItem:(id)sender;
- (IBAction)findItem:(id)sender;
- (IBAction)deleteItem:(id)sender;
@end


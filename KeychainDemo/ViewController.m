//
//  ViewController.m
//  KeychainDemo
//
//  Created by Mahaboobsab Nadaf on 25/05/17.
//  Copyright © 2017 NeoRays. All rights reserved.
//

#import "ViewController.h"


#define SERVICE_NAME @"ANY_NAME_FOR_YOU"

//o share the data between apps, they should have the same Access Group in code signing entitlements.
#define GROUP_NAME @"PM7352S8QE.com.apps.shared"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   keychain =[[Keychain alloc] initWithService:SERVICE_NAME withGroup:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) showMessage:(NSString*)text
{
    UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:NSLocalizedString(@"HelloKey", @"")

                                                     message:text
                                                    delegate:nil
                                           cancelButtonTitle:@"Cancel"
                                           otherButtonTitles: nil];
    [alert show];
}

- (IBAction)addItem:(id)sender {
    
    NSString *key =self.keyBox.text;
    NSData * value = [self.valueBox.text dataUsingEncoding:NSUTF8StringEncoding];
    
    if([keychain insert:key :value])
    {
        [self showMessage:@"Successfully added data"];
    }
    else
        [self showMessage:@"Failed to  add data"];
    
    self.valueBox.text =@"";
    
}

- (IBAction)updateItem:(id)sender {
    NSString *key =self.keyBox.text;
    NSData * data =[keychain find:key];
    if(data)
    {
        NSData * value = [self.valueBox.text dataUsingEncoding:NSUTF8StringEncoding];
        
        if([keychain update:key :value])
        {
            [self showMessage:@"Successfully updated data"];
        }
        else
            [self showMessage:@"Failed to update data"];
        
    }
    else
    {
        [self showMessage:@"Key Not found"];
    }
}

- (IBAction)findItem:(id)sender {
    
    NSString *key =self.keyBox.text;
    
    NSData * data =[keychain find:key];
    
    if(data)
    {
        [self showMessage:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];
    }
    else
    {
        [self showMessage:@"Failed to get Data"];
    }
}

- (IBAction)deleteItem:(id)sender {
    
    NSString *key =self.keyBox.text;
    
    if([keychain remove:key])
    {
        [self showMessage:@"Successfully removed data"];
    }
    else
    {
        [self showMessage:@"Unable to remove data"];
    }
    
}
@end

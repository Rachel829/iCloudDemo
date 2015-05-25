//
//  ViewController.h
//  iCloudDemo
//
//  Created by Admin on 15/4/29.
//  Copyright (c) 2015年 LQY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{ 
    NSUbiquitousKeyValueStore *keyStore;
}
@property (strong, nonatomic) IBOutlet UITextField *textField;
-(IBAction)saveKey;

@end


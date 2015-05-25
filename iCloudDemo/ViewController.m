//
//  ViewController.m
//  iCloudDemo
//
//  Created by Admin on 15/4/29.
//  Copyright (c) 2015年 LQY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)saveKey
{
    [keyStore setString:_textField.text forKey:@"MyString"];
    [keyStore synchronize];
    
    NSLog(@"Save key");
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    keyStore = [NSUbiquitousKeyValueStore defaultStore];
    
    NSString *storedString = [keyStore stringForKey:@"MyString"];
    
    if (storedString != nil)
    {
        _textField.text = storedString;
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(ubiquitousKeyValueStoreDidChange:)
                                                 name:NSUbiquitousKeyValueStoreDidChangeExternallyNotification
                                               object:keyStore];
    
    
}


-(void) ubiquitousKeyValueStoreDidChange: (NSNotification *)notification
{
    NSLog(@"External Change detected");
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Change detected"
                          message:@"Change detected"
                          delegate:nil
                          cancelButtonTitle:@"Ok"
                          otherButtonTitles:nil, nil];
    [alert show];
    
    _textField.text = [keyStore stringForKey:@"MyString"];
}
@end

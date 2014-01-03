//
//  ViewController.m
//  TextFieldTest2
//
//  Created by SDT-1 on 2014. 1. 3..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 205, 0, 0)];
    label1.text = @"Z입력금지";
    label1.textColor = [UIColor blackColor];
    label1.backgroundColor = [UIColor clearColor];
    [label1 sizeToFit];
    [self.view addSubview:label1];
    
    UITextField *textField1 = [[UITextField alloc] initWithFrame:CGRectMake(130, 200, 171, 31)];
    textField1.borderStyle = UITextBorderStyleRoundedRect;
    textField1.delegate = self;
    textField1.tag = 1;
    [self.view addSubview:textField1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 105, 0, 0)];
    label2.text = @"Return";
    label2.textColor = [UIColor blackColor];
    label2.backgroundColor = [UIColor clearColor];
    [label2 sizeToFit];
    [self.view addSubview:label2];
    
    UITextField *textField2 = [[UITextField alloc] initWithFrame:CGRectMake(130, 100, 171, 31)];
    textField2.borderStyle = UITextBorderStyleRoundedRect;
    textField2.delegate = self;
    textField2.tag = 3;
    [self.view addSubview:textField2];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(20, 155, 0, 0)];
    label3.text = @"편집불가";
    label3.textColor = [UIColor blackColor];
    label3.backgroundColor = [UIColor clearColor];
    [label3 sizeToFit];
    [self.view addSubview:label3];
    
    UITextField *textField3 = [[UITextField alloc] initWithFrame:CGRectMake(130, 150, 171, 31)];
    textField3.borderStyle = UITextBorderStyleRoundedRect;
    textField3.delegate = self;
    textField3.tag = 2;
    [self.view addSubview:textField3];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    NSLog(@"INPUT : %@", textField.text);
    [textField resignFirstResponder];
    return YES;
}

-(void)viewDidAppear:(BOOL)animated
{
    [self.textField becomeFirstResponder];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField.tag ==2)
    {
        return NO;
    }
    return YES;
}

-(BOOL)textField:(UITextField *) textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.tag && NSOrderedSame ==[string compare:@"z"options:NSCaseInsensitiveSearch])
    {
        return NO;
    }
    return YES;
}


-(IBAction)dismissKeyboard:(id)sender
{
    [self.textField resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}
@end


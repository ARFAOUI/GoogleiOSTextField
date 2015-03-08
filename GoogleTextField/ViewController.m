//
//  ViewController.m
//  GoogleTextField
//
//  Created by Bechir Arfaoui on 07/03/15.
//  Copyright (c) 2015 Bechir Arfaoui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect frame = CGRectMake(10, 200, 300, 45);
    self.GoogleTextField =  [[UITextField alloc] initWithFrame:frame];
    self.GoogleTextField.delegate = self;
    self.GoogleTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.GoogleTextField.font = [UIFont fontWithName:@"HelveticaNeue" size:15.0];
    self.GoogleTextField.placeholder = NSLocalizedString(@"placeholder", );
    self.GoogleTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.GoogleTextField.keyboardType = UIKeyboardTypeDefault;
    [self.view addSubview:self.GoogleTextField];

}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [self moveTextFieldUp];
    
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    NSLog(@"agree");
}
- (void)moveTextFieldUp{
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                          self.GoogleTextField.frame =CGRectMake(self.GoogleTextField.frame.origin.x, 30, self.GoogleTextField.frame.size.width, self.GoogleTextField.frame.size.height);
                     }
                     completion:^(BOOL finished){
                             [self addCancelButton];
                     }];
}
- (void)moveTextFieldDown{
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.GoogleTextField.frame =CGRectMake(10, 200, 300, 45);
                     }
                     completion:^(BOOL finished){
                         [self.GoogleTextField resignFirstResponder];
                     }];
}

-(void)addCancelButton{
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    cancelButton.frame = CGRectMake(0, 0, 50, 45);
    [cancelButton addTarget:self action:@selector(clearTextField:) forControlEvents:UIControlEventTouchUpInside];
    [cancelButton setTitle:@"CANCEL" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    cancelButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:11.0];
    self.GoogleTextField.rightViewMode = UITextFieldViewModeWhileEditing;
    self.GoogleTextField.rightView = cancelButton;
}

-(IBAction)clearTextField:(id)sender{
    self.GoogleTextField.text = @"";
    self.GoogleTextField.rightView = nil;
    [self moveTextFieldDown];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  OCDemo
//
//  Created by 邓永豪 on 2018/8/8.
//  Copyright © 2018年 邓永豪. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)alert:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:self.textField.text delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
    [alertView show];
}

@end

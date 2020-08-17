//
//  ViewController.m
//  BeelinkC
//
//  Created by Gavin on 2020/8/12.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@",kLocal_text(@"home_title"));
//    self.view.backgroundColor = kColor(@"#ffffff", @"#eeeeee");
    self.view.backgroundColor =kColor_hex(@"999999");
//    self.view.backgroundColor =kColor(@"ffffff", @"999999");
//    self.view.backgroundColor = [UIColor colorWithLightColorStr:@"ffffff" DarkColor:@"999999"];
}
@end

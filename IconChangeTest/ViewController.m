//
//  ViewController.m
//  IconChangeTest
//
//  Created by lihui on 2017/5/5.
//  Copyright © 2017年 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setObject];
}

-(void)setObject{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"btn" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn setFrame:CGRectMake(100, 109, 100, 100)];
    [btn setBackgroundColor:[UIColor cyanColor]];
    [self.view addSubview:btn];
    
}

-(void)BtnClick:(id)sender{
//    if (![self checkSupportChangeIcon]){
//        return;
//    }
//    
//    if(!UIApplication.sharedApplication.supportsAlternateIcons){
//        return;
//    }
//    
//    [self changeToIcon:@"IconTest"];
    
    [self getPlistIinfo];
}
-(void)getPlistIinfo{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
    NSDictionary *plistfile = [NSDictionary dictionaryWithContentsOfFile:path];

    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:plistfile];
    [dic setValue:@"test" forKey:@"testkey"];
    [dic writeToFile:path atomically:YES];
}
-(BOOL)checkSupportChangeIcon{
    NSString *deviceVersion = UIDevice.currentDevice.systemVersion;
    if ([deviceVersion containsString:@"10.3"]) {
        return YES;
    }
    return NO;
}

-(void)changeToIcon:(NSString *)iconName{
    [UIApplication.sharedApplication setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
        if(error != nil){
            NSLog(@"error:%@",error.localizedDescription);
        }else{
            NSLog(@"修改成功");
        }
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

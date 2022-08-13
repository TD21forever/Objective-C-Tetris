//
//  ViewController.m
//  Tetris
//
//  Created by T D on 2022/8/13.
//

#import "ViewController.h"
#import "Constant.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    HomeView* home = [[HomeView alloc]initWithFrame:CGRectMake(100, 100, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview: home];
}


@end

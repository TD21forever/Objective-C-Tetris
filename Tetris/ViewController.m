//
//  ViewController.m
//  Tetris
//
//  Created by T D on 2022/8/13.
//

#import "ViewController.h"
#import "Constant.h"
#import "BrickView.h"

@interface ViewController ()<HomeViewDelegate>

@property (nonatomic,strong) HomeView* home;
@property (nonatomic,strong) NSMutableArray<BrickView*>* curBricks;
@property (nonatomic,strong) NSMutableArray<BrickView*>* existBricks;
@property (nonatomic,strong) NSMutableArray<BrickView*>* nextBricks;
@property (nonatomic,strong) dispatch_source_t timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.home = [[HomeView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    [self.view addSubview: self.home];
    self.home.delegate = self;
    
    self.curBricks = [NSMutableArray array];
    self.existBricks = [NSMutableArray array];
    self.nextBricks = [NSMutableArray array];
    
    
}

#pragma mark - HomeView Delegate

- (void)leftClick {
    return;
}

- (void)playClick {
    NSLog(@"Click play button");
    [self startTimer];
}

- (void)rightClick {
    return;
}


#pragma mark - Timer

- (void)startTimer{
    if(!_timer){
        self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
        dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, NSEC_PER_SEC, 0);
        dispatch_source_set_event_handler(self.timer, ^{
            if(self.nextBricks.count == 0){
                [self genNextBricks];
            }
            if(self.curBricks.count == 0){
                [self genCurBricks];
            }
            // 下降
            [self.curBricks enumerateObjectsUsingBlock:^(BrickView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                            [self updateBrick:obj direction:BrickDirectionDown step:1];
            }];
        });
        
    }
    dispatch_resume(self.timer);
}


#pragma mark - 生成方块


- (void)genNextBricks{
    
     NSArray* points = [[BrickManager shared]getBrickPoints:BrickTypeI];
    [points enumerateObjectsUsingBlock:^(BrickPoint*  _Nonnull point, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CGRect frame = CGRectMake(gridToFrame(point.x), gridToFrame(point.y), gridSize, gridSize);
        BrickView * brick = [[BrickView alloc]initWithFrame: frame point:point];
        [self.nextBricks addObject:brick];
        
    }];
    
}

// 生成 curBricks,从nextBricks中获取
- (void)genCurBricks{
    [self.curBricks addObjectsFromArray:self.nextBricks];
    [self.nextBricks removeAllObjects];
    [self.curBricks enumerateObjectsUsingBlock:^(BrickView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self.home.board addSubview:obj];
    }];
}

#pragma mark - 移动相关

- (void)updateBrick:(BrickView *)brick direction:(BrickDirection)direction step:(NSInteger)step{
    CGRect newFrame;
    switch (direction) {
        case BrickDirectionDown:
            brick.point.y += step;
            newFrame = brick.frame;
            newFrame.origin.y += gridToFrame(step);
            brick.frame = newFrame;
            break;
        case BrickDirectionLeft:
            break;
        case BrickDirectionRight:
            break;
    }
}

@end

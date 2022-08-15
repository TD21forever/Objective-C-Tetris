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


@property (nonatomic,strong) dispatch_semaphore_t lock;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.home = [[HomeView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    [self.view addSubview: self.home];
    self.home.delegate = self;
    self.lock = dispatch_semaphore_create(1);
    self.curBricks = [NSMutableArray array];
    self.existBricks = [NSMutableArray array];
    self.nextBricks = [NSMutableArray array];
    
    
}

#pragma mark - HomeView Delegate

- (void)leftClick {
    if([self isAvailableToMove:BrickDirectionLeft]){
        [self.curBricks enumerateObjectsUsingBlock:^(BrickView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self updateBrick:obj direction:BrickDirectionLeft step:1];
        }];
    }

}

- (void)playClick {
    [self startTimer];
}

- (void)rightClick {
    if([self isAvailableToMove:BrickDirectionRight]){
        [self.curBricks enumerateObjectsUsingBlock:^(BrickView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self updateBrick:obj direction:BrickDirectionRight step:1];
        }];
    }
}

- (void)reverseClick{
    return;
}

- (void)downClick{
    for(NSInteger i = 0; i < 2; i++){
        
        if([self isAvailableToMove:BrickDirectionDown]){
            [self.curBricks enumerateObjectsUsingBlock:^(BrickView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [self updateBrick:obj direction:BrickDirectionDown step:1];
            }];
        }
    }
  
}


#pragma mark - Timer

- (void)startTimer{
    if(!_timer){
        self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
        dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, NSEC_PER_SEC*0.1, 0);
        dispatch_source_set_event_handler(self.timer, ^{
            if(self.nextBricks.count == 0){
                [self genNextBricks];
            }
            if(self.curBricks.count == 0){
                [self genCurBricks];
            }
            if([self isAvailableToMove: BrickDirectionDown]){
                
//                dispatch_semaphore_wait(self.lock, DISPATCH_TIME_FOREVER);

                // 下降
                [self.curBricks enumerateObjectsUsingBlock:^(BrickView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                                [self updateBrick:obj direction:BrickDirectionDown step:1];
                }];
                
//                dispatch_semaphore_signal(self.lock);

            } else {
                
                [self.existBricks addObjectsFromArray:self.curBricks];
                [self removeBlocks];
                [self.curBricks removeAllObjects];
                [self genCurBricks];
                if(! [self isAvailableToMove:BrickDirectionDown]){
                    NSLog(@"Game over");
                    dispatch_suspend(self.timer);
                }
            }
            
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
    CGRect newFrame = brick.frame;
    switch (direction) {
        case BrickDirectionDown:
            brick.point.y += step;
            newFrame.origin.y += gridToFrame(step);
            brick.frame = newFrame;
            break;
        case BrickDirectionLeft:
            brick.point.x -= step;
            newFrame.origin.x -= gridToFrame(step);
            brick.frame = newFrame;
            break;
        case BrickDirectionRight:
            brick.point.x += step;
            newFrame.origin.x += gridToFrame(step);
            brick.frame = newFrame;
            break;
    }
}

- (BOOL)isAvailableToMove:(BrickDirection)direction{

    for(BrickView* brick in self.curBricks){
    
        BrickPoint * newPoint;
        CGRect newFrame = brick.frame;
        
        if(direction == BrickDirectionLeft){
            newPoint = [[BrickPoint alloc]initWithX:brick.point.x-1 withY:brick.point.y];
            newFrame.origin.x -= gridToFrame(1);
        }
        else if (direction == BrickDirectionDown) {
            newPoint = [[BrickPoint alloc]initWithX:brick.point.x withY:brick.point.y+1];
            newFrame.origin.y += gridToFrame(1);
        }
        else if (direction == BrickDirectionRight) {
            newPoint = [[BrickPoint alloc]initWithX:brick.point.x+1 withY:brick.point.y];
            newFrame.origin.x += gridToFrame(1);
        }
        
        // 是否越界
        if(newFrame.origin.x >= gridToFrame(boardWidth) || newFrame.origin.x < 0 || newFrame.origin.y >= gridToFrame(boardHeight)){
            return NO;
        }
        // 是否碰撞
        NSLog(@"%ld",self.existBricks.count);
        for(BrickView* existBrick in self.existBricks){
            if(newPoint.x == existBrick.point.x && newPoint.y == existBrick.point.y){
                return NO;
            }
        }
    }
    return YES;
}


#pragma mark - 方块消除

- (void)removeBlocks{
    // 按照行组织版面上的方块
    NSMutableArray* brickArray = [NSMutableArray array];
    for(NSInteger i = boardHeight - 1;i >= 0; i--){
        NSMutableArray* temp = [NSMutableArray array];
        [self.existBricks enumerateObjectsUsingBlock:^(BrickView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if(i == obj.point.y){
                [temp addObject:obj];
            }
        }];
        [brickArray addObject:temp];
    }
    NSInteger removeNumber = 0;
    for(NSMutableArray* eachRowBricks in brickArray){
        // 如果这一行brick放满了,将这一行移除
        if([eachRowBricks count] == boardWidth){
            [eachRowBricks enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    [obj removeFromSuperview];
                    [self.existBricks removeObject:obj];
            }];
            removeNumber ++;
        }
        // 否则往下移动
        else {
            [eachRowBricks enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                            [self updateBrick:obj direction:BrickDirectionDown step:removeNumber];
            }];
        }
    }
}

@end
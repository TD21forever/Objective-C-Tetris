//
//  HomeView.m
//  Tetris
//
//  Created by T D on 2022/8/13.
//

#import "HomeView.h"
#import "Constant.h"
#import "Masonry.h"

@interface HomeView ()
@property (nonatomic,strong) UIView * nextBlockBackground;
@property (nonatomic,strong) UILabel * score;

@end


@implementation HomeView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self addSubview:self.board];
        [self setupUI];
    }
    return self;
}

- (void)setupUI{

# pragma mark - nextBlock
    UILabel * nextBlockLabel = [UILabel new];
    nextBlockLabel.text = @"next";
    nextBlockLabel.textColor = [UIColor blackColor];
    [self addSubview:nextBlockLabel];
    
    self.nextBlockBackground = [UIView new];
    [self addSubview: self.nextBlockBackground];
    [self.nextBlockBackground mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.board.mas_right).offset(5);
        make.size.mas_equalTo(CGSizeMake(gridToFrame(4), gridToFrame(4)));
        make.bottom.equalTo(self.board);
            
    }];
    self.nextBlockBackground.layer.borderColor = [UIColor blackColor].CGColor;
    self.nextBlockBackground.layer.borderWidth = 0.5;
    for(NSInteger i = 0; i < 4; i++){
        for(NSInteger j = 0; j < 4; j++){
            UIView * grid = [UIView new];
            grid.frame = CGRectMake(gridToFrame(i), gridToFrame(j), gridToFrame(1), gridToFrame(1));
            grid.layer.borderWidth = 0.5;
            grid.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
            [self.nextBlockBackground addSubview:grid];
        }
    }
    
    [nextBlockLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.nextBlockBackground);
        make.bottom.equalTo(self.nextBlockBackground.mas_top).offset(-10);
    }];
    

# pragma mark - labels
    // 分数
    UILabel * scoreLabel = [UILabel new];
    scoreLabel.text = @"分数";
    [self addSubview:scoreLabel];
    [scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.board.mas_right).offset(20);
        make.top.equalTo(self.board.mas_top).offset(20);
    }];
    
    self.score = [UILabel new];
    self.score.text = @"0";
    [self addSubview:self.score];
    [self.score mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(scoreLabel.mas_bottom).offset(20);
        make.centerX.equalTo(scoreLabel);
    }];
    
# pragma mark - Buttons
    
    // 开始游戏
    UIButton* playButton = [UIButton buttonWithType:UIButtonTypeSystem];
    playButton.backgroundColor = [UIColor redColor];
    [playButton setTitle:@"开始" forState:UIControlStateNormal];
    [self addSubview:playButton];
    [playButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.board.mas_bottom).offset(30);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(40);
    }];
    [playButton addTarget:self action:@selector(playClick) forControlEvents:UIControlEventTouchUpInside];

    // leftButton
    UIButton* leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    leftButton.backgroundColor = [UIColor redColor];
    [leftButton setTitle:@"left" forState:UIControlStateNormal];
    [self addSubview:leftButton];
    [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.board.mas_bottom).offset(30);
        make.centerY.equalTo(playButton);
        make.right.equalTo(playButton.mas_left).offset(-40);
        make.size.mas_equalTo(40);
    }];
    [leftButton addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    // rightButton
    UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    rightButton.backgroundColor = [UIColor redColor];
    [rightButton setTitle:@"left" forState:UIControlStateNormal];
    [self addSubview:rightButton];
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.board.mas_bottom).offset(30);
        make.centerY.equalTo(playButton);
        make.left.equalTo(playButton.mas_right).offset(40);
        make.size.mas_equalTo(40);
    }];
    [rightButton addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    // downButton
    UIButton* downButton = [UIButton buttonWithType:UIButtonTypeSystem];
    downButton.backgroundColor = [UIColor redColor];
    [downButton setTitle:@"down" forState:UIControlStateNormal];
    [self addSubview:downButton];
    [downButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(playButton.mas_bottom).offset(30);
        make.centerX.equalTo(playButton);
        make.size.mas_equalTo(40);
    }];
    [downButton addTarget:self action:@selector(downClick) forControlEvents:UIControlEventTouchUpInside];
    
    // reverseButton
    UIButton* reverseButton = [UIButton buttonWithType:UIButtonTypeSystem];
    reverseButton.backgroundColor = [UIColor redColor];
    [reverseButton setTitle:@"reverse" forState:UIControlStateNormal];
    [self addSubview:reverseButton];
    [reverseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(downButton.mas_bottom).offset(30);
        make.centerX.equalTo(playButton);
        make.size.mas_equalTo(70);
    }];
    [reverseButton addTarget:self action:@selector(reverseClick) forControlEvents:UIControlEventTouchUpInside];
    
    // pauseButton
    UIButton* pauseButton = [UIButton buttonWithType:UIButtonTypeSystem];
    pauseButton.backgroundColor = [UIColor redColor];
    [pauseButton setTitle:@"pause" forState:UIControlStateNormal];
    [self addSubview:pauseButton];
    [pauseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(reverseButton.mas_right).offset(30);
        make.centerY.equalTo(reverseButton);
        make.size.mas_equalTo(70);
    }];
    [pauseButton addTarget:self action:@selector(pauseClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton* restartButton = [UIButton buttonWithType:UIButtonTypeSystem];
    restartButton.backgroundColor = [UIColor redColor];
    [restartButton setTitle:@"restart" forState:UIControlStateNormal];
    [self addSubview:restartButton];
    [restartButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(reverseButton.mas_left).offset(-30);
        make.centerY.equalTo(reverseButton);
        make.size.mas_equalTo(70);
    }];
    [restartButton addTarget:self action:@selector(restartClick) forControlEvents:UIControlEventTouchUpInside];
    
    
}

# pragma mark - delegate settings

- (void)playClick{
    
    [self.delegate respondsToSelector:@selector(playClick)] ?
    [self.delegate playClick] :
    nil;
}


- (void)leftClick{
    
    [self.delegate respondsToSelector:@selector(leftClick)] ?
    [self.delegate leftClick] :
    nil;
}


- (void)rightClick{
    
    [self.delegate respondsToSelector:@selector(rightClick)] ?
    [self.delegate rightClick] :
    nil;
}


- (void)downClick{
    
    [self.delegate respondsToSelector:@selector(downClick)] ?
    [self.delegate downClick] :
    nil;
}

- (void)reverseClick{
    
    [self.delegate respondsToSelector:@selector(reverseClick)] ?
    [self.delegate reverseClick] :
    nil;
}


- (void)pauseClick{
    [self.delegate respondsToSelector:@selector(pauseClick)] ?
    [self.delegate pauseClick] :
    nil;
}

- (void)restartClick{
    [self.delegate respondsToSelector:@selector(restartClick)] ?
    [self.delegate restartClick] :
    nil;
}
- (BoardView*)board{
    if(!_board){
        _board = [[BoardView alloc]initWithFrame:CGRectMake(100, 100, gridToFrame(boardWidth),gridToFrame(boardHeight))];
    }
    return _board;
}


# pragma mark - setter

- (void)setNextBricks:(NSArray<BrickView *> *)nextBricks{
   
    [_nextBricks enumerateObjectsUsingBlock:^(BrickView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj removeFromSuperview];
    }];
    _nextBricks = nextBricks;
    NSLog(@"%ld",[_nextBricks count]);
    [_nextBricks enumerateObjectsUsingBlock:^(BrickView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [self.nextBlockBackground addSubview:obj];
    }];
}

- (void)setScores:(NSInteger)scores{
    _scores = scores;
    self.score.text = [NSString stringWithFormat:@"%ld",scores];
}
@end

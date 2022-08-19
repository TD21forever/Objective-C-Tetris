//
//  HomeView.m
//  Tetris
//
//  Created by T D on 2022/8/13.
//

#import "HomeView.h"
#import "Constant.h"
#import "Masonry.h"
#import "UIColor+TT.h"
#import "TetrisButton.h"

#define BUTTOM_SIZE 80

@interface HomeView ()

@property (nonatomic,strong) UIView * nextBlockBackground;
@property (nonatomic,strong) UILabel * score;
@property (nonatomic,strong) UILabel * speedLabel;
@property (nonatomic,strong) UILabel * status;
@property (nonatomic,strong) UIView * mainViewContainer;
@end


@implementation HomeView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        
        self.backgroundColor = [UIColor colorWithHex:@"#EFCC19"];
        [self setupGameBoardView];
        [self setupButtonsView];
    }
    return self;
}

- (void)setupGameBoardView{
    
#pragma mark - mainView
    
    self.mainViewContainer = [UIView new];
    self.mainViewContainer.layer.borderWidth = 4;
    self.mainViewContainer.layer.borderColor = [UIColor blackColor].CGColor;
    [self addSubview:self.mainViewContainer];
    [self.mainViewContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(self).offset(80);
        make.bottom.equalTo(self.mas_top).offset(560);
        
    }];
    
    [self.mainViewContainer addSubview:self.board];
    [self.board mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(gridToFrame(boardWidth), gridToFrame(boardHeight)));
        make.top.equalTo(self.mainViewContainer).offset(40);
        make.left.equalTo(self.mainViewContainer).offset(40);
    }];

# pragma mark - nextBlock
    UILabel * nextBlockLabel = [UILabel new];
    nextBlockLabel.text = @"NEXT";
    nextBlockLabel.font = [UIFont boldSystemFontOfSize:18];
    nextBlockLabel.textColor = [UIColor blackColor];
    [self.mainViewContainer addSubview:nextBlockLabel];

    self.nextBlockBackground = [UIView new];
    [self.mainViewContainer addSubview: self.nextBlockBackground];
    [self.nextBlockBackground mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.board.mas_right).offset(20);
        make.size.mas_equalTo(CGSizeMake(gridToFrame(4), gridToFrame(4)));
        make.bottom.equalTo(self.board);

    }];
    self.nextBlockBackground.layer.borderColor = [UIColor blackColor].CGColor;
    self.nextBlockBackground.layer.borderWidth = 0.5;
    for(NSInteger i = 0; i < 4; i++){
        for(NSInteger j = 0; j < 4; j++){
            CGRect frame = CGRectMake(gridToFrame(i), gridToFrame(j), gridToFrame(1), gridToFrame(1));
            GridView* grid = [[GridView alloc]initWithFrame:frame];
            [self.nextBlockBackground addSubview:grid];
        }
    }
//
    [nextBlockLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.nextBlockBackground);
        make.bottom.equalTo(self.nextBlockBackground.mas_top).offset(-10);
    }];
    
# pragma mark - labels
   
    UIFont* digitalFont = [UIFont fontWithName:@"Let's go Digital" size:24];

    // 分数
    UILabel * scoreLabel = [UILabel new];
    scoreLabel.text = @"SCORE";
    scoreLabel.font = digitalFont;
    [self addSubview:scoreLabel];
    [scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.board.mas_right).offset(20);
        make.top.equalTo(self.board.mas_top);
    }];

    self.score = [UILabel new];
    self.score.text = @"0";
    UIFont * digital_font = digitalFont;
    self.score.font = digital_font;
    [self addSubview:self.score];
    [self.score mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(scoreLabel.mas_bottom).offset(20);
        make.right.equalTo(self.nextBlockBackground);
    }];
    
    // Level
    UILabel * levelLabel = [UILabel new];
    levelLabel.text = @"SPEED";
    levelLabel.font = digitalFont;
    [self addSubview:levelLabel];
    [levelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(scoreLabel);
        make.top.equalTo(self.score.mas_bottom).offset(10);
    }];
    
    self.speedLabel = [UILabel new];
    self.speedLabel.text = @"";
    self.speedLabel.font = digital_font;
    [self addSubview:self.speedLabel];
    [self.speedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.score);
        make.top.equalTo(levelLabel.mas_bottom);
    }];
    
    // Status
    UILabel * statusLabel = [UILabel new];
    statusLabel.text = @"STATUS";
    statusLabel.font = digitalFont;
    [self addSubview:statusLabel];
    [statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(levelLabel);
        make.top.equalTo(self.speedLabel.mas_bottom).offset(40);
    }];
    
    self.status = [UILabel new];
    self.status.text = @"⏸";
    [self addSubview:self.status];
    [self.status mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(statusLabel);
        make.top.equalTo(statusLabel.mas_bottom).offset(20);
    }];
    
}

#pragma mark - Buttons
- (void)setupButtonsView{
    // leftButton
    UIButton* leftButton = [[TetrisButton alloc]initWithType:@"red"];
    [self addSubview:leftButton];
    [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self).offset(-80);
        make.top.equalTo(self.board.mas_bottom).offset(120);
        make.size.mas_equalTo(CGSizeMake(BUTTOM_SIZE, BUTTOM_SIZE));
    }];
    [leftButton addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel * leftLabel = [UILabel new];
    leftLabel.text = @"Left";
    leftLabel.font = [UIFont systemFontOfSize:14];
    leftLabel.textColor = [UIColor blackColor];
    [self addSubview:leftLabel];
    
    [leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(leftButton);
            make.top.equalTo(leftButton.mas_bottom).offset(5);
    }];
    
    
    // rightButton
    UIButton* rightButton = [[TetrisButton alloc]initWithType:@"red"];
    [self addSubview:rightButton];
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self).offset(80);
        make.top.equalTo(self.board.mas_bottom).offset(120);
        make.size.mas_equalTo(CGSizeMake(BUTTOM_SIZE, BUTTOM_SIZE));
    }];
    [rightButton addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel * rightLabel = [UILabel new];
    rightLabel.text = @"Right";
    rightLabel.font = [UIFont systemFontOfSize:14];
    rightLabel.textColor = [UIColor blackColor];
    [self addSubview:rightLabel];
    
    [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(rightButton);
            make.top.equalTo(rightButton.mas_bottom).offset(5);
    }];
    

    
    // downButton
    UIButton* downButton = [[TetrisButton alloc]initWithType:@"red"];
    [self addSubview:downButton];
    [downButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.board.mas_bottom).offset(180);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(BUTTOM_SIZE, BUTTOM_SIZE));
    }];
    [downButton addTarget:self action:@selector(downClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel * downLabel = [UILabel new];
    downLabel.text = @"Down";
    downLabel.font = [UIFont systemFontOfSize:14];
    downLabel.textColor = [UIColor blackColor];
    [self addSubview:downLabel];
    
    [downLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(downButton);
            make.top.equalTo(downButton.mas_bottom).offset(5);
    }];
    
    // reverseButton
    UIButton* reverseButton = [[TetrisButton alloc]initWithType:@"green"];
    [self addSubview:reverseButton];
    [reverseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.board.mas_bottom).offset(60);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(BUTTOM_SIZE, BUTTOM_SIZE));
    }];
    [reverseButton addTarget:self action:@selector(reverseClick) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel * reverseLabel = [UILabel new];
    reverseLabel.text = @"rotation";
    reverseLabel.font = [UIFont systemFontOfSize:14];
    reverseLabel.textColor = [UIColor blackColor];
    [self addSubview:reverseLabel];
    
    [reverseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(rightButton).offset(-10);
            make.top.equalTo(self.mainViewContainer.mas_bottom).offset(30);
            
    }];
    
    
    // 开始游戏
    UIButton* playButton = [[TetrisButton alloc]initWithType:@"green"];
    [self addSubview:playButton];
    [playButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mainViewContainer.mas_bottom).offset(15);
        make.right.equalTo(self.mainViewContainer);
        make.size.mas_equalTo(BUTTOM_SIZE / 2);
    }];
    [playButton addTarget:self action:@selector(playClick) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel * playLabel = [UILabel new];
    playLabel.text = @"play / pause";
    playLabel.font = [UIFont systemFontOfSize:14];
    playLabel.textColor = [UIColor blackColor];
    [self addSubview:playLabel];
    
    [playLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(playButton).offset(-15);
            make.top.equalTo(playButton.mas_bottom).offset(5);
            
    }];
    
    
    // restart
    UIButton* restartButton = [[TetrisButton alloc]initWithType:@"green"];
    [self addSubview:restartButton];
    [restartButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mainViewContainer);
        make.centerY.equalTo(playButton);
        make.size.mas_equalTo(BUTTOM_SIZE / 2);
    }];
    [restartButton addTarget:self action:@selector(restartClick) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel * resetLabel = [UILabel new];
    resetLabel.text = @"reset";
    resetLabel.font = [UIFont systemFontOfSize:14];
    resetLabel.textColor = [UIColor blackColor];
    [self addSubview:resetLabel];
    
    [resetLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(restartButton);
            make.top.equalTo(restartButton.mas_bottom).offset(5);
            
    }];
    
    
    

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
        _board = [[BoardView alloc]initWithFrame:CGRectMake(0, 0, gridToFrame(boardWidth),gridToFrame(boardHeight))];
    }
    return _board;
}


# pragma mark - setter

- (void)setNextBricks:(NSArray<BrickView *> *)nextBricks{
   
    [_nextBricks enumerateObjectsUsingBlock:^(BrickView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj removeFromSuperview];
    }];
    _nextBricks = nextBricks;
    [_nextBricks enumerateObjectsUsingBlock:^(BrickView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [self.nextBlockBackground addSubview:obj];
    }];
}

- (void)setScores:(NSInteger)scores{
    _scores = scores;
    self.score.text = [NSString stringWithFormat:@"%ld",scores];
}

- (void)setSpeed:(NSInteger)speed{
    _speed = speed;
    self.speedLabel.text = [NSString stringWithFormat:@"%ld",speed];
}

- (void)setStatusEmoji:(NSString *)statusEmoji{
    _statusEmoji = statusEmoji;
    self.status.text = statusEmoji;
}
@end

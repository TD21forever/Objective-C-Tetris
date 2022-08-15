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
}


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

- (BoardView*)board{
    if(!_board){
        _board = [[BoardView alloc]initWithFrame:CGRectMake(100, 100, gridToFrame(boardWidth),gridToFrame(boardHeight))];
    }
    return _board;
}

@end

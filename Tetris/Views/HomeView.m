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
    
    
    
}


- (void)playClick{
    
    [self.delegate respondsToSelector:@selector(playClick)] ?
    [self.delegate playClick] :
    nil;
}

- (BoardView*)board{
    if(!_board){
        _board = [[BoardView alloc]initWithFrame:CGRectMake(100, 100, gridToFrame(boardWidth),gridToFrame(boardHeight))];
    }
    return _board;
}

@end

//
//  BoardView.m
//  Tetris
//
//  Created by T D on 2022/8/13.
//

#import "BoardView.h"
#import "Constant.h"
#import "BrickView.h"
#import "BrickManager.h"

@interface BoardView()

@property (nonatomic,strong) NSMutableArray<BrickView*>* curBricks;
@property (nonatomic,strong) NSMutableArray<BrickView*>* existBricks;
@property (nonatomic,strong) NSMutableArray<BrickView*>* nextBricks;

@property (nonatomic,strong) dispatch_source_t timer;

@end

@implementation BoardView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        for(NSInteger width = 0; width < boardWidth; width ++){
            for(NSInteger height = 0; height < boardHeight; height ++){
                GridView * grid = [[GridView alloc]initWithFrame:CGRectMake(gridToFrame(width), gridToFrame(height), gridSize, gridSize)];
                [self addSubview:grid];
            }
        }
    }

    return self;
}



@end

@implementation GridView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor lightGrayColor];
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = [UIColor lightTextColor].CGColor;
        
    }
    return self;
}

@end

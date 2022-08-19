### 基本介绍

本项目为基于Objective-C和UIKit的俄罗斯方块App，本项目使用代码布局，具有如下特点：

- 功能完整：包含俄罗斯方块游戏中8种基本方块的旋转、左右移动操作，额外提供游戏的暂停和重置功能。
- 界面美观：模拟真实游戏机外表
- 操作真实：按钮点击提供音效反馈
- 玩法扩展：手动选择不同速度，挑战不同游戏难度

<img src="https://qiniu.dcts.top/typora/202208191522639.png" alt="image-20220819140236122" style="zoom:33%;" />



### 核心实现介绍

![image-20220819151253934](https://qiniu.dcts.top/typora/202208191522670.png)

#### 界面

规定构成BoardView的最小单位是20 x 20大小的灰色Grid。以Grid为单位，构建width为10 Grid，height为20Grid的BorderView。

规定构成Bricks的最小单位是20 x 20大小的黑色BrickView。使用单例BrickManager，记录每一类型的Bricks四个方块的坐标

在绘制的时候需要通过gridToFrame函数将相对大小转换为真实的大小。

#### 方块生成

定义三个数组

```objective-c
@property (nonatomic,strong) NSMutableArray<BrickView*>* curBricks;
@property (nonatomic,strong) NSMutableArray<BrickView*>* existBricks;
@property (nonatomic,strong) NSMutableArray<BrickView*>* nextBricks;
```

curBricks：当前正在下降的方块

existBricks：固定在borderView上的，静止不动的方块

nextBricks：下一个降落的方块

nextBricks随机生成，curBricks从nextBricks中获得最新的方块

#### 方块操作

- 方块移动

判断移动后的方块是否会越界或发生碰撞，若不会，则更新方块的frame

- 旋转

利用BrickManager生成旋转后的方块，判断旋转后的方块是否会越界或发生碰撞，若不会，则根据方块的中心点，计算偏移量。根据偏移量将新方块更新到界面上。

#### 方块消除

根据existBricks，从下到上判断BrickView是否铺满一整行，若铺满则消除并使消除的数量加一。若未铺满，则根据消除数量向下移动方块。

更新玩家分数为消除数量*100分。




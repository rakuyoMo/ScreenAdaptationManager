# ScreenAdaptation
## 项目目标:
屏幕适配练手demo。 采用以下四种方法进行屏幕适配：
- [x] 1. 纯代码创建5个视图，使用`frame`布局。
- [x] 2. 纯代码创建5个视图，使用`autoresizing`布局。
- [x] 3. xib/sb创建视图，使用`autoresizing`布局。
- [x] 4. xib/sb创建视图，使用`autolayout`布局。

## 相关笔记

- [x] [iOS开发之屏幕旋转](https://rakuyomo.github.io/2017/07/23/iOS开发之屏幕旋转/)
- [ ] [iOS开发之在storyboard中使用Autolayout](http://)
- [x] [iOS自动布局之Autoresizing（code && storyboard）](https://rakuyomo.github.io/2017/07/23/iOS自动布局之Autoresizing（code%20&&%20storyboard）/)

## 任务4(sb创建视图，使用autolayout布局)思路:
> 因为在storyboard下完全使用autolayout进行屏幕适配，会给阅读项目造成很大的障碍，所以在此写一下添加约束时的思路，方便阅读。
> 约束在横屏、竖屏下相似，故以竖屏举例。

### mainView
>共4个约束。

1. `mainView`分别设置与其父视图的上、下、左、右间距。
2. 在代码中修改上、下间距为`(self.view.frame.size.height - self.mainView.frame.size.width) / 2`，即视图高度减去`mainView`宽度(*屏幕宽度*)，再除以2，得到上下间距。目的是维持`mainView`为正方形。
3. 在代码中监听屏幕旋转，参考第二条修改`mainView`左右/上下间距。

### leftView与rightView
>每个视图共7个约束。

1. `leftView`与`rightView`设置`vertical Centers`水平对齐。 
2. `leftView`与`rightView`分别设置与其父视图`mainView`左/右对齐。
3. `leftView`与`rightView`分别设置与其父视图`mainView`等宽等高，并设置宽度系数为**0.5**，以确定高度宽度。
4. `leftView`与`rightView`分别设置与其父视图`mainView`上、下间距为0，左/右间距为0，以确定Y、X值。

### firstView、secondView、thirdView与fourthView
>以左侧为例，每个视图共8个约束。

1. `firstView`与`secondView`设置`Horizontal Centers`垂直对齐。
2. `firstView`与`secondView`设置等宽等高。
3. `firstView`与`secondView`分别设置与其父视图`leftView`左间距为10，右边距为5。
4. 设置`firstView`与`secondView`中间间距为5.
5. `firstView`设置与其父视图`leftView`上间距为10。
6. `secondView`设置与其父视图`leftView`下间距为10。

### 问题:
- 在`plus`尺寸下，横屏时**约束失效**，具体表现为:右侧属性面板`Installed`已被选中，但是左侧约束图标不亮，且报错。如图:
![](http://wx4.sinaimg.cn/large/d1290e0aly1fhsxddrc9rj21kw13bu14.jpg)
- 解决办法是在**横屏的plus尺寸**下重新添加了一遍约束，但感觉这是迫不得已的办法，不是真正的解决办法....
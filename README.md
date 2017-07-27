# ScreenAdaptation
## 屏幕适配项目目标:
 采用以下四种方法进行屏幕适配：
- [x] 1. 纯代码创建5个视图，使用`Frame`布局。
- [x] 2. 纯代码创建5个视图，使用`Autoresizing`布局。
- [x] 3. xib/sb创建视图，使用`Autoresizing`布局。
- [x] 4. xib/sb创建视图，使用`Autolayout`布局。

## 待修改问题

- [x] 1.调整目录结构。
- [x] 2.删掉BaseView中获取屏幕尺寸的方法，改为调用self.superView的方法。
    - [x] 2.5 解决掉2后出来的新问题:初始为横屏时，图形位置有问题。
- [x] 3.封装BaseView中暴露的内部属性。
- [x] 4.为所有添加旋转监听的地方设置取消监听。
- [x] 5.重新理解在storyboard中使用autolayout，修改视图约束。
- [x] 6.解决任务3中，当界面初始为横屏时，BaveView位置错误的问题。
- [x] 7.封装ListTableViewController中的数据源。
    - [x] 7.5 将控制器初始化放在点击跳转中。
    - 最后还是将模型合并为了1个。分成两个模型还是没有必要。
- [x] 8.修改BaseView下的4个子视图的Frame设置，使其具有可变性，以防未来需求变动。
- [x] 9.检查除任务2外，剩下3个任务，在快速横屏过程中会出现视图大小错误的问题。
- [x] 10.将旋转监听改为viewDidLayoutSubviews和layoutSubviews。
- [x] 11.重新理解在storyboard中使用Autoresizing，修改视图约束。
- [x] 12.将BaseView拆分开来，即在Frame-Code和Autoresizing-Code中不再共用一个BaseView视图。
- [x] 13.在任务2中，将4个子视图全部用Autoresizing方法布局。
- [x] 14.修改两个View中关于NaviBar高度的代码。
- [x] 15.思考整合两个RootTableViewModel的方法。
    - 方法：将两个model放到一个数组中。将数组赋值给cell。然后cell再取数组中对应的model元素，最后将Mode元素的Title或者ViewController赋值到对应的位置。
- [x] 移除autolayout_SB中用代码进行约束的部分，全部改为在storyboard中用约束搞定。
- [x] 修改了在每次点击cell的时候都会添加ViewController的问题。

## 相关笔记

- [x] [iOS开发之屏幕旋转](https://rakuyomo.github.io/2017/07/23/iOS开发之屏幕旋转/)
- [x] [iOS自动布局之Autoresizing（code && storyboard）](https://rakuyomo.github.io/2017/07/23/iOS自动布局之Autoresizing（code%20&&%20storyboard）/)
- [x] [iOS自动布局之在StoryBoard中使用Autolayout和SizeClass](https://rakuyomo.github.io/2017/07/26/iOS自动布局之在StoryBoard中使用Autolayout/)
- [x] [Objective-C之Block代码块](https://rakuyomo.github.io/2017/07/26/Objective-C之在函数的参数中使用Block代码块/)

## 任务4(sb创建视图，使用autolayout布局)思路:
> 因为在storyboard下完全使用autolayout进行屏幕适配，会给阅读项目造成很大的障碍，所以在此写一下添加约束时的思路，方便阅读。
> 约束在横屏、竖屏下相似，故以竖屏举例。

### mainView
>共5个约束。

1. 设置`mainView`与`self.view`**水平对齐**。
2. 设置`mainView`与`self.view`**垂直对齐**。
3. 设置`mainView`的**长宽比**为**1：1**。
4. 在**竖屏状态**下，分别设置`mainView`的**左、右间距**为0。
5. 在**竖屏状态**下，分别设置`mainView`的**上、下间距**为0。

### leftView与rightView
>每个视图共6个约束。

1. `leftView`与`rightView`设置`vertical Centers`**水平对齐**。
2. `leftView`与`rightView`分别设置与其父视图`mainView`**宽相等**，并设置宽度**系数**为**0.5**。
3. `leftView`与`rightView`分别设置与其父视图`mainView`**高相等**。
4. `leftView`与`rightView`设置**左/右间距**为0。
5. `leftView`与`rightView`设置分别设置**上间距**为0。
6. `leftView`与`rightView`设置分别设置**下间距**为0。

### firstView、secondView、thirdView与fourthView
>以firstView为例，每个视图共6个约束。

1. `firstView`与`secondView`设置`Horizontal Centers`垂直对齐。
2. 设置`firstView`与`leftView`**右间距**为5。
3. 设置`firstView`与`leftView`**左间距**为10。
4. 分别设置`firstView`与`leftView`**上间距**为10。
5. 分别设置`firstView`与`leftView`**下间距**为10。
5. 设置`firstView`的**长宽比**为**1：1**。

### 问题:
- 在`plus`尺寸下，横屏时**约束失效**，具体表现为:右侧属性面板`Installed`已被选中，但是左侧约束图标不亮，且报错。如图:
![](http://wx4.sinaimg.cn/large/d1290e0aly1fhsxddrc9rj21kw13bu14.jpg)
- 解决办法是在**横屏的plus尺寸**下重新添加了一遍约束，但感觉这是迫不得已的办法，不是真正的解决办法....
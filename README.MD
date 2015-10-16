
例子主要参考了这篇博客
<http://www.cocoachina.com/ios/20141022/10005.html>
## LearnCALayer
- 使用了CALayer的隐式动画完成了一个圆圈点击放大／缩小
- **在Controller直接对View的Sublayer的属性操作**，可以得到隐式的动画效果

## LearnCALayer1
例子首先为当前的View添加了一个sublayer，但是可以看到在customizeLayer中没有任何对layer画图的操作，而所有的画图操作都通过代理函数`drawLayer:inContext:`完成，代理函数会在`[layer setNeedsDisplay]`时候被调用

另外通过Add/Remove Shadow Button可以实现增加或者删除阴影层的操作（就是另外又多加了一层）

下面这两行代码完成了直接画图像倒置的问题，这是因为iOS的坐标系与Quartz的坐标系的不统一导致

```
CGContextScaleCTM(ctx, 1, -1);
CGContextTranslateCTM(ctx, 0, -PHOTO_HEIGHT);

```

## LearnCALayer2

想在layer上画一个图的三种方法

- (1) 使用3D变换解决坐标系颠倒的问题

```
layer.transform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
layer.delegate = self;
[self.view.layer addSublayer:layer];
[layer setNeedsDisplay]; //回去调用代理函数画图
```
- (2) 直接使用setContents

```
UIImage * image = [UIImage imageNamed:@"image.jpg"];
[layer setContents:(id)image.CGImage];
[self.view.layer addSublayer:layer];
```
- (3) 用setValue:forKeyPath:命令进行3D坐标变换

```
[layer setValue:@M_PI forKeyPath:@"transform.rotation.x"];
layer.delegate = self;
[self.view.layer addSublayer:layer];
[layer setNeedsDisplay];//回去调用代理函数画图
```

## LearnCALayer3
自定义View，自定义Layer，观察画图顺序  
  
- 1 CustomView中的`drawLayer:inContext`，系统生成上下文  
- 2 CustomView中的`drawRect:`，这时候可以通过`UIGraphicsGetCurrentContext()`得到上一步中生成的上下文  
- 3 CustomLayer中的`drawInContext:`被调用，layer在自己的上下文中画图

## LearnCALayer4
这个例子主要是想结合动画，观察在CALayer上画图的过程  
layer的`position`会随着时间向左移动，同时layer的内容也会每次都予以更新(一闪一闪亮晶晶)

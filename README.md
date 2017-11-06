# JChat Swift 演进过程 -  打造一款通用的 IM UI 库

> 内容简介: 
> 
> 近年来随着APP应用社交化的发展，越来越多的应用开始接入即时通讯 SDK ，以便快速实现社交功能。同时开发者希望有一款通用的 IM UI 来避免重复开发，提高开发效率。本次分享将会结合极光推送公司JChat产品的开发经验，介绍如何优雅地实现一款通用的 IM UI 库，并谈谈开发过程中遇到的坑及相应的解决方法，以及如何减少重复开发和增加代码的可扩展性。


最近半年的时间里，我从 SDK 开发转到 IM UI 库的开发（其实就是一个完整 IM APP），也完全过度到使用 Swift 进行开发。直到某天，领导对我说：“你去做个关于我们极光 IM 的演讲吧”，当时我就懵逼了，看来唯有谈谈我最近半年的工作心得了，我作为一位执行力比较强的小跟班，领导的话我肯定是服从安排，所以很直接就把主题定为：

> 如何使用 [极光 IM JMessage](https://www.jiguang.cn/im)

嗯...目测这样直接打广告，显得水平就不太高，主办方也无情地拒绝了，虽然我们是同一家公司的，但他们还是很坚守原则的，所以只能稍微把演讲主题改了一下：

> 如何打造一款通用的 IM UI 库

## UI 库与 APP 的差别
### 开发者 VS 用户
在座的各位，估计大部分都是 iOS 开发者，我们当中，可能较多的人都是从事 APP 开发，估计也有部分是从事 SDK 开发的同学。我们都知道，APP 主要面向的用户，用户更加注重的是应用的使用和功能，而SDK 面向的则是开发者，开发者关注的则是 SDK 具有哪些功能和这些功能是如何去实现和使用的。同样，UI 库其实也可以说成是 SDK，它只是针对界面层的 SDK，它面向同样是开发者，有着和 SDK 类似的特点。

### 重复造轮子

>“Stop Trying to Reinvent the Wheel”

因为我所在的部门本身就是开发 IM SDK 的，去写这么一个 UI 库的主要目的还是避免开发者重复开发轮子，毕竟时间可贵，珍惜生命，少写重复代码。在我们实际开发中，我们不应该重复造轮子，听好几个朋友说过，他们公司不允许使用任何的第三方库，这个不知道是出于什么原因，但个人感觉这是一种浪费生命的行为，对于那些优秀的开源框架，比如说像 AFNetWorking，当我们需要使用相关的功能时，我们完全有理由去拿来直接使用，而不是花大量的时间去开发新的轮子，软件是有生命周期的，可能待你把所以有轮子造好，你的软件就已经可以和市场 say goodbye 了，并且轮子造好时，还需要花费大量的人力和时间去进行测试和验收。

作为一个开发者，在工作上面压力很多时候都不会轻，在我们有限的开发生涯中，应该如何有效利用时间来做一些更有价值的事情，而且不是浪费在造轮子上。显然，罗马不是一天建成的，也不是一个人建成的。我们需要学会把自己和别人写的代码组织起来，高效地利用，并以此为基础构建软件。如何优雅地实现一款通用的组件，在方便自己工作的同时，给其它开发者带来方便，这就是我今天想讲的主题，下面都会以 IM UI 库为例进行演讲。

### 可兼容性
作为一款通用的 IM UI 库，首先兼容性是必不可少的，它不是单纯的一个 APP，它应该更具有通用性，兼容各类型的 IM SDK，而不单单是针对自己公司的产品，最理想的姿势当然是支持所有类型的 IM SDK，但理想都是美好的，现实却总是会时不时打击下我们。这里就先不管能不能支持所有的 IM SDK，这是一个 target，前方路的还很漫长，我们尚需努力。下面将从 JChat 的架构设计来你介绍整个 UI 库的兼容性实现和解耦过程。

## JChat 架构设计
### 旧 JChat 消息处理

![图片.png](http://upload-images.jianshu.io/upload_images/1834458-eb70a57f73566dcb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/640)

在接手 JChat Swift 开发之前，有一个年久失修的 OC 版本的 JChat，它在消息处理层上，是直接使用 SDK里面的 JMSGMessage 作为整个应用的消息体对象来使用（这里说明下，这里的 SDK 指的是我们极光 IM SDK，下面不重复说明），这样做，也不是说不可以，多么简单明了，但是，如果某一天，领导说：“这个 IM SDK 满足不了我们当前业务，我们需要更换成 xxxx IM SDK，下周出新版本”。

![笑着活下去](http://upload-images.jianshu.io/upload_images/1834458-8b9a3db2e7ab76d0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/320)

估计如果是新来接手这个项目的人，肯定懵逼了，我想整个应用的业务逻辑层都需要去改，这其中到底有多苦逼，只有自己去真正去体验一把，试过才能知道其中有多艰辛。希望位都不会遇到这种神项目，如果真的碰到了，我也只能对你说一句：“兄弟，笑着活下去吧”。

![程序员为何为难程序员](http://upload-images.jianshu.io/upload_images/1834458-6e60319d06f2610a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/320)

同时也希望所有人尽量不要写这种代码，说不定某天刚好与接手你项目的同事或前同事相遇街角，狭路相逢，说不定你就需要躺着出来。

在就里只是和大家开个玩笑，但并不是不可能的，好了，下面回到正题。

### JChat Swift 消息处理

![图片.png](http://upload-images.jianshu.io/upload_images/1834458-4a419044b24934d4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/640)

在 JChat Swift 里面，不再使用这种高耦合的方式，而是在上层再封装一层与 IM SDK 无关的 JCMessage，只保留消息展示所需的信息，在应用的业务逻辑层里面，都只依赖于 JCMessage，这样不管你使用的极光的 IM 也好，还是环信的 IM 也好，或者其它的 IM SDK，只需要去修改从 xxxMessage -> JCMessage 的解析方法就可以了，其它的业务逻辑就基本不需要去改动了。

同时，为了提供更好扩展性，我们应该提供一个 JCMessageType 协议：

```
protocol JCMessageType: class {    
    var msgId: String { get }
    var content: JCMessageContentType { get }
    var options: JCMessageOptions { get }
    var targetType: MessageTargetType { get }
    // ...
}
```

![图片.png](http://upload-images.jianshu.io/upload_images/1834458-9e71c9bbe5f0e8e7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/640)

这样不管是 JCMessage 还是 XMessage, 只需要实现 JCMessageType 协议:

```
class JCMessage: NSObject, JCMessageType {
    init(content: JCMessageContentType) {
        self.content = content
        self.options = JCMessageOptions(with: content)
        super.init()
    }
    open var msgId = ""
    open var targetType: MessageTargetType = .single
}
```

那么在原来的逻辑上都不需要改动，开发者还可以自定义一些字段或者做一些其它的扩展，使用的自由度更大。

这里虽然是 IM UI 库的实现为，但其实在其它地方上也是同理的，比如使用某些第三方闭源包时，在上层提供一层稳定的 api，使上层的业务逻辑保持稳定，当 SDK Api 或者内部实现发生变动时，我们只需要在底层的实现去做适配就可以了，上层业务层就不会受影响，把受影响范围控制在最小。

### 消息类型的扩展
在做 IM 应用的时候，变动最多的莫过于各种类型的消息添加了，比如今天只需要最简单的文本消息、语音消息和图片消息，过两天就需要你添加片名消息、阅后即焚消息等。所以在 IM UI 库中，如何设计各种消息体的实现就很重要了。

```
protocol JCMessageContentType: class  {    
    // 消息体展示的大小
    func sizeThatFits(_ size: CGSize) -> CGSize   
    // 消息类型
    static var viewType: JCMessageContentViewType.Type { get }
}

protocol JCMessageContentViewType: class {
    init()
    // 渲染消息
    func apply(_ message: JCMessageType)
}
```

消息的展示，其实只需要知道消息内容和类型就可以绘制出来，所以在这里定义了 JCMessageContentType 协议和 JCMessageContentViewType 协议，消息 Content 实现 JCMessageContentType 时需要实现 sizeThatFits 方法来返回 content 的 size，来确定它在界面上显示的大小，同时需要定义它的 ContentViewType，就是它的类型。消息的展示 View 实现 JCMessageContentViewType 时，需要实现 apply 方法，通过 apply 方法来把 message 的信息渲染到界面上。

在 ChatViewLayout（MessageCell 布局文件） 中，通过 JCMessageContentType 的 sizeThatFits 来获取 MessageCell 的大小，在 MessageCell 中，则是通过 JCMessageContentViewType 的 apply 来设置展示的内容，不管你是什么类型的消息，只要你符合协议的要求，ChatView 就可以把 Message 渲染出来，这样就可以降低 ChatView 与 Message Type 的耦合，使用者就可以更快更方便地实现各种类型的消息，并且不需要原来的代码进行改动。

### API 设计

#### 最小化原则

1. 尽可能少的接口来完成任务2. 尽可能少的访问权限

#### ChatView

下面说下整个 UI 库最复杂的界面 ChatView 的 API。

![ChatView.png](http://upload-images.jianshu.io/upload_images/1834458-4a945a9d38c6b142.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/240)

```
public func insert(_ newMessage: JCMessageType, at index: Int)
public func insert(contentsOf newMessages: Array<JCMessageType>, at index: Int)

public func append(_ newMessage: JCMessageType)
public func append(contentsOf newMessages: Array<JCMessageType>)
    
public func update(_ newMessage: JCMessageType, at index: Int)
    
public func removeAll() 
public func remove(at index: Int)
public func remove(contentOf indexs: Array<Int>)
```

基于 UI 库的特点，相较于 app 开发，需要更着重地考虑 API 的设计。你标记为 public 的内容将是使用者能看到的内容。提供什么样的 API 在很大程度上决定了其他的开发者会如何使用该 UI 库。

在 API 设计的时候，从原则上来说，我们一开始可以提供尽可能少的接口来完成必要的任务，这有利于控制整个 UI 库的复杂程度。 在 ChatView 中我们只提供必须的添加、删除和修改消息的接口，只需要向 ChatView 传递正确 JCMessageType，ChatView 就会负责在界面上渲染出来，使用者不需要再去关心 ChatView 的显示过程，只需要保证传递正确 JCMessageType 序列就可以了。最少的接口也减少了开发者的学习成本，减少不必须的歧义，如果后期需要，开发者可以对其进行二次开发，添加所需的公共方法，或者把原有的一些私有方法设置成公有。

#### OC 与 Swift 命名兼容

[OC 方法名兼容 Swift 调用](http://www.jianshu.com/p/0952d0d5e7f1)

## JChat 性能优化
### 缓存
在 JChat Swift 实现中，为了提高性能，很多地方都添加了缓存，就像缓存计算出来的 Message Cell 的 size、图片加载资源加载等，这里以 JChat 主题管理功能为例，详细说下。

![JChat 主题管理 UML](http://upload-images.jianshu.io/upload_images/1834458-06f0deef16bae840.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/640)

JChat 的主题管理功能是通过 bundle 来管理图片，不同的主题皮肤的图片资源放在对应的 bundle 里面，共同的资源放在默认的 bundle 中，当监听到主题切换时，只需要切换图片访问路径并刷新界面就可以了。

关于 JChat 主题管理功能的实现的详细可以参考：

[再谈 Swift 换肤功能](http://www.jianshu.com/p/ea0f60dfd0f1)

在 JChat 中，聊天的时候，较多界面上都有进行频繁的刷新，就如聊天列表或消息列表，这里就会有大频率的重复访问本地的图片的，特别是当用户长时间没有登录，积累了大量离线消息时，下次登录时，会一次性收到大量的离线消息，在上层刷新频繁就会非常大了，一些应用里面的默认图片的访问量可能就会比较大，我们通过文件的方式来加载本地图片时，就会存在性能的问题，所以在访问图片资源的时候，如果该图片如果已经缓存在内存中时，我们就从缓存中读，如果 缓存中没有，则从硬盘里面读取，并把该图片缓存到内存中，这样的话，资源图片实质上都只加载一次，而不需要多次去加载。需要注意的是，因为图片一直缓存在内存中时，就需要监听系统是否有内存警告，如果系统发出内存警告时，就需要手动去清空缓存，避免应用 crash。

### 其它

1. 离屏渲染（Offscreen-Rendered）
2. 图层混合（Blended Layers）
3. 复杂界面不使用 autolayout
4. ...

### 结束语 
简单的小结下，虽然整个演讲都以 IM UI 为例，但实际上，在其它方面的开发也是类似套路的，以不变应万变，万变不离其宗，程序开发，最重要的是思路。
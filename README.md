## 介绍

HarmonyOsDialog是一个便捷的弹窗，**一行代码便可以搞定**，只需初始化一次，便在任何地方都可以弹出，脱离原生Dialog限制，Dialog中也封装了包含常见的弹窗样式，并且支持自定义页面，自定义组件形式。

截至2024年6月25日，功能点如下

- 1、**支持自定义页面弹窗形式**
- 2、**支持自定义组件弹窗形式**
- 3、**支持信息弹窗样式**
- 3、**支持确认/取消弹窗样式**
- 4、**支持底部列表弹窗(可动态修改样式)**
- 5、**支持底部网格列表形式（如常见的分享）**
- 6、**支持城市地址选择**
- 7、**支持各种时间格式选择**
- 8、**支持Toast提示，可任意修改属性，可设置图片，支持左上右下四个方位设置**

## 开发环境

DevEco Studio NEXT Developer Beta1,Build Version: 5.0.3.100

Api版本：**11**

hvigorVersion：4.2.0

## 效果

<p align="center">
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/dialog/dialog_001.png" width="150px" />
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/dialog/dialog_002.png" width="150px" />
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/dialog/dialog_003.png" width="150px" />
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/dialog/dialog_004.png" width="150px" />
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/dialog/dialog_005.png" width="150px" />
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/dialog/dialog_006.png" width="150px" />
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/dialog/dialog_007.png" width="150px" />
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/dialog/dialog_008.png" width="150px" />
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/dialog/dialog_009.png" width="150px" />
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/dialog/dialog_010.png" width="150px" />
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/dialog/dialog_011.png" width="150px" />
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/dialog/dialog_012.png" width="150px" />
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/dialog/dialog_013.png" width="150px" />
</p>

## 动态效果
<p align="center">
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/dialog/dialog_g_001.gif" width="200px" />
</p>

## 快速使用

有多种使用方式，比如远程依赖、本地静态共享包依赖,源码方式依赖，推荐使用**远程依赖**，方便快捷，有最新修改可以及时生效。

### 1、远程依赖方式使用【推荐】

方式一：在Terminal窗口中，执行如下命令安装三方包，DevEco Studio会自动在工程的oh-package.json5中自动添加三方包依赖。

**建议：在使用的模块路径下进行执行命令。**

```
ohpm install @abner/dialog
```

方式二：在工程的oh-package.json5中设置三方包依赖，配置示例如下：

```
"dependencies": { "@abner/dialog": "^1.0.1"}
```

<p align="center"><img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/dialog/dialog_01.png" width="300"></p>

### 2、本地静态共享包har包使用【不推荐】

<p>首先，下载har包，<a href="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/dialog/dialog-1.0.1.har">点击下载</a></p>
<p>下载之后，把har包复制项目中，目录自己创建，如下，我创建了一个libs目录，复制进去</p>
<p><img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/dialog/dialog_02.png"></p>
<p>引入之后，进行同步项目，点击Sync Now即可，当然了你也可以，将鼠标放置在报错处会出现提示，在提示框中点击Run 'ohpm install'。</p>
<p>需要注意，<strong>@abner/dialog</strong>，是用来区分目录的，可以自己定义，比如@aa/bb等，关于静态共享包的创建和使用，请查看如下我的介绍，这里就不过多介绍</p>

[HarmonyOS开发：走进静态共享包的依赖与使用](https://juejin.cn/post/7274982412245876776)

### 查看是否引用成功

无论使用哪种方式进行依赖，最终都会在使用的模块中，生成一个oh_modules文件，并创建源代码文件，有则成功，无则失败，如下：

<p align="center"><img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/dialog/dialog_03.png" width="300"></p>

## 代码使用

### 1、全局初始化

第一步、创建一个page，名字自定义，如下所示，我创建了一个ADialogPage页面，并引入ADialogView，**以下代码可直接复制**
，如果创建的页面在main_pages.json中没有依赖，需要手动进行依赖！！！

```typescript

import { ADialogView, hideDialog } from '@abner/dialog';

@Entry
@Component
struct ADialogPage {

  build() {
    RelativeContainer() {
      ADialogView()
        .id('a_dialog')
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
      .width('100%')
  }

  /*
  * Author:AbnerMing
  * Describe:监听点击返回键
  */
  onBackPress(): boolean | void {
    hideDialog()
  }
}

```

第二步、在您使用的Module中，EntryAbility类中，onWindowStageCreate方法里进行初始化，**必须！**

```typescript

dialogInit(windowStage, "pages/ADialogPage")

```

| 属性          | 类型                 | 概述                                      |
|-------------|--------------------|-----------------------------------------|
| windowStage | window.WindowStage | 窗口管理器                                   |
| pagePath    | string             | 自己刚才创建的页面                               |
| attribute   | FusionAttribute    | 可选参数，dialog属性全局配置，用于修改弹窗样式，可根据UI在这里进行配置 |


#### FusionAttribute属性

FusionAttribute是全局的dialog属性配置，如果默认提供的dialog样式和您的项目中样式不一样，可通过此参数进行设置，全局配置一次
页面中的所有使用地方均会生效，方便您后续使用。

| 属性                     | 类型                  | 概述                  |
|------------------------|---------------------|---------------------|
| infoOrConfirmAttribute | ContentAttribute    | 可选参数，信息或者确认形式弹窗属性配置 |
| bottomListAttribute    | BottomListAttribute | 可选参数，底部列表弹窗属性配置     |
| bottomGridAttribute    | BottomGridAttribute | 可选参数，底部网格列表弹窗属性配置   |
| toastAttribute         | ToastAttribute      | 可选参数，Toast属性配置      |

##### ContentAttribute属性

ContentAttribute是信息或者确认形式弹窗属性配置。

| 属性                | 类型                      | 概述                   |
|-------------------|-------------------------|----------------------|
| title             | string / Resource       | 可选参数，标题,全局初始化中无需配置   |
| message           | string / Resource       | 可选参数，描述信息,全局初始化中无需配置 |
| cancelText        | string / Resource       | 可选参数，取消文字            |
| confirmText       | string / Resource       | 可选参数，确认文字            |
| clickCancelHide   | boolean                 | 可选参数，默认点击取消隐藏        |
| isHideTitle       | boolean                 | 可选参数，是否隐藏标题，默认不隐藏    |
| clickCancel       | 回调                      | 可选参数，点击取消回调事件        |
| clickConfirm      | 回调                      | 可选参数，点击确认回调事件        |
| bottomMenuHeight  | Length                  | 可选参数，底部按钮高度          |
| backgroundColor   | ResourceColor           | 可选参数，背景颜色            |
| radius            | BorderRadiuses / Length | 可选参数，角度              |
| titleAttribute    | TitleAttribute          | 可选参数，标题样式属性          |
| messageAttribute  | MessageAttribute        | 可选参数，描述样式属性          |
| dividerHAttribute | DividerHAttribute       | 可选参数，横向分割线样式属性       |
| dividerVAttribute | DividerVAttribute       | 可选参数，垂直分割线样式属性       |
| confirmAttribute  | ConfirmAttribute        | 可选参数，确认样式属性          |
| cancelAttribute   | CancelAttribute         | 可选参数，取消样式属性          |
| dialogAttribute   | DialogAttribute         | 可选参数，弹窗总体属性          |

##### BottomListAttribute属性

BottomListAttribute是底部列表弹窗属性配置。

| 属性              | 类型                      | 概述          |
|-----------------|-------------------------|-------------|
| backgroundColor | ResourceColor           | 背景颜色        |
| items           | string[]                | 列表条目        |
| itemClick       | (position: number)      | 条目点击回调      |
| cancelClick     | ()                      | 取消点击回调      |
| isHideCancel    | boolean                 | 是否隐藏取消按钮    |
| isTransparent   | boolean                 | 是否透明展示      |
| itemRadius      | Length / BorderRadiuses | 透明后条目整体的角度  |
| cancelRadius    | Length / BorderRadiuses | 透明后取消按钮角度   |
| topLeftRadius   | Length                  | dialog左上角角度 |
| topRightRadius  | Length                  | dialog右上角角度 |
| itemAttr        | BottomListItem          | 条目属性        |
| itemDivider     | ListItemDivider         | 分割线属性       |
| cancelAttr      | BottomListCancel        | 底部取消属性      |
| dialogAttribute | DialogAttribute         | 弹窗总体属性      |

##### BottomGridAttribute属性

| 属性                    | 类型                          | 概述                          |
|-----------------------|-----------------------------|-----------------------------|
| items                 | BottomGridModel[]           | 条目数据，用于网格                   |
| itemLineArray         | Array<BottomGridModel[]>    | 条目数据，用户每行展示几个，每行几个就几个数据     |
| columnSize            | number                      | 列数，默认是2列                    |
| barTitleAttr          | BarTitleGridAttribute       | 网格上边的titlebar属性             |
| barHeight             | number                      | 网格上边的titleBar的高度            |
| barCancelTextAttr     | BarCancelTextGridAttribute  | titleBar中的取消属性              |
| barCancelImageAttr    | BarCancelImageGridAttribute | titleBar中的取消图片属性，和文字二选一     |
| isBarCancelImage      | boolean                     | titleBar中的取消是否图片方式，默认是false |
| itemMarginTop         | number                      | item每一行距离顶部                 |
| backgroundColor       | ResourceColor               | 背景颜色                        |
| topLeftRadius         | Length                      | dialog左上角角度                 |
| topRightRadius        | Length                      | dialog右上角角度                 |
| isHideBar             | boolean                     | 是否隐藏titlebar                |
| dialogAttribute       | DialogAttribute             | 全局dialog属性                  |
| isItemAttrGlobal      | boolean                     | 条目属性是否使用全局，默认是              |
| itemAttr              | ItemGridAttribute           | 条目属性                        |
| itemClick             | (position: number)          | 条目点击回调                      |
| cancelClick           | ()                          | 取消点击回调                      |
| dividerColor          | ResourceColor               | 分割线颜色                       |
| dividerHeight         | number                      | 分割线高度                       |
| isLastDividerShow     | boolean                     | 最后一个是否显示，默认展示               |
| dividerMarginTop      | Margin / Length             | 分割线距离上边高度                   |
| isShowBottomCancel    | boolean                     | 是否展示底部取消按钮，默认不展示            |
| bottomCancelTextAttr  | CancelTextGridAttribute     | 底部的取消按钮属性                   |

##### ToastAttribute属性

| 属性              | 类型                                         | 概述             |
|-----------------|--------------------------------------------|----------------|
| msg             | string / Resource                          | 提示信息，初始化时无需    |
| duration        | number                                     | 弹出时间，默认2000    |
| backgroundColor | ResourceColor                              | 背景颜色           |
| fontColor       | ResourceColor                              | 字体颜色 ，默认ffffff |
| fontWeight      | number / FontWeight / string               | 字体粗细设置，默认400   |
| fontSize        | number / string              / Resource    | 字体大小，默认16      |
| fontFamily      | string / Resource                          | 字体样式           |
| borderRadius    | Length / BorderRadiuses                    | 角度             |
| padding         | Padding / Length                           | 内边距            |
| flexAlign       | FlexAlign                                  | 位置方向           |
| leftSrc         | PixelMap / ResourceStr/ DrawableDescriptor | 左边图片           |
| rightSrc        | PixelMap / ResourceStr/ DrawableDescriptor | 右边图片           |
| topSrc          | PixelMap / ResourceStr/ DrawableDescriptor | 上边图片           |
| bottomSrc       | PixelMap / ResourceStr/ DrawableDescriptor | 下边图片           |
| imageMargin     | Length                                     | 图片距离文字距离       |
| imageWidth      | Length                                     | 图片宽度           |
| imageHeight     | Length                                     | 图片高度           |
| imageAlt        | string /Resource                           | 加载时显示的占位图      |

### 2、信息弹窗

```typescript
showInfoDialog({
  title: "我是标题",
  message: "我是一段描述",
  clickConfirm: () => {
    //确认
   
  }
})
```

### 3、确认/取消弹窗

```typescript
showConfirmDialog({
  title: "我是一个标题",
  message: "我是一段描述",
  clickCancel: () => {
    //取消
  },
  clickConfirm: () => {
    //确认
  }
})
```

### 3、底部列表

```typescript
showBottomListDialog({
  items: ["我是条目一", "我是条目二"],
  itemClick: (position: number) => {
    hideDialog()
  }
})
```

### 4、底部列表透明

```typescript
showBottomListDialog({
  items: ["我是条目一", "我是条目二"],
  itemClick: (position: number) => {
    hideDialog()
  },
  isTransparent: true,
  dialogAttribute: {
    dialogMarginLeft: 20,
    dialogMarginRight: 20
  }
})
```

### 5、底部列表多样式

```typescript
showBottomListDialog({
          itemModels: [new BottomListModel("条目一", { fontColor: Color.Red }), new BottomListModel("条目二")],
          itemClick: (position: number) => {
            hideDialog()//销毁dialog
          }
        })
```

### 6、底部网格列表
```typescript
showBottomGridDialog({
          columnSize: 4,
          items: [new BottomGridModel("微信", $r("app.media.app_icon")),
            new BottomGridModel("朋友圈", $r("app.media.app_icon")),
            new BottomGridModel("QQ", $r("app.media.app_icon")),
            new BottomGridModel("QQ空间", $r("app.media.app_icon")),
            new BottomGridModel("微博", $r("app.media.app_icon")),
            new BottomGridModel("微博", $r("app.media.app_icon")),
            new BottomGridModel("微博", $r("app.media.app_icon")),
            new BottomGridModel("微博", $r("app.media.app_icon"))
          ],
        })
```
### 7、底部网格按行区分
```typescript
showBottomGridDialog({
          columnSize: 4,
          isShowBottomCancel: true,
          isHideBar: true,
          itemLineArray: [
            [new BottomGridModel("测试", $r("app.media.app_icon")),
              new BottomGridModel("测试", $r("app.media.app_icon"))],
            [new BottomGridModel("测试", $r("app.media.app_icon")),
              new BottomGridModel("测试", $r("app.media.app_icon")),
              new BottomGridModel("测试", $r("app.media.app_icon"))]
          ],
          itemClick: (position) => {
            
          }
        })
```
### 8、自定义组件弹窗一

默认组件会居中弹出。

第一步：弹出自定义组件代码，参数为number类型，用来区分你要弹出的类型

```typescript
 showCustomDialog(0)
```

第二步，在初始化中，定义自己的组件即可,给ADialogView，传递customView属性，在自定义组件中以类型作为组分即可。

```typescript
@Entry
@Component
struct ADialogPage {
  @Builder
  customView(type: number) {
    if (type == 0) {
      //自定义弹窗，可以把视图抽取出去
      Column() {
        Text("我是一个自定义的弹窗")
      }.width("100%")
      .height(100)
      .justifyContent(FlexAlign.Center)
      .backgroundColor(Color.White)
    } else if (type == 1) {
      //自定义弹窗2，可以把组件单独的抽出去
      SelfView()
    }
  }

  build() {
    RelativeContainer() {
      ADialogView({
        customView: this.customView
      })
        .id('a_dialog')
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }

  /*
  * Author:AbnerMing
  * Describe:监听点击返回键
  */
  onBackPress(): boolean | void {
    hideDialog()
  }
}
```


### 9、自定义页面弹窗
传递你的page路径即可，同组件下相对路径，不同组件下绝对路径，由于所有的页面都是自己完成，需要主要dialog销毁场景，比如点击空白，比如点击返回键等。
```typescript
 showCustomDialogPage("pages/TimePage")
```
### 10、toast提示
```typescript
 showToast("我是一个普通的toast")
```
### 11、toast改变背景
```typescript
  showToast("我是一个改变背景的Toast", { backgroundColor: Color.Red })
```
### 12、toast改变位置
```typescript
 showToast("我是一个改变位置的Toast", { flexAlign: FlexAlign.Center })
```
### 13、toast图片设置

```typescript
   showToast("Toast设置Icon", { leftSrc: $r("app.media.app_icon") })
```

### 14、底部单列表

```typescript
   showBottomListScrollDialog({
  items: ["男", "女"],
  titleBarAttribute: {
    titleText: "选择性别"
  },
  listAttribute: {
    isCustomDivider: true
  },
  confirmClick: (value, index) => {
    console.log(value + "=========" + index)
  }
})
```

### 15、底部双列表不联动

```typescript
showBottomListScrollDialog({
  items: [["第一列1", "第一列2"], ["第二列1", "第二列2", "第二列3"]],
  titleBarAttribute: {
    titleText: "底部双列表不联动"
  },
  confirmClick: (value, index) => {
    console.log(value + "=========" + index)
  }
})
```

### 16、年月日时间弹窗

```typescript
showTimeDialog({
  titleBarAttribute: {
    titleText: "年月日时间弹窗",
  },
  confirmClick: (value, index) => {
    console.log(value + "=========" + index)
  }
})
```
### 17、时分秒弹窗

```typescript
showTimeDialog({
  titleBarAttribute: {
    titleText: "时分秒弹窗",
  },
  timeAttribute: {
    timeType: TimeDialogType.HMS
  },
  confirmClick: (value, index) => {
    console.log(value + "=========" + index)
  }
})
```

### 19、时分弹窗

```typescript
showTimeDialog({
  titleBarAttribute: {
    titleText: "时分弹窗",
  },
  timeAttribute: {
    timeType: TimeDialogType.HM
  },
  confirmClick: (value, index) => {
    console.log(value + "=========" + index)
  }
})
```

### 20、城市地址弹窗

```typescript
showAddressDialog({
  titleBarAttribute: {
    titleText: "城市地址弹窗",
  },
  confirmClick: (value, index) => {
    console.log(value + "=========" + index)
  }
})
```


## 更多案例

可以查看相关Demo。

## 关注公众号

鸿蒙先驱者，只分享精华的鸿蒙或者移动端技术文章，可微信扫码关注

<p><img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/abner.jpg" width="150px" /></p>


[鸿蒙精华技术文章列表](https://juejin.cn/column/7269566781248389178)

## 一对一指导【收费】

每个人的时间都是宝贵的，做为开发者的我，已经做到了技术上的免费开源，但仍然有很多问题无法做到及时处理。
也考虑到，鸿蒙是一个新的系统，大家在使用上会遇到各种各样的问题，也为了能够及时的解决及回复问题，大家可以付费进行一对一指导。

### 开源库使用指导

<p><img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/h_github_9.png" width="150px" /></p>

**重要信息：一定要在付款时备注您的微信号，我会主动加您！切记！切记！！切记！！！**
**诚信经营，来自一个北漂的老程序员心声！**

**一杯饮料的钱，您可以获取权益如下**

- 1、针对dialog库使用1对1辅导使用，并跟踪相关问题排查。
- 2、针对我的所有鸿蒙开源库，1对1辅导使用，并跟踪相关问题排查。
- 3、涉及到我的开源库，您提的业务需求，率先第一时间满足，并及时针对性开发。
- 4、未来我的鸿蒙开源库，可先遣体验。
- 5、鸿蒙脚手架，正在研发中，可首批次体验使用。

## License

```
Copyright (C) AbnerMing, HarmonyOsDialog Open Source Project

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

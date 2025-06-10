import {
  BottomAnimationView,
  hide,
  hideDialogId,
  setDialogAttribute,
  showDialog,
  showDialogParams,
  updateDialogParams
} from '@abner/dialog'

/**
 * AUTHOR:AbnerMing
 * DATE:2025/4/17
 * INTRODUCE:dialog自定义视图
 * */
@Entry
@Component
struct CustomPage {
  private items = ["默认弹出", "自定义底部弹窗", "自定义弹窗带参数", "数据更新"]
  private mTimeoutId: number = -1

  build() {
    Column() {
      ForEach(this.items, (item: string, index: number) => {
        Text(item)
          .width("50%")
          .height(40)
          .textAlign(TextAlign.Center)
          .border({ width: 1, color: Color.Red })
          .borderRadius(20)
          .margin({ top: 20 })
          .onClick(() => {
            this.itemClick(index)
          })
      })
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }

  private itemClick(index: number) {
    switch (index) {
      case 0: //自定义弹窗默认中间弹出
        showDialog(wrapBuilder(SelfDialog))
        break;
      case 1: //自定义底部弹窗
        setDialogAttribute({
          dialogDismiss: () => {
            hide()
          },
          keyboardAvoidMode: KeyboardAvoidMode.NONE
        }).showDialog(wrapBuilder(BuilderDialog))
        break;
      case 2: //自定义弹窗带参数
        let params = new DialogParams()
        params.title = "我是传递的参数"
        params.onClick = () => {
          console.log("===事件回传")
        }
        showDialogParams(wrapBuilder(BuilderDialogParams), params)
        break;
      case 3: //自定义弹窗带参数
        let params1 = new DialogParams()
        params1.title = "我是传递的参数"
        let builder = wrapBuilder(BuilderDialogParams)
        showDialogParams(builder, params1)
        clearTimeout(this.mTimeoutId)
        this.mTimeoutId = setTimeout(() => {
          let params1 = new DialogParams()
          params1.title = "嘿嘿,我数据更新了"
          updateDialogParams(params1)
        }, 3000)
        break;
    }
  }
}

/*
* Author:AbnerMing
* Describe:自定义弹窗,布局自己定义
*/
@Builder
function SelfDialog() {

  Column() {

    Text("我是一个自定义弹窗")
      .margin({ top: 30 })

    TextInput()
      .margin({ top: 10 })

    Row() {
      Button("取消").onClick(() => {
        //隐藏dialog
        hide()
      })
      Button("确定")
        .margin({ left: 30 })
    }.margin({ top: 20 })
    .margin({ top: 30 })
  }.backgroundColor(Color.White)
  .width("60%")
}

/*
* Author:AbnerMing
* Describe:自定义弹窗,布局自己定义
*/
@Builder
function BuilderDialog() {
  //使用BottomAnimationView可以在底部弹出
  BottomAnimationView() {
    Column() {
      Text("我是一个自定义弹窗")
        .margin({ top: 30 })

      TextInput()
        .margin({ top: 10 })

      Row() {
        Button("取消").onClick(() => {
          //隐藏dialog
          hide()
        })
        Button("确定")
          .margin({ left: 30 })
      }.margin({ top: 20 })
      .margin({ top: 30 })
    }.backgroundColor(Color.White)
    .width("60%")
  }
}

/*
* Author:AbnerMing
* Describe:自定义弹窗传递参数,布局自己定义,参数可自己定义，对象，数组……
*/

class DialogParams {
  title?: string
  onClick?: () => void
}


@Builder
function BuilderDialogParams(params: DialogParams) {
  Column() {

    Text(params.title)
      .margin({ top: 30 })

    Row() {
      Button("取消").onClick(() => {
        //隐藏dialog
        hide()
      })
      Button("确定")
        .margin({ left: 30 })
        .onClick(() => {
          if (params.onClick != undefined) {
            params.onClick()
          }
        })
    }.margin({ top: 20 })
    .margin({ top: 30 })
  }.backgroundColor(Color.White)
  .width("60%")
}

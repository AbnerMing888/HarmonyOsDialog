import { hide, hideAll, hideDialogId, hidePosition, showDialogInfo } from '@abner/dialog'

@Entry
@Component
struct HideModePage {
  private items = ["普通模式", "【多个弹窗】按弹出顺序隐藏", "【多个弹窗】按Id隐藏", "【多个弹窗】隐藏全部"]
  private mTimeoutId: number = -1

  build() {
    Column() {
      ForEach(this.items, (item: string, index: number) => {
        Text(item)
          .width("70%")
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

  /*
* Author:AbnerMing
* Describe:条目点击
*/
  private itemClick(index: number) {
    switch (index) {
      case 0: //普通模式
        showDialogInfo({
          title: "我是标题",
          message: "3秒之后我会隐藏",
          clickConfirm: () => {
            //确认
            console.log("===点击了确认按钮")
          }
        })
        //3秒之后模拟隐藏
        clearTimeout(this.mTimeoutId)
        this.mTimeoutId = setTimeout(() => {
          hide()
        }, 3000)
        break
      case 1: //按弹出顺序
        showDialogInfo({
          title: "我是弹窗1",
          message: "111111111",
          clickConfirm: () => {
            //确认
            console.log("===点击了确认按钮")
          }
        })
        showDialogInfo({
          title: "我是弹窗2",
          message: "2222222222",
          clickConfirm: () => {
            //确认
            console.log("===点击了确认按钮")
          }
        })
        showDialogInfo({
          title: "我是弹窗3",
          message: "3333333333",
          clickConfirm: () => {
            //确认
            console.log("===点击了确认按钮")
          }
        })
        //3秒之后模拟隐藏2
        clearTimeout(this.mTimeoutId)
        this.mTimeoutId = setTimeout(() => {
          hidePosition(1)
        }, 3000)
        break
      case 2: //按id顺序
        showDialogInfo({
          title: "我是弹窗1",
          message: "111111111",
          dialogAttribute: {
            dialogId: "dialogInfo0"
          },
          clickConfirm: () => {
            //确认
            console.log("===点击了确认按钮")
          }
        })
        showDialogInfo({
          title: "我是弹窗2",
          message: "2222222222",
          dialogAttribute: {
            dialogId: "dialogInfo1"
          },
          clickConfirm: () => {
            //确认
            console.log("===点击了确认按钮")
          }
        })
        showDialogInfo({
          title: "我是弹窗3",
          message: "3333333333",
          dialogAttribute: {
            dialogId: "dialogInfo2"
          },
          clickConfirm: () => {
            //确认
            console.log("===点击了确认按钮")
          }
        })
        //3秒之后模拟隐藏dialogID
        clearTimeout(this.mTimeoutId)
        this.mTimeoutId = setTimeout(() => {
          hideDialogId("dialogInfo1")
        }, 3000)
        break
      case 3: //隐藏全部
        showDialogInfo({
          title: "我是弹窗1",
          message: "111111111",
          clickConfirm: () => {
            //确认
            console.log("===点击了确认按钮")
          }
        })
        showDialogInfo({
          title: "我是弹窗2",
          message: "2222222222",
          clickConfirm: () => {
            //确认
            console.log("===点击了确认按钮")
          }
        })
        showDialogInfo({
          title: "我是弹窗3",
          message: "3333333333",
          clickConfirm: () => {
            //确认
            console.log("===点击了确认按钮")
          }
        })
        //3秒之后模拟隐藏全部
        clearTimeout(this.mTimeoutId)
        this.mTimeoutId = setTimeout(() => {
          hideAll()
        }, 3000)
        break
    }
  }
}
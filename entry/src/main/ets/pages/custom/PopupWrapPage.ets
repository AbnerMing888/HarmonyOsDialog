import { PopupDirection, showPopupWindow, hide, updatePopupData, MessageData } from '@abner/dialog'


/**
 * AUTHOR:AbnerMing
 * DATE:2024/8/19
 * INTRODUCE:popup 弹出框
 * */
@Entry
@Component
struct PopupWrapPage {
  private mTimeoutId: number = -1

  build() {
    Column() {
      Button("弹出上")
        .id('popupTop')
        .margin({ top: 20 })
        .onClick(() => {
          showPopupWindow({
            id: "popupTop",
            view: wrapBuilder(BuilderWindowView)
          })

        })
      Button("弹出下")
        .id('popupBottom')
        .margin({ top: 20 })
        .onClick(() => {
          showPopupWindow({
            id: "popupBottom",
            view: wrapBuilder(BuilderWindowView),
            direction: PopupDirection.BOTTOM
          })
        })
      Button("弹出左")
        .id('popupLeft')
        .margin({ top: 20 })
        .onClick(() => {
          showPopupWindow({
            id: "popupLeft",
            view: wrapBuilder(BuilderWindowView),
            direction: PopupDirection.LEFT
          })
        })
      Button("弹出右")
        .id('popupRight')
        .margin({ top: 20 })
        .onClick(() => {
          showPopupWindow({
            id: "popupRight",
            view: wrapBuilder(BuilderWindowView),
            direction: PopupDirection.RIGHT
          })
        })

      Button("弹出左上")
        .id('popupTopLeft')
        .margin({ top: 20 })
        .onClick(() => {
          showPopupWindow({
            id: "popupTopLeft",
            view: wrapBuilder(BuilderWindowView),
            direction: PopupDirection.TOP_LEFT
          })
        })
      Button("弹出右上")
        .id('popupTopRight')
        .margin({ top: 20 })
        .onClick(() => {
          showPopupWindow({
            id: "popupTopRight",
            view: wrapBuilder(BuilderWindowView),
            direction: PopupDirection.TOP_RIGHT
          })
        })
      Button("弹出左下")
        .id('popupBottomLeft')
        .margin({ top: 20 })
        .onClick(() => {
          showPopupWindow({
            id: "popupBottomLeft",
            view: wrapBuilder(BuilderWindowView),
            direction: PopupDirection.BOTTOM_LEFT
          })
        })
      Button("弹出右下")
        .id('popupBottomRight')
        .margin({ top: 20 })
        .onClick(() => {
          showPopupWindow({
            id: "popupBottomRight",
            view: wrapBuilder(BuilderWindowView),
            direction: PopupDirection.BOTTOM_RIGHT
          })
        })

      Button("携带参数")
        .id('popupParams')
        .margin({ top: 20 })
        .onClick(() => {
          let params = new WindowParams()
          params.title = "我是携带的参数"
          showPopupWindow({
            id: "popupParams",
            params: params,
            viewParams: wrapBuilder(BuilderWindowParams),
            direction: PopupDirection.BOTTOM
          })
        })

      Button("更新数据")
        .id('updateParams')
        .margin({ top: 20 })
        .onClick(() => {
          let params = new WindowParams()
          params.title = "3秒后，我会更新数据"
          showPopupWindow({
            id: "updateParams",
            params: params,
            viewParams: wrapBuilder(BuilderWindowParams),
            direction: PopupDirection.BOTTOM
          })
          clearTimeout(this.mTimeoutId)
          this.mTimeoutId = setTimeout(() => {
            let params = new WindowParams()
            params.title = "嘿嘿，我更新了"
            updatePopupData(params)
          }, 3000)
        })

      Button("任意位置")
        .margin({ top: 30 })
        .onClick(() => {
          showPopupWindow({
            view: wrapBuilder(BuilderWindowView),
            x: 60,
            y: 300
          })
        })
    }
    .height('100%')
    .width('100%')
  }
}

/**
 * AUTHOR:AbnerMing
 * INTRODUCE:popup 弹出框,可以自定义，任意组件
 * */
@Builder
function BuilderWindowView() {
  Text("我是任意的组件")
    .backgroundColor(Color.Pink)
    .onClick(() => {
      console.log("=================点击了")
      hide()
    })
}

/**
 * AUTHOR:AbnerMing
 * INTRODUCE:popup 弹出框,可以自定义，携带参数
 * */

class WindowParams {
  title?: string
}

@Builder
function BuilderWindowParams(params: MessageData) {
  Text((params.data as WindowParams).title)
    .backgroundColor(Color.Pink)
}
import { PopupTextDirection, showPopupText } from '@abner/dialog'

@Entry
@Component
struct PopupPage {
  build() {
    Column() {
      Button("弹出上")
        .id('PopupTop')
        .margin({ top: 80 })
        .onClick(() => {
          showPopupText("PopupTop", this.getUIContext(), {
            text: "我是上边弹出",
            height: 50,
            width: 200,
            textAlign: TextAlign.Center,
            backgroundColor: Color.Pink,
            border: { radius: 20 }
          })
        })
      Button("弹出下")
        .id('PopupBottom')
        .margin({ top: 30 })
        .onClick(() => {
          showPopupText("PopupBottom", this.getUIContext(), {
            direction: PopupTextDirection.BOTTOM,
            text: "我是下边弹出",
            backgroundColor: Color.Pink
          })
        })
      Button("弹出左")
        .id('PopupLeft')
        .margin({ top: 30 })
        .onClick(() => {
          showPopupText("PopupLeft", this.getUIContext(), {
            direction: PopupTextDirection.LEFT,
            text: "我是左边弹出",
            backgroundColor: Color.Pink
          })
        })
      Button("弹出右")
        .id('PopupRight')
        .margin({ top: 30 })
        .onClick(() => {
          showPopupText("PopupRight", this.getUIContext(), {
            direction: PopupTextDirection.RIGHT,
            backgroundColor: Color.Pink,
            text: "我是右边弹出"
          })
        })

      Button("弹出左上")
        .id('PopupTopLeft')
        .margin({ top: 30 })
        .onClick(() => {
          showPopupText("PopupTopLeft", this.getUIContext(), {
            direction: PopupTextDirection.TOP_LEFT,
            text: "我是左上边弹出",
            backgroundColor: Color.Pink
          })
        })
      Button("弹出右上")
        .id('PopupTopRight')
        .margin({ top: 30 })
        .onClick(() => {
          showPopupText("PopupTopRight", this.getUIContext(), {
            direction: PopupTextDirection.TOP_RIGHT,
            text: "我是右上边弹出",
            backgroundColor: Color.Pink
          })
        })
      Button("弹出左下")
        .id('PopupBottomLeft')
        .margin({ top: 30 })
        .onClick(() => {
          showPopupText("PopupBottomLeft", this.getUIContext(), {
            direction: PopupTextDirection.BOTTOM_LEFT,
            text: "我是左下边弹出",
            backgroundColor: Color.Pink
          })
        })
      Button("弹出右下")
        .id('PopupBottomRight')
        .margin({ top: 30 })
        .onClick(() => {
          showPopupText("PopupBottomRight", this.getUIContext(), {
            direction: PopupTextDirection.BOTTOM_RIGHT,
            text: "我是右下边弹出",
            backgroundColor: Color.Pink
          })
        })
    }
    .height('100%')
    .width('100%')
  }
}
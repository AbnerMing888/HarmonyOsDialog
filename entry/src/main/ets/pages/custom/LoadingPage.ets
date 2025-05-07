import { hide, loading } from '@abner/dialog'

@Entry
@Component
struct LoadingPage {
  private items = ["普通模式", "定时隐藏", "传递数据", "点击外部不消失"]
  private timeoutId: number = -1

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
      case 0: //普通模式
        loading()
        break
      case 1: //定时隐藏
        loading()
        clearTimeout(this.timeoutId)
        this.timeoutId = setTimeout(() => {
          //3秒后隐藏
          hide()
        }, 3000)
        break
      case 2: //传递数据
        loading({ text: "正在请求中很多数据……" })
        break
      case 3: //点击外部不消失
        loading({ dialogAttribute: { windowClickOutsideHide: false } })
        break
    }
  }
}
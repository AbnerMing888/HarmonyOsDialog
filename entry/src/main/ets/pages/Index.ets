import router from '@ohos.router'
import promptAction from '@ohos.promptAction'

@Entry
@Component
struct Index {
  private customDialogComponentId: number = 0

  build() {
    Column() {

      Button("window弹窗(需要初始化)")
        .onClick(() => {
          router.pushUrl({ url: "pages/WindowPage" })
        })

      //使用这个，不需要全局初始化
      Button("自定义弹窗(不需要初始化)")
        .margin({ top: 10 })
        .onClick(() => {
          router.pushUrl({ url: "pages/WrapPage" })
        })
    }
    .width("100%")
    .height("100%")
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  customDialogComponent() {
    Column() {
      Text('弹窗').fontSize(30)
      Row({ space: 50 }) {
        Button("确认").onClick(() => {
          promptAction.closeCustomDialog(this.customDialogComponentId)
        })
        Button("取消").onClick(() => {
          promptAction.closeCustomDialog(this.customDialogComponentId)
        })
      }
    }.height(200).padding(5).justifyContent(FlexAlign.SpaceBetween)
  }
}


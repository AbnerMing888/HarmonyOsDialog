import router from '@ohos.router'

@Entry
@Component
struct Index {
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
}


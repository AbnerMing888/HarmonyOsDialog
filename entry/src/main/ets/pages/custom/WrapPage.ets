import router from '@ohos.router'

/**
 * AUTHOR:AbnerMing
 * DATE:2025/4/17
 * INTRODUCE:dialog所有案例
 * */
@Entry
@Component
struct WrapPage {
  private items =
    ["确认信息形式", "底部列表形式", "时间选择弹窗", "城市地址选择", "Toast提示", "Popup自定义浮窗", "loading加载视图",
      "自定义视图","隐藏模式"]
  private itemUrls =
    ["ConfirmInfoPage", "BottomListPage", "TimePage", "AddressPage", "ToastPage", "PopupWrapPage", "LoadingPage",
      "CustomPage","HideModePage"]

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

  /*
* Author:AbnerMing
* Describe:条目点击
*/
  private itemClick(index: number) {
    router.pushUrl({ url: "pages/custom/" + this.itemUrls[index] })
  }
}
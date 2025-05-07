import { showDialogAddress } from '@abner/dialog'

/**
 * AUTHOR:AbnerMing
 * DATE:2025/4/17
 * INTRODUCE:地址弹窗
 * */
@Entry
@Component
struct AddressPage {
  private items = ["城市地址弹窗"]

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
    switch (index) {
      case 0: //城市地址弹窗
        showDialogAddress({
          titleBarAttribute: {
            titleText: "城市地址弹窗",
          },
          confirmClick: (value, index) => {
            console.log(value + "===" + index)
          }
        })
        break
    }
  }
}
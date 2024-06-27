import { hideDialog } from '@abner/dialog'

@Entry
@Component
struct TestPage {
  
  build() {
    RelativeContainer() {
      Text("我是自定义页面")
        .id('test')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
    .attributeModifier({})
    .backgroundColor("#90000000")
    .onClick(() => {
      hideDialog()
    })

  }

  onBackPress(): boolean | void {
    hideDialog()
  }
}
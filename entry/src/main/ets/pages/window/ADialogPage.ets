import { ADialogView, hideDialog } from '@abner/dialog';
import { SelfView } from './SelfView';

@Entry
@Component
struct ADialogPage {
  @Builder
  customView(type: number) {
    if (type == 0) {
      //自定义弹窗，可以把视图抽取出去
      Column() {
        Text("我是一个自定义的弹窗")
      }.width("100%")
      .height(100)
      .justifyContent(FlexAlign.Center)
      .backgroundColor(Color.White)
    } else if (type == 1) {
      //自定义弹窗2
      SelfView()
    }
  }

  build() {
    RelativeContainer() {
      ADialogView({
        customView: this.customView
      })
        .id('a_dialog')
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }

  /*
  * Author:AbnerMing
  * Describe:监听点击返回键
  */
  onBackPress(): boolean | void {
    hideDialog()
  }
}
import { toast, ToastAlignment } from '@abner/dialog'

/**
 * AUTHOR:AbnerMing
 * DATE:2025/4/17
 * INTRODUCE:toast提示所有案例
 * */
@Entry
@Component
struct ToastPage {
  private items = ["普通提示", "更改背景", "更改圆角度数", "更改文字大小",
    "居中位置", "居上位置", "居下位置", "任意位置", "上面Icon", "下面Icon", "左面Icon",
    "右面Icon", "左右Icon", "自定义视图"]

  build() {
    Column() {
      ForEach(this.items, (item: string, index: number) => {
        Text(item)
          .width("50%")
          .height(35)
          .textAlign(TextAlign.Center)
          .border({ width: 1, color: Color.Red })
          .borderRadius(35)
          .margin({ top: 10 })
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
      case 0: //普通提示
        toast("普通提示")
        break
      case 1: //更改背景
        toast("更改背景", { backgroundColor: Color.Red, fontColor: Color.White })
        break
      case 2: //更改圆角度数
        toast("更改圆角度数", { borderRadius: 5 })
        break
      case 3: //更改文字大小
        toast("更改文字大小", { fontSize: 20 })
        break
      case 4: //居中位置
        toast("居中位置", { toastAlignment: ToastAlignment.Center })
        break
      case 5: //居上位置
        toast("居上位置", { toastAlignment: ToastAlignment.Top })
        break
      case 6: //居下位置
        toast("居下位置", { toastAlignment: ToastAlignment.Bottom })
        break
      case 7: //任意位置
        toast("任意位置", { offsetX: 20, offsetY: 20 })
        break
      case 8: //上面Icon
        toast("上面Icon", {
          topIcon: $r("app.media.success"),
          borderRadius: 10,
          padding: {
            left: 40,
            right: 40,
            bottom: 10
          }
        })
        break
      case 9: //下面Icon
        toast("下面Icon", {
          bottomIcon: $r("app.media.app_icon"),
          borderRadius: 10,
          padding: {
            left: 40,
            right: 40,
            top: 10
          }
        })
        break
      case 10: //左面Icon
        toast("左面Icon", {
          leftIcon: $r("app.media.app_icon"),
          borderRadius: 10,
          padding: {
            right: 40,
            left: 40,
            top: 20,
            bottom: 20
          }
        })
        break
      case 11: //右面Icon
        toast("右面Icon", {
          rightIcon: $r("app.media.app_icon"),
          borderRadius: 10,
          padding: {
            right: 40,
            left: 40,
            top: 20,
            bottom: 20
          }
        })
        break
      case 12: //左右Icon
        toast("左右Icon", {
          leftIcon: $r("app.media.app_icon"),
          rightIcon: $r("app.media.app_icon"),
          borderRadius: 10,
          padding: {
            right: 40,
            left: 40,
            top: 20,
            bottom: 20
          }
        })
        break
      case 13: //自定义视图
        toast("自定义视图", {
          backgroundColor: Color.Transparent,
          padding: 0,
          view: wrapBuilder(ToastView)
        })
        break
    }
  }
}

@Builder
function ToastView() {
  Column()
    .width(100)
    .height(100)
    .backgroundColor(Color.Pink)
}
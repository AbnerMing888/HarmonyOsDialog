import { closeDialogSheet, showDialogSheet, updateDataDialogSheet, updateStyleDialogSheet } from '@abner/dialog'

@Entry
@Component
struct SheetPage {
  private items = ["普通模态页面", "半模态高度(屏幕一半)", "半模态高度(屏幕高度)", "半模态高度(自适应内容高度)",
    "半模态高度(自定义高度)", "隐藏关闭按钮", "模态页面更新样式", "模态页面更新数据", "关闭模态页面"]

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
      case 0: //普通模态页面
        showDialogSheet({ layout: wrapBuilder(sheetView) })
        break
      case 1: //半模态高度(屏幕一半)
        showDialogSheet({
          layout: wrapBuilder(sheetView),
          options: {
            height: SheetSize.MEDIUM
          }
        })
        break
      case 2: //半模态高度(屏幕高度)
        showDialogSheet({
          layout: wrapBuilder(sheetView),
          options: {
            height: SheetSize.LARGE
          }
        })
        break
      case 3: //半模态高度(自适应内容高度)
        showDialogSheet({
          layout: wrapBuilder(sheetView),
          options: {
            height: SheetSize.FIT_CONTENT
          }
        })
        break
      case 4: //半模态高度(自定义高度)
        showDialogSheet({
          layout: wrapBuilder(sheetView),
          options: {
            height: 300
          }
        })
        break
      case 5: //隐藏关闭按钮
        showDialogSheet({
          layout: wrapBuilder(sheetView),
          options: {
            showClose: false
          }
        })
        break
      case 6: //模态页面更新样式
        let sheetData = new SheetData("模态页面更新样式")
        let sheetWrap = wrapBuilder(changeStyleSheetView)
        showDialogSheet({
          layout: sheetWrap,
          data: sheetData
        })
        break
      case 7: //模态页面更新数据
        let sheetData1 = new SheetData("模态页面更新数据，3秒后我就会更新")
        let sheetWrap1 = wrapBuilder(changeStyleSheetView)
        showDialogSheet({
          layout: sheetWrap1,
          data: sheetData1
        })
        setTimeout(() => {
          updateDataDialogSheet(new SheetData("嘿嘿！我更新了~"))
        }, 3000)
        break
      case 8: //关闭模态页面
        let sheetData2 = new SheetData("测试关闭模态页面")
        let sheetWrap2 = wrapBuilder(changeStyleSheetView)
        showDialogSheet({
          layout: sheetWrap2,
          data: sheetData2
        })
        break
    }
  }
}

@Builder
function sheetView() {
  Column() {
    Text("我是一个普通的模态页面")
      .width("100%")
      .height(100)
      .textAlign(TextAlign.Center)
  }
}

@Builder
function changeStyleSheetView(d: SheetData) {
  Column() {
    Text(d.title)
      .width("100%")
      .height(100)
      .textAlign(TextAlign.Center)
    Button("更改样式").onClick(() => {
      //其他属性不需要
      updateStyleDialogSheet({
        options: {
          backgroundColor: Color.Pink
        }
      })
    })
    Button("关闭")
      .margin({ top: 10 })
      .onClick(() => {
        closeDialogSheet()
      })
  }
}

export class SheetData {
  title?: string

  constructor(title?: string) {
    this.title = title
  }
}


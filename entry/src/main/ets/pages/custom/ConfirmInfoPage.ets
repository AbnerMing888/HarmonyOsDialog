import {
  hide,
  MessageData,
  showDialogConfirm,
  showDialogInfo,
  toast,
  updateDialogConfirm,
  updateDialogInfo
} from '@abner/dialog'
import router from '@ohos.router'
import { LevelMode } from '@ohos.promptAction'

/**
 * AUTHOR:AbnerMing
 * DATE:2025/4/17
 * INTRODUCE:确认信息形式dialog
 * */
@Entry
@Component
struct ConfirmInfoPage {
  private items =
    ["信息弹窗", "信息弹窗更新数据", "确认弹窗", "确认弹窗更新数据", "确认提示信息",
      "描述link", "自定义message视图", "message视图更新数据"]
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

  /*
* Author:AbnerMing
* Describe:条目点击
*/
  private itemClick(index: number) {
    switch (index) {
      case 0: //信息弹窗
        showDialogInfo({
          title: "我是标题",
          message: "我是一段描述",
          clickConfirm: () => {
            //确认
            console.log("===点击了确认按钮")
            hide() //隐藏dialog
          }
        })
        break;
      case 1: //信息弹窗更新数据
        showDialogInfo({
          title: "3秒后修改message信息",
          message: "我是一段描述",
          clickConfirm: () => {
            //确认
            console.log("===点击了确认按钮")
            hide() //隐藏dialog
          }
        })
        clearTimeout(this.timeoutId)
        this.timeoutId = setTimeout(() => {
          //更新信息弹窗,可以修改任意的属性
          updateDialogInfo({
            message: "嘿嘿，我修改了啊"
          })
        }, 3000)
        break;
      case 2: //确认弹窗
        showDialogConfirm({
          title: "我是标题",
          message: "我是一段描述",
          clickConfirm: () => {
            //确认
            console.log("===点击了确认按钮")
            hide() //隐藏dialog
          },
          clickCancel: () => {
            console.log("===点击了取消按钮")
            hide() //隐藏dialog
          }
        })
        break;
      case 3: //确认弹窗更新数据
        showDialogConfirm({
          title: "3秒后修改message信息",
          message: "我是一段描述",
          clickConfirm: () => {
            //确认
            console.log("===点击了确认按钮")
            hide() //隐藏dialog
          },
          clickCancel: () => {
            console.log("===点击了取消按钮")
            hide() //隐藏dialog
          }
        })

        clearTimeout(this.timeoutId)
        this.timeoutId = setTimeout(() => {
          //更新确认形式弹窗,可以修改任意的属性
          updateDialogConfirm({
            message: "嘿嘿，我修改了啊"
          })
        }, 3000)
        break;
      case 4: //确认提示信息
        showDialogConfirm({
          title: "我是一个标题",
          message: "我是一段描述",
          isShowInformation: true, //展示信息
          informationAttribute: {
            checkboxSelect: true, //是否默认选中
            iconAttribute: {
              srcSelect: $r("app.media.select"), //选中
              srcUnselected: $r("app.media.no_select"), //未选中
            },
            onChange: (isChange) => {
              //点击改变了状态
              console.log("===" + isChange)
            }
          },
          clickCancel: () => {
            //取消
            console.log("===取消")
            hide() //隐藏dialog
          },
          clickConfirm: () => {
            //确认
            console.log("===确认")
            hide() //隐藏dialog
          }
        })

        break;
      case 5: //描述link
        showDialogInfo({
          title: "我是标题",
          message: "我是一段描述",
          messageLink: "我是可以点击的",
          isShowLink: true,
          messageLinkAttribute: {
            fontColor: Color.Blue,
            onclick: () => {
              //点击
              toast("点击了链接")
            }
          },
          clickConfirm: () => {
            //确认
            hide() //隐藏dialog
          }
        })
        break;
      case 6: //自定义的message视图
        showDialogConfirm({
          title: "我是标题",
          messageView: wrapBuilder(MessageView), //传递自定义视图
          messageData: new TextBean("我是自定义的message视图", true), //传递自定义数据，可以是任意的类型
          clickConfirm: () => {
            //确认
            hide() //隐藏dialog
          }
        })
        break;
      case 7: //自定义的message视图 更新数据
        showDialogConfirm({
          title: "3秒后修改messageData信息",
          messageView: wrapBuilder(MessageView), //传递自定义视图
          messageData: new TextBean("我是自定义的message视图", true), //传递自定义数据，可以是任意的类型
          clickConfirm: () => {
            //确认
            hide() //隐藏dialog
          }
        })
        clearTimeout(this.timeoutId)
        this.timeoutId = setTimeout(() => {
          //更新确认形式弹窗,可以修改任意的属性
          updateDialogConfirm({
            messageData: new TextBean("嘿嘿，我更新了哦", true)
          })
        }, 3000)
        break;
    }
  }
}


/**
 * 自定义Message视图，可以实现任意的视图
 * 数据更新使用MessageData获取数据及更新数据
 * */
@Builder
function MessageView(message: MessageData) {
  Column() {
    Image($r("app.media.startIcon"))
      .width(30)
      .height(30)
    Text((message.data as TextBean).name)
      .margin({ top: 10 })
    TextInput({ placeholder: "请输入内容" })
      .margin({ top: 10 })

  }
}

class TextBean {
  name?: string
  isB?: boolean

  constructor(name: string, isB: boolean) {
    this.name = name
    this.isB = isB
  }
}
import {
  BottomGridModel,
  BottomListModel,
  hideDialog,
  showBottomGridDialog,
  showBottomListDialog,
  showConfirmDialog,
  showCustomDialog,
  showCustomDialogPage,
  showInfoDialog,
  showToast
} from '@abner/dialog'
import { GridView } from '@abner/refresh'
import router from '@ohos.router'

@Entry
@Component
struct Index {
  private items = ["信息弹窗", "确认弹窗", "底部列表", "底部列表透明", "底部列表多样式", "底部网格列表",
    "底部网格行元素", "自定义弹窗1", "自定义弹窗2", "toast提示", "toast改变背景", "toast改变位置",
    "Toast设置Icon", "自定义页面"]

  @Builder
  itemLayout(_this: Index, item: Object, index: number) {
    Text(item.toString())
      .width("90%")
      .margin({ top: 10 })
      .height(40)
      .textAlign(TextAlign.Center)
      .fontColor(Color.Red)
      .border({ width: 1, radius: 5, color: Color.Red })
      .onClick(() => {
        _this.itemClick(index)
      })
  }

  /*
  * Author:AbnerMing
  * Describe:条目点击
  */
  private itemClick(index: number) {
    switch (index) {
      case 0: //信息弹窗
        showInfoDialog({
          title: "我是标题",
          message: "我是一段描述",
          clickConfirm: () => {
            //确认
            hideDialog(() => {
              router.pushUrl({ url: "pages/TestPage" })
            })
          }
        })
        break;
      case 1: //确认弹窗
        showConfirmDialog({
          title: "我是一个标题",
          message: "我是一段描述",
          clickCancel: () => {
            //取消
            console.log("====取消")
          },
          clickConfirm: () => {
            //确认
            console.log("====确认")
          }
        })
        break;
      case 2: //底部列表
        showBottomListDialog({
          items: ["我是条目一", "我是条目二"],
          itemClick: (position: number) => {
            hideDialog()
          }
        })
        break;
      case 3: //底部列表透明
        showBottomListDialog({
          items: ["我是条目一", "我是条目二"],
          itemClick: (position: number) => {
            hideDialog()
          },
          isTransparent: true,
          dialogAttribute: {
            dialogMarginLeft: 20,
            dialogMarginRight: 20
          }
        })
        break;
      case 4: //底部列表多样式
        showBottomListDialog({
          itemModels: [new BottomListModel("条目一", { fontColor: Color.Red }), new BottomListModel("条目二")],
          itemClick: (position: number) => {
            hideDialog()
          }
        })
        break;
      case 5: //底部网格列表
        showBottomGridDialog({
          columnSize: 4,
          items: [new BottomGridModel("微信", $r("app.media.app_icon")),
            new BottomGridModel("朋友圈", $r("app.media.app_icon")),
            new BottomGridModel("QQ", $r("app.media.app_icon")),
            new BottomGridModel("QQ空间", $r("app.media.app_icon")),
            new BottomGridModel("微博", $r("app.media.app_icon")),
            new BottomGridModel("微博", $r("app.media.app_icon")),
            new BottomGridModel("微博", $r("app.media.app_icon")),
            new BottomGridModel("微博", $r("app.media.app_icon"))
          ],
        })
        break;
      case 6: //底部网格按行区分
        showBottomGridDialog({
          columnSize: 4,
          isShowBottomCancel: true,
          isHideBar: true,
          itemLineArray: [
            [new BottomGridModel("测试", $r("app.media.app_icon")),
              new BottomGridModel("测试", $r("app.media.app_icon"))],
            [new BottomGridModel("测试", $r("app.media.app_icon")),
              new BottomGridModel("测试", $r("app.media.app_icon")),
              new BottomGridModel("测试", $r("app.media.app_icon"))]
          ],
          itemClick: (position) => {
            console.log("==============" + position)
          }
        })

        break;
      case 7: //自定义弹窗一
        showCustomDialog(0)
        break;
      case 8: //自定义弹窗二
        showCustomDialog(1, {
          dialogAttribute: { windowAlign: FlexAlign.End }
        })
        break;
      case 9: //toast提示
        showToast("我是一个普通的toast")
        break;
      case 10: //toast改变背景
        showToast("我是一个改变背景的Toast", { backgroundColor: Color.Red })
        break;
      case 11: //toast改变位置
        showToast("我是一个改变位置的Toast", { flexAlign: FlexAlign.Center })
        break;
      case 12: //toast图片设置
        showToast("Toast设置Icon", { leftSrc: $r("app.media.app_icon") })
        break;
      case 13: //自定义页面
        showCustomDialogPage("pages/TimePage", {
          clickCancel: () => {
            console.log("===============点击了取消")
          }
        })
        break;
    }
  }

  build() {
    Column() {
      GridView({
        items: this.items,
        itemLayout: (item: Object, index: number) => {
          this.itemLayout(this, item, index)
        }
      })
    }
  }
}
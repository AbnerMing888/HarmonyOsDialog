import {
  ADialog,
  BottomGridModel,
  BottomListModel,
  hideDialog,
  showAddressDialog,
  showBottomGridDialog,
  showBottomListDialog,
  showBottomListScrollDialog,
  showConfirmDialog,
  showCustomDialog,
  showCustomDialogPage,
  showInfoDialog,
  showLoading,
  showTimeDialog,
  showToast,
  TimeDialogType
} from '@abner/dialog'
import { GridView } from '@abner/refresh'
import router from '@ohos.router'

@Entry
@Component
struct Index {
  private items = ["信息弹窗", "确认弹窗", "底部列表", "底部列表透明", "底部列表多样式", "底部网格列表",
    "底部网格行元素", "自定义弹窗1", "自定义弹窗2", "自定义页面", "toast提示", "toast改变背景", "toast改变位置",
    "Toast设置Icon", "底部单列表", "底部双列表", "底部双列表联动", "底部三列表联动", "年月日弹窗", "月日弹窗",
    "时分秒弹窗", "时分弹窗", "日时分弹窗", "城市地址弹窗", "加载视图"]

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
          dialogAttribute: {
            windowAlign: FlexAlign.End,
            dialogCustomAnimation: true,
          }
        })
        break;
      case 9: //自定义页面
        showCustomDialogPage("pages/TestPage")
        break;
      case 10: //toast提示
        showToast("我是一个普通的toast")
        break;
      case 11: //toast改变背景
        showToast("我是一个改变背景的Toast", { backgroundColor: Color.Red })
        break;
      case 12: //toast改变位置
        showToast("我是一个改变位置的Toast", { flexAlign: FlexAlign.Center })
        break;
      case 13: //toast图片设置
        showToast("Toast设置Icon", { leftSrc: $r("app.media.app_icon") })
        break;
      case 14: //底部单列表
        showBottomListScrollDialog({
          items: ["男", "女"],
          titleBarAttribute: {
            titleText: "选择性别"
          },
          listAttribute: {
            isCustomDivider: true
          },
          confirmClick: (value, index) => {
            console.log(value + "=========" + index)
          }
        })
        break;
      case 15: //底部双列表不联动
        showBottomListScrollDialog({
          items: [["第一列1", "第一列2"], ["第二列1", "第二列2", "第二列3"]],
          titleBarAttribute: {
            titleText: "底部双列表不联动"
          },
          confirmClick: (value, index) => {
            console.log(value + "=========" + index)
          }
        })
        break;
      case 16: //底部双列表联动
        showBottomListScrollDialog({
          items: this.doubleList,
          titleBarAttribute: {
            titleText: "底部双列表联动"
          },
          confirmClick: (value, index) => {
            console.log(value + "=========" + index)
          }
        })
        break;
      case 17: //底部三列表联动
        showBottomListScrollDialog({
          items: this.thirdList,
          titleBarAttribute: {
            titleText: "底部三列表联动",
          },
          confirmClick: (value, index) => {
            console.log(value + "=========" + index)
          }
        })
        break;
      case 18: //年月日时间弹窗
        showTimeDialog({
          titleBarAttribute: {
            titleText: "年月日时间弹窗",
          },
          timeAttribute: {
            timeType: TimeDialogType.YMDHMS
          },
          confirmClick: (value, index) => {
            console.log(value + "=========" + index)
          }
        })
        break;
      case 19: //月日时间弹窗
        showTimeDialog({
          titleBarAttribute: {
            titleText: "月日时间弹窗",
          },
          timeAttribute: {
            timeType: TimeDialogType.MD
          },
          confirmClick: (value, index) => {
            console.log(value + "=========" + index)
          }
        })
        break;
      case 20: //时分秒弹窗
        showTimeDialog({
          titleBarAttribute: {
            titleText: "时分秒弹窗",
          },
          timeAttribute: {
            timeType: TimeDialogType.HMS
          },
          confirmClick: (value, index) => {
            console.log(value + "=========" + index)
          }
        })
        break;
      case 21: //时分弹窗
        showTimeDialog({
          titleBarAttribute: {
            titleText: "时分弹窗",
          },
          timeAttribute: {
            timeType: TimeDialogType.HM
          },
          confirmClick: (value, index) => {
            console.log(value + "=========" + index)
          }
        })
        break;
      case 22: //日时分
        showTimeDialog({
          titleBarAttribute: {
            titleText: "日时分弹窗",
          },
          timeAttribute: {
            timeType: TimeDialogType.DHM,
            showToday: true,
            showYesterday: true,
            showTomorrow: true,
            isAAay: true,
          },
          confirmClick: (value, index) => {
            console.log(value + "=========" + index)
          }
        })
        break;
      case 23: //城市地址弹窗
        showAddressDialog({
          titleBarAttribute: {
            titleText: "城市地址弹窗",
          },
          confirmClick: (value, index) => {
            console.log(value + "=========" + index)
          }
        })
        break;
      case 24: //加载视图
        showLoading()
        break;
    }
  }

  private doubleList: TextCascadePickerRangeContent[] = [
    {
      text: '辽宁省',
      children: [{ text: '沈阳市' }]
    },
    {
      text: '吉林省',
      children: [{ text: '长春市' }]
    },
    {
      text: '黑龙江省',
      children: [{ text: '哈尔滨市' }]
    }
  ]
  private thirdList: TextCascadePickerRangeContent[] = [
    {
      text: '辽宁省',
      children: [{ text: '沈阳市', children: [{ text: '沈河区' }, { text: '和平区' }, { text: '浑南区' }] },
        { text: '大连市', children: [{ text: '中山区' }, { text: '金州区' }, { text: '长海县' }] }]
    },
    {
      text: '吉林省',
      children: [{ text: '长春市', children: [{ text: '南关区' }, { text: '宽城区' }, { text: '朝阳区' }] },
        { text: '四平市', children: [{ text: '铁西区' }, { text: '铁东区' }, { text: '梨树县' }] }]
    },
    {
      text: '黑龙江省',
      children: [{ text: '哈尔滨市', children: [{ text: '道里区' }, { text: '道外区' }, { text: '南岗区' }] },
        { text: '牡丹江市', children: [{ text: '东安区' }, { text: '西安区' }, { text: '爱民区' }] }]
    }
  ]

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
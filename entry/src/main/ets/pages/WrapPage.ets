import { GridView } from '@abner/refresh'
import {
  BottomAnimationView,
  BottomGridModel,
  BottomListModel,
  hide,
  hideDialogId,
  loading,
  setDialogAttribute,
  showDialogAddress,
  showDialogBottomGrid,
  showDialogBottomList,
  showDialogBottomListScroll,
  showDialogConfirm,
  showDialogInfo,
  showDialogTime,
  TimeDialogType,
  toast
} from '@abner/dialog'
import router from '@ohos.router'
import promptAction from '@ohos.promptAction'


/*
* Author:AbnerMing
* Describe:自定义弹窗,布局自己定义
*/
@Builder
function BuilderDialog() {
  BottomAnimationView() {
    Column() {
      Text("我是一个自定义弹窗")
        .margin({ top: 30 })

      TextInput()
      Row() {
        Button("取消").onClick(() => {
          //隐藏dialog
          hide()
        })
        Button("确定")
          .margin({ left: 30 })
      }.margin({ top: 20 })
      .margin({ top: 30 })
    }.backgroundColor(Color.White)
    .width("60%")
  }

}

/*
* Author:AbnerMing
* Describe:自定义弹窗传递参数,布局自己定义,参数可自己定义，对象，数组……
*/

class DialogParams {
  title?: string
}

@Builder
function BuilderDialogParams(params: DialogParams) {
  BottomAnimationView() {
    Column() {
      Text(params.title)
        .margin({ top: 30 })
      Row() {
        Button("取消").onClick(() => {
          //隐藏dialog
          hideDialogId("dialog_id")
        })
        Button("确定")
          .margin({ left: 30 })
      }.margin({ top: 20 })
      .margin({ top: 30 })
    }.backgroundColor(Color.White)
    .width("60%")
  }

}


@Entry
@Component
struct WrapPage {
  private items = ["信息弹窗", "确认弹窗", "确认提示信息", "底部列表", "底部列表透明", "底部列表多样式", "底部网格列表",
    "底部网格行元素", "自定义弹窗", "自定义弹窗(传数据)", "toast提示", "toast改变背景", "toast改变位置",
    "Toast设置Icon", "底部单列表", "底部双列表", "底部双列表联动", "底部三列表联动", "年月日时分秒弹窗",
    "年月日时分弹窗", "年月日弹窗", "月日弹窗",
    "时分秒弹窗", "时分弹窗", "日时分弹窗", "城市地址弹窗", "加载视图", "Popup自定义浮窗", "描述link"]

  @Builder
  itemLayout(_this: WrapPage, item: Object, index: number) {
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
        showDialogInfo({
          title: "我是标题",
          message: "我是一段描述",
          clickConfirm: () => {
            //确认
          }
        })
        break;
      case 1: //确认弹窗
        showDialogConfirm({
          title: "我是一个标题",
          message: "我是一段描述",
          clickCancel: () => {
            //取消
            console.log("===取消")
          },
          clickConfirm: () => {
            //确认
            console.log("===确认")
          }
        })
        break;
      case 2: //确认提示信息

        showDialogConfirm({
          title: "我是一个标题",
          message: "我是一段描述",
          isShowInformation: true, //展示信息
          informationAttribute: {
            checkboxSelect: true, //是否默认选中
            iconAttribute: {
              srcSelect: $r("app.media.startIcon"), //选中
              srcUnselected: $r("app.media.loading001"), //未选中
            },
            onChange: (isChange) => {
              //点击改变了状态
              console.log("===" + isChange)
            }
          },
          clickCancel: () => {
            //取消
            console.log("===取消")
          },
          clickConfirm: () => {
            //确认
            console.log("===确认")
          }
        })

        break;
      case 3: //底部列表
        showDialogBottomList({
          items: ["我是条目一", "我是条目二", "我是条目三", "我是条目四"],
          dialogAttribute: {
            isSystemAnimation: false//取消系统的动画
          },
          itemDivider: {
            height: 0.5
          },
          cancelAttr: {
            paddingBottom: 20
          },
          itemClick: (position: number) => {
            console.log("==========:" + position)
          }
        })
        break;

      case 4: //底部列表透明
        showDialogBottomList({
          items: ["我是条目一", "我是条目二"],
          itemClick: (position: number) => {
            console.log("==========:" + position)
          },
          isTransparent: true,
          dialogAttribute: {
            dialogMarginLeft: 20,
            dialogMarginRight: 20,
            isSystemAnimation: false//取消系统的动画
          }
        })
        break;

      case 5: //底部列表多样式
        showDialogBottomList({
          dialogAttribute: {
            isSystemAnimation: false
          },
          itemModels: [
            new BottomListModel("条目一", { fontColor: Color.Red }),
            new BottomListModel("条目二")],
          itemClick: (position: number) => {

          }
        })
        break;
      case 6: //底部网格列表
        showDialogBottomGrid({
          columnSize: 4,
          dialogAttribute: {
            isSystemAnimation: false//取消系统的动画
          },
          items: [new BottomGridModel("微信", $r("app.media.app_icon")),
            new BottomGridModel("朋友圈", $r("app.media.app_icon")),
            new BottomGridModel("QQ", $r("app.media.app_icon")),
            new BottomGridModel("QQ空间", $r("app.media.app_icon")),
            new BottomGridModel("微博", $r("app.media.app_icon")),
            new BottomGridModel("微博", $r("app.media.app_icon")),
            new BottomGridModel("微博", $r("app.media.app_icon")),
            new BottomGridModel("微博", $r("app.media.app_icon"))
          ],
          itemClick: (position) => {
            console.log("==============:" + position)
          }
        })
        break;
      case 7: //底部网格按行区分
        showDialogBottomGrid({
          columnSize: 4,
          isShowBottomCancel: true,
          isHideBar: true,
          dialogAttribute: {
            isSystemAnimation: false//取消系统的动画
          },
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
      case 8: //自定义弹窗
        setDialogAttribute({
          isSystemAnimation: false,
          windowAlignment: DialogAlignment.Bottom,
          dialogDismiss: () => {
            hide()
          }
        }).showDialog(wrapBuilder(BuilderDialog))
        break;
      case 9: //自定义弹窗带参数
        let params = new DialogParams()
        params.title = "我是传递的参数"
        setDialogAttribute({
          isSystemAnimation: false, //不是系统动画
          windowAlignment: DialogAlignment.Bottom,
          dialogId: "dialog_id"
        }).showDialogParams(wrapBuilder(BuilderDialogParams), params)

        break;
      case 10: //toast提示
        toast("我是一个普通的toast我是一个普通的toast我是一个普通的toast我是一个普通的toast")
        break;
      case 11: //toast改变背景
        toast("我是一个改变背景的Toast", { backgroundColor: Color.Red })
        break;
      case 12: //toast改变位置
        toast("我是一个改变位置的Toast", { alignment: DialogAlignment.Center })
        toast("我是一个改变位置的Toast22", { alignment: DialogAlignment.Center })
        break;
      case 13: //toast图片设置
        toast("Toast设置Icon", { leftSrc: $r("app.media.app_icon") })
        break;
      case 14: //底部单列表
        showDialogBottomListScroll({
          items: ["男", "女"],
          selected: 10,
          titleBarAttribute: {
            titleText: "选择性别"
          },
          confirmClick: (value, index) => {
            console.log(value + "=========" + index)

          }
        })
        break;
      case 15: //底部双列表不联动
        showDialogBottomListScroll({
          selected: [1, 2],
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
        showDialogBottomListScroll({
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
        showDialogBottomListScroll({
          items: this.thirdList,
          titleBarAttribute: {
            titleText: "底部三列表联动",
          },
          dialogAttribute: {
            isSystemAnimation: false
          },
          confirmClick: (value, index) => {
            console.log(value + "=========" + index)
          }
        })
        break;
      case 18: //年月日时分秒 时间弹窗
        showDialogTime({
          titleBarAttribute: {
            titleText: "年月日时分秒-弹窗",
          },
          timeAttribute: {
            timeType: TimeDialogType.YMDHMS,
            // selectTime: "1992-7-23-8-8-8"//选择的时间
          },
          timeConfirmClick: (date) => {
            //时间回调
            console.log("===时间结果：" + date)
          },
          confirmClick: (value, index) => {
            //内容和索引回调
            console.log("===内容结果：" + value + "===索引结果：" + index)
          }
        })
        break;
      case 19: //年月日时分 时间弹窗
        showDialogTime({
          titleBarAttribute: {
            titleText: "年月日时分-弹窗",
          },
          timeAttribute: {
            timeType: TimeDialogType.YMDHM,
            // selectTime: "1992-7-23-8-8"//选择的时间
          },
          timeConfirmClick: (date) => {
            //时间回调
            console.log("===时间结果：" + date)
          },
          confirmClick: (value, index) => {
            //内容和索引回调
            console.log("===内容结果：" + value + "===索引结果：" + index)
          }
        })
        break;
      case 20: //年月日-弹窗
        showDialogTime({
          titleBarAttribute: {
            titleText: "年月日-弹窗",
          },
          timeAttribute: {
            isNoLinkage: true, //不联动
            startTime: "2024-12-24",
            selectTime: "2024-12-24",
            endTime: "2029-12-31",
          },
          timeConfirmClick: (date) => {
            //时间回调
            console.log("===时间结果：" + date)
          },
          confirmClick: (value, index) => {
            //内容和索引回调
            console.log("===内容结果：" + value + "====" + index)
          }
        })
        break;
      case 21: //月日-弹窗
        showDialogTime({
          titleBarAttribute: {
            titleText: "月日-弹窗",
          },
          timeAttribute: {
            timeType: TimeDialogType.MD,
            // selectTime: "7-23"//选择的时间
          },
          timeConfirmClick: (date) => {
            //时间回调
            console.log("===时间结果：" + date)
          },
          confirmClick: (value, index) => {
            //内容和索引回调
          }
        })
        break;
      case 22: //时分秒-弹窗
        showDialogTime({
          titleBarAttribute: {
            titleText: "时分秒-弹窗",
          },
          timeAttribute: {
            timeType: TimeDialogType.HMS,
            selectTime: "12-12-12"//选择的时间
          },
          timeConfirmClick: (date) => {
            //时间回调
            console.log("===时间结果：" + date)
          },
          confirmClick: (value, index) => {
            //内容和索引回调

          }
        })
        break;
      case 23: //时分弹窗
        showDialogTime({
          titleBarAttribute: {
            titleText: "时分-弹窗",
          },
          timeAttribute: {
            timeType: TimeDialogType.HM,
            startHours: 20,
            startMinutes: 2,
            endHours: 23,
            endMinutes: 59,
          },
          timeConfirmClick: (date) => {
            //时间回调
            console.log("===时间结果：" + date)
          },
          confirmClick: (value, index) => {
            //内容和索引回调
          }
        })
        break;
      case 24: //日时分
        showDialogTime({
          titleBarAttribute: {
            titleText: "日时分-弹窗",
          },
          timeAttribute: {
            timeType: TimeDialogType.DHM,
            isAAay: true
          },
          timeConfirmClick: (date) => {
            //时间回调
          },
          confirmClick: (value, index) => {
            //内容和索引回调
          }
        })
        break;

      case 25: //城市地址弹窗
        showDialogAddress({
          titleBarAttribute: {
            titleText: "城市地址弹窗",
          },
          confirmClick: (value, index) => {
            console.log("===============" + (value as string)[1])
          }
        })
        break;
      case 26: //加载视图
        loading({ dialogAttribute: { windowClickOutsideHide: false } })
        break;
      case 27: //Popup浮窗
        router.pushUrl({ url: "pages/PopupWrapPage" })
        break;
      case 28: //描述Link
        showDialogInfo({
          title: "我是标题",
          message: "我是一段描述",
          messageLink: "我是可以点击的",
          isShowLink: true,
          messageLinkAttribute: {
            fontColor: Color.Blue,
            onclick: () => {
              //点击
            }
          },
          clickConfirm: () => {
            //确认
          }
        })
        break
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


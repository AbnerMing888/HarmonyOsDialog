import {
  BottomGridModel,
  BottomListModel,
  showDialogBottomGrid,
  showDialogBottomList,
  showDialogBottomListScroll
} from '@abner/dialog'

/**
 * AUTHOR:AbnerMing
 * DATE:2025/4/17
 * INTRODUCE:底部列表弹窗
 * */
@Entry
@Component
struct BottomListPage {
  private items = ["底部列表", "底部列表透明", "底部列表多样式", "底部网格列表",
    "底部网格按行区分", "底部单列表【滚动】", "底部双列表不联动", "底部双列表联动", "底部三列表联动"]

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
      case 0: //底部列表
        showDialogBottomList({
          items: ["我是条目一", "我是条目二", "我是条目三", "我是条目四"],
          itemClick: (position: number) => {
            console.log("===点击的条目索引:" + position)
          }
        })
        break;
      case 1: //底部列表透明
        showDialogBottomList({
          items: ["我是条目一", "我是条目二"],
          itemClick: (position: number) => {
            console.log("==========:" + position)
          },
          isTransparent: true,
          dialogAttribute: {
            dialogMarginLeft: 20,
            dialogMarginRight: 20,
            dialogMarginBottom: 20,
          }
        })

        break;
      case 2: //底部列表多样式
        showDialogBottomList({
          itemModels: [
            new BottomListModel("条目一", { fontColor: Color.Red }),
            new BottomListModel("条目二")],
          itemClick: (position: number) => {
            console.log("===点击了条目索引：" + position)
          }
        })

        break;
      case 3: //底部网格列表
        showDialogBottomGrid({
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
          itemClick: (position) => {
            console.log("===条目索引:" + position)
          }
        })

        break;
      case 4: //底部网格按行区分
        showDialogBottomGrid({
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
            console.log("===条目索引：" + position)
          }
        })

        break;
      case 5: //底部单列表【滚动】
        showDialogBottomListScroll({
          items: ["男", "女"],
          selected: 1, //默认选择
          titleBarAttribute: {
            titleText: "选择性别"
          },
          confirmClick: (value, index) => {
            console.log(value + "===" + index)

          }
        })
        break;
      case 6: //底部双列表不联动
        showDialogBottomListScroll({
          selected: [1, 2], //默认选择
          items: [["第一列1", "第一列2"], ["第二列1", "第二列2", "第二列3"]],
          titleBarAttribute: {
            titleText: "底部双列表不联动"
          },
          confirmClick: (value, index) => {
            console.log(value + "===" + index)
          }
        })
        break;
      case 7: //底部双列表联动
        showDialogBottomListScroll({
          items: this.doubleList,
          titleBarAttribute: {
            titleText: "底部双列表联动"
          },
          confirmClick: (value, index) => {
            console.log(value + "===" + index)
          }
        })

        break;
      case 8: //底部三列表联动
        showDialogBottomListScroll({
          items: this.thirdList,
          titleBarAttribute: {
            titleText: "底部三列表联动",
          },
          confirmClick: (value, index) => {
            console.log(value + "===" + index)
          }
        })
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
}
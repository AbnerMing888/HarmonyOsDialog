import { showDialogTime, TimeDialogType } from '@abner/dialog'

/**
 * AUTHOR:AbnerMing
 * DATE:2025/4/17
 * INTRODUCE:时间弹窗
 * */
@Entry
@Component
struct TimePage {
  private items = ["年月日时分秒", "年月日时分", "年月日时", "年月日", "月日",
    "时分秒", "时分", "分秒", "日时分", "日时"]

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
      case 0: //年月日时分秒 时间弹窗
        showDialogTime({
          titleBarAttribute: {
            titleText: "年月日时分秒-弹窗",
          },
          timeAttribute: {
            timeType: TimeDialogType.YMDHMS,
            startTime: "2020-10-10-10-10-10",
            endTime: "2026-10-10-10-10-9",
            selectTime: "2021-11-11-11-11-11",
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
      case 1: //年月日时分 时间弹窗
        showDialogTime({
          titleBarAttribute: {
            titleText: "年月日时分-弹窗",
          },
          timeAttribute: {
            timeType: TimeDialogType.YMDHM,
            selectTime: "1992-7-23-8-8", //选择的时间
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
      case 2: //年月日时 时间弹窗
        showDialogTime({
          titleBarAttribute: {
            titleText: "年月日时-弹窗",
          },
          timeAttribute: {
            timeType: TimeDialogType.YMDH,
            selectTime: "2000-7-23-8-8", //选择的时间
            startTime: "1992-1-1-0",
            endTime: "2020-12-31-23"
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
      case 3: //年月日-弹窗
        showDialogTime({
          titleBarAttribute: {
            titleText: "年月日-弹窗",
          },
          timeAttribute: {
            timeType: TimeDialogType.YMD,
            startTime: "2024-10-24",
            selectTime: "2024-12-24",
            endTime: "2029-12-10",
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
      case 4: //月日-弹窗
        showDialogTime({
          titleBarAttribute: {
            titleText: "月日-弹窗",
          },
          timeAttribute: {
            timeType: TimeDialogType.MD,
            startTime: "10-20", //选择的时间
            endTime: "12-18",
            selectTime: "11-19"
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

      case 5: //时分秒-弹窗
        showDialogTime({
          titleBarAttribute: {
            titleText: "时分秒-弹窗",
          },
          timeAttribute: {
            timeType: TimeDialogType.HMS,
            selectTime: "6-12-12", //选择的时间
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
      case 6: //时分弹窗
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
            console.log("===内容结果：" + value + "====" + index)
          }
        })
        break;
      case 7: //分秒弹窗
        showDialogTime({
          titleBarAttribute: {
            titleText: "分秒-弹窗",
          },
          timeAttribute: {
            timeType: TimeDialogType.MS,
            selectDate: new Date()
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
      case 8: //日时分
        showDialogTime({
          titleBarAttribute: {
            titleText: "日时分-弹窗",
          },
          timeAttribute: {
            timeType: TimeDialogType.DHM,
            selectDate: new Date()
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
      case 9: //日时
        showDialogTime({
          titleBarAttribute: {
            titleText: "日时-弹窗",
          },
          timeAttribute: {
            timeType: TimeDialogType.DH,
            startTime: "24-10",
            endTime: "26-10",
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
    }
  }
}
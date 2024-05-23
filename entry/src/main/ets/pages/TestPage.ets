@Entry
@Component
struct TestPage {
  @State message: string = 'Hello Test';
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

  build() {
    // RelativeContainer() {
    //   Text(this.message)
    //     .id('HelloWorld')
    //     .fontSize(50)
    //     .fontWeight(FontWeight.Bold)
    //     .alignRules({
    //       center: { anchor: '__container__', align: VerticalAlign.Center },
    //       middle: { anchor: '__container__', align: HorizontalAlign.Center }
    //     })
    // }
    // .height('100%')
    // .width('100%')

    Column() {
      Column() {

      }.height(100)

      List({ space: 20, initialIndex: 0 }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height(100)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .border({ width: 1, color: Color.Pink })
              .backgroundColor(0xFFFFFF)
          }
        }, (item: string) => item)
      }
    }.height("100%")
    .padding({ bottom: 100 })
  }
}
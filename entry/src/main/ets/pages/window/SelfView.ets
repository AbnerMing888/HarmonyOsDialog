import { DialogBottomRootView } from '@abner/dialog'

@Component
export struct SelfView {

  @Builder
  itemLayout() {
    Column() {
      Text("==============")
    }.height(100)
  }

  build() {
    DialogBottomRootView({
      itemLayout: this.itemLayout,
      clearEmptyBorder: true,
      dialogHeight: 100
    })
  }
}
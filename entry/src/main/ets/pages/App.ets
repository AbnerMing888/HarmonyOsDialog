import { initDialog } from '@abner/dialog'
import { AbilityStage } from '@kit.AbilityKit'

export default class App extends AbilityStage {
  onCreate() {
    initDialog({
      isUseMainWindow: true,
      dialogAttribute:{

      }
    })
  }

  onDestroy(): void {

  }
}
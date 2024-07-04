@Component
export struct WordPress {
  @State spinSize: number = 60;
  @State spinColor: ResourceColor = Color.Blue;
  @State round1: number = this.spinSize * 0.2
  @State scale1: number = 1;
  @State angle1: number = 0;

  aboutToAppear(): void {
    this.round1 = this.spinSize * 0.24
  }

  build() {
    Stack() {
      Column() {
        Canvas()
          .roundStyle()
          .scale({ x: this.scale1, y: this.scale1 })
      }
      .frame1Style()
      .rotate({ angle: 0 })

    }
    .renderFit(RenderFit.CENTER)
    .width(this.spinSize)
    .height(this.spinSize)
    .borderRadius(this.spinSize / 2)
    .backgroundColor(this.spinColor)
    .rotate({ angle: this.angle1 })
    .onAppear(() => {
      this.getUIContext().keyframeAnimateTo({ iterations: -1, delay: 0 }, [{
        duration: 800,
        curve: Curve.Linear,
        event: () => {
          this.angle1 = 360
        }
      }]);
    })
  }

  @Styles
  roundStyle(){
    .width(this.round1)
    .height(this.round1)
    .borderRadius(this.round1)
    .backgroundColor('#fff')
    .position({y:2})
  }

  @Styles
  frame1Style(){
    .height('100%')
    .width(this.round1)
  }
}
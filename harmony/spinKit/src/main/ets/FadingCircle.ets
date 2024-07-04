@Component
export struct FadingCircle {
  @State spinSize: number = 60;
  @State spinColor: ResourceColor = Color.Blue;
  @State round1: number = this.spinSize * 0.2
  @State scale6: number = 0.7;

  @State angle1: number = 0;

  aboutToAppear(): void {
    this.round1 = this.spinSize * 0.2
  }

  build() {
    Stack() {
      Column() {
        Canvas()
          .roundStyle()
          .scale({ x: this.scale6, y: this.scale6 })
      }
      .frame1Style()
      .rotate({ angle: 0 })

      Column() {
        Canvas()
          .roundStyle()
          .scale({ x: this.scale6, y: this.scale6 })
          .opacity(0.1)
      }
      .frame1Style()
      .rotate({ angle: 225 })

      Column() {
        Canvas()
          .roundStyle()
          .scale({ x: this.scale6, y: this.scale6 })
          .opacity(0.3)
      }
      .frame1Style()
      .rotate({ angle: 260 })

      Column() {
        Canvas()
          .roundStyle()
          .scale({ x: this.scale6, y: this.scale6 })
          .opacity(0.5)
      }
      .frame1Style()
      .rotate({ angle: 295 })

      Column() {
        Canvas()
          .roundStyle()
          .scale({ x: this.scale6, y: this.scale6 })
          .opacity(0.7)
      }
      .frame1Style()
      .rotate({ angle: 325 })
    }
    .renderFit(RenderFit.CENTER)
    .width(this.spinSize)
    .height(this.spinSize)
    .rotate({ angle: this.angle1 })
    .onAppear(() => {
      this.getUIContext().keyframeAnimateTo({ iterations: -1, delay: 0 }, [{
        duration: 1200,
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
    .backgroundColor(this.spinColor)
  }

  @Styles
  frame1Style(){
    .height('100%')
    .width(this.round1)
  }
}


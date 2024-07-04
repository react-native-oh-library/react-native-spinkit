@Component
export struct CircleFlip {
  @State spinSize: number = 60;
  @State spinColor: ResourceColor = Color.White;
  @State x: number = 0;
  @State y: number = 0;
  @State angle: number = 0;

  build() {
    Canvas()
      .width(this.spinSize)
      .height(this.spinSize)
      .backgroundColor(this.spinColor)
      .renderFit(RenderFit.CENTER)
      .rotate({
        perspective: this.spinSize,
        x: this.x,
        y: this.y,
        angle: this.angle
      })
      .borderRadius(this.spinSize / 2)
      .onAppear(() => {
        this.getUIContext().keyframeAnimateTo({ iterations: -1, delay: 0 }, [
          {
            duration: 600,
            curve: Curve.EaseInOut,
            event: () => {
              this.angle = 180
              this.x = this.spinSize / 2
              this.y = 0
            }
          },
          {
            duration: 0,
            curve: Curve.EaseInOut,
            event: () => {
              this.angle = 0
            }
          },
          {
            duration: 600,
            curve: Curve.EaseInOut,
            event: () => {
              this.angle = 180
              this.x = 0
              this.y = this.spinSize / 2
            }
          }
        ])
      })
  }
}
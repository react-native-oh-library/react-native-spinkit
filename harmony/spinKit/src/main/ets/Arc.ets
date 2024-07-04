@Component
export struct Arc {
  @State spinSize: number = 60;
  @State spinColor: ResourceColor = Color.White;
  @State angle1: number = 0;
  @State angle2: number = 0;
  @State angle3: number = 0;

  build() {
    Stack() {
      Canvas()
        .width(this.spinSize)
        .height(this.spinSize)
        .border({
          width: this.spinSize * 0.03,
          radius: this.spinSize,
          color: {
            top: this.spinColor,
            right: this.spinColor,
            bottom: this.spinColor,
            left: Color.Transparent,
          },
        })
        .rotate({ angle: this.angle1 })

    }
    .renderFit(RenderFit.CENTER)
    .width(this.spinSize)
    .height(this.spinSize)
    .onAppear(() => {
      let keyframes1: Array<KeyframeState> = [
        {
          duration: 800,
          curve: Curve.Linear,
          event: () => {
            this.angle1 = 360
          }
        }];

      this.getUIContext().keyframeAnimateTo({ iterations: -1, delay: 0 }, keyframes1);
    })
  }
}


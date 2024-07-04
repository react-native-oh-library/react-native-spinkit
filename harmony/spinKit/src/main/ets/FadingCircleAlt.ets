@Component
export struct FadingCircleAlt {
  @State spinSize: number = 60;
  @State spinColor: ResourceColor = Color.Blue;
  @State round1: number = this.spinSize * 0.2
  @State scale1: number = 1;
  @State scale0: number = 0.09;
  @State scale2: number = 0.18;
  @State scale3: number = 0.27;
  @State scale4: number = 0.36;
  @State scale5: number = 0.45;
  @State scale6: number = 0.54;
  @State scale7: number = 0.63;
  @State scale8: number = 0.72;
  @State scale9: number = 0.81;
  @State scale10: number = 0.9;
  @State angle1: number = 0;

  aboutToAppear(): void {
    this.round1 = this.spinSize * 0.2
  }

  build() {
    Stack() {
      Column() {
        Canvas()
          .roundStyle()
          .scale({ x: this.scale1, y: this.scale1 })
          .opacity(1)
      }
      .frame1Style()
      .rotate({ angle: 360 })


      Column() {
        Canvas()
          .roundStyle()
          .scale({ x: this.scale10, y: this.scale10 })
          .opacity(this.scale10)
      }
      .frame1Style()
      .rotate({ angle: 330 })


      Column() {
        Canvas()
          .roundStyle()
          .scale({ x: this.scale9, y: this.scale9 })
          .opacity(this.scale9)
      }
      .frame1Style()
      .rotate({ angle: 300 })


      Column() {
        Canvas()
          .roundStyle()
          .scale({ x: this.scale8, y: this.scale8 })
          .opacity(this.scale8)
      }
      .frame1Style()
      .rotate({ angle: 270 })


      Column() {
        Canvas()
          .roundStyle()
          .scale({ x: this.scale7, y: this.scale7 })
          .opacity(this.scale7)
      }
      .frame1Style()
      .rotate({ angle: 240 })


      Column() {
        Canvas()
          .roundStyle()
          .scale({ x: this.scale6, y: this.scale6 })
          .opacity(this.scale6)
      }
      .frame1Style()
      .rotate({ angle: 210 })


      Column() {
        Canvas()
          .roundStyle()
          .scale({ x: this.scale5, y: this.scale5 })
          .opacity(this.scale5)
      }
      .frame1Style()
      .rotate({ angle: 180 })


      Column() {
        Canvas()
          .roundStyle()
          .scale({ x: this.scale4, y: this.scale4 })
          .opacity(this.scale4)
      }
      .frame1Style()
      .rotate({ angle: 150 })


      Column() {
        Canvas()
          .roundStyle()
          .scale({ x: this.scale3, y: this.scale3 })
          .opacity(this.scale3)
      }
      .frame1Style()
      .rotate({ angle: 120 })


      Column() {
        Canvas()
          .roundStyle()
          .scale({ x: this.scale2, y: this.scale2 })
          .opacity(this.scale2)
      }
      .frame1Style()
      .rotate({ angle: 90 })


      Column() {
        Canvas()
          .roundStyle()
          .scale({ x: this.scale0, y: this.scale0 })
          .opacity(this.scale2)
      }
      .frame1Style()
      .rotate({ angle: 60 })

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
    .borderRadius(this.round1)
    .backgroundColor(this.spinColor)
  }

  @Styles
  frame1Style(){
    .height('100%')
    .width(this.round1)
  }
}


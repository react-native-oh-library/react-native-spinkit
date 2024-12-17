/*
 * MIT License
 *
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

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
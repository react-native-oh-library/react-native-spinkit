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
export struct NineCubeGrid {
  @State spinSize: number = 60;
  @State spinColor: ResourceColor = Color.White;
  @State scale1: number = 1;
  @State scale2: number = 1;
  @State scale3: number = 1;
  @State scale4: number = 1;
  @State scale5: number = 1;
  @State scale6: number = 1;
  @State scale7: number = 1;
  @State scale8: number = 1;
  @State scale9: number = 1;

  build() {
    Grid() {
      GridItem() {
        Canvas().chunkStyle()
      }.scale({ x: this.scale1, y: this.scale1, z: 1 })

      GridItem() {
        Canvas().chunkStyle()
      }.scale({ x: this.scale2, y: this.scale2, z: 1 })

      GridItem() {
        Canvas().chunkStyle()
      }.scale({ x: this.scale3, y: this.scale3, z: 1 })

      GridItem() {
        Canvas().chunkStyle()
      }.scale({ x: this.scale4, y: this.scale4, z: 1 })

      GridItem() {
        Canvas().chunkStyle()
      }.scale({ x: this.scale5, y: this.scale5, z: 1 })

      GridItem() {
        Canvas().chunkStyle()
      }.scale({ x: this.scale6, y: this.scale6, z: 1 })

      GridItem() {
        Canvas().chunkStyle()
      }.scale({ x: this.scale7, y: this.scale7, z: 1 })

      GridItem() {
        Canvas().chunkStyle()
      }.scale({ x: this.scale8, y: this.scale8, z: 1 })

      GridItem() {
        Canvas().chunkStyle()
      }.scale({ x: this.scale9, y: this.scale9, z: 1 })
    }
    .rowsTemplate('1fr 1fr 1fr')
    .columnsTemplate('1fr 1fr 1fr')
    .renderFit(RenderFit.CENTER)
    .width(this.spinSize)
    .height(this.spinSize)
    .onAppear(() => {
      let keyframes0: Array<KeyframeState> = [
        {
          duration: 500,
          curve: Curve.EaseInOut,
          event: () => {
            this.scale7 = 0;
          }
        },
        {
          duration: 500,
          curve: Curve.Linear,
          event: () => {
            this.scale7 = 1;
          }
        },
        {
          duration: 400,
          curve: Curve.Linear,
          event: () => {

          }
        }
      ];
      let keyframes1: Array<KeyframeState> = [
        {
          duration: 500,
          curve: Curve.EaseInOut,
          event: () => {
            this.scale4 = 0;
            this.scale8 = 0;
          }
        },
        {
          duration: 500,
          curve: Curve.Linear,
          event: () => {
            this.scale4 = 1;
            this.scale8 = 1;
          }
        },
        {
          duration: 400,
          curve: Curve.Linear,
          event: () => {

          }
        }
      ];
      let keyframes2: Array<KeyframeState> = [
        {
          duration: 500,
          curve: Curve.EaseInOut,
          event: () => {
            this.scale1 = 0;
            this.scale5 = 0;
            this.scale9 = 0;
          }
        },
        {
          duration: 500,
          curve: Curve.Linear,
          event: () => {
            this.scale1 = 1;
            this.scale5 = 1;
            this.scale9 = 1;
          }
        },
        {
          duration: 400,
          curve: Curve.Linear,
          event: () => {

          }
        }
      ];
      let keyframes3: Array<KeyframeState> = [
        {
          duration: 500,
          curve: Curve.EaseInOut,
          event: () => {
            this.scale2 = 0;
            this.scale6 = 0;
          }
        },
        {
          duration: 500,
          curve: Curve.Linear,
          event: () => {
            this.scale2 = 1;
            this.scale6 = 1;
          }
        },
        {
          duration: 400,
          curve: Curve.Linear,
          event: () => {

          }
        }
      ];
      let keyframes4: Array<KeyframeState> = [
        {
          duration: 500,
          curve: Curve.EaseInOut,
          event: () => {
            this.scale3 = 0;
          }
        },
        {
          duration: 500,
          curve: Curve.Linear,
          event: () => {
            this.scale3 = 1;
          }
        },
        {
          duration: 400,
          curve: Curve.Linear,
          event: () => {

          }
        }
      ];
      this.getUIContext().keyframeAnimateTo({ iterations: -1, delay: 0 }, keyframes0);
      this.getUIContext().keyframeAnimateTo({ iterations: -1, delay: 100 }, keyframes1);
      this.getUIContext().keyframeAnimateTo({ iterations: -1, delay: 200 }, keyframes2);
      this.getUIContext().keyframeAnimateTo({ iterations: -1, delay: 300 }, keyframes3);
      this.getUIContext().keyframeAnimateTo({ iterations: -1, delay: 400 }, keyframes4);
    })
  }

  @Styles
  chunkStyle(){
    .width(this.spinSize / 3)
    .height(this.spinSize / 3)
    .backgroundColor(this.spinColor)
  }
}


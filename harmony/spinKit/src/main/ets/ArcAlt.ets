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
export struct ArcAlt {
  @State @Watch('refreshCanvas') spinSize: number = 60;
  @State spinColor: ResourceColor = 'blue';
  @State lineWidth: number = 1;
  @State centerX: number = this.spinSize / 2;
  @State centerY: number = this.spinSize / 2;
  @State startAngle: number = 0;
  @State endAngle: number = Math.PI * 2;
  @State currentAngle: number = 0;
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private contextVP: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  animationInterval: number | undefined;

  refreshCanvas() {
    this.animatedArc()
  }

  aboutToAppear(): void {

  }

  drawArc(angle: number) {
    this.contextVP.clearRect(0, 0, this.spinSize, this.spinSize);

    this.contextVP.beginPath();
    this.contextVP.arc(this.spinSize / 2, this.spinSize / 2, (this.spinSize - this.lineWidth) / 2, 0, this.endAngle,
      false);
    this.contextVP.lineWidth = this.lineWidth;
    this.contextVP.strokeStyle = Color.Transparent;
    this.contextVP.stroke()

    this.contextVP.beginPath();
    this.contextVP.arc(this.spinSize / 2, this.spinSize / 2, (this.spinSize - this.lineWidth) / 2, this.startAngle,
      angle, false);
    this.contextVP.lineWidth = this.lineWidth;
    this.contextVP.strokeStyle = this.spinColor as string;
    this.contextVP.stroke();
  }

  animatedArc() {
    // Calculate animation steps
    const totalTime = 800;
    const fps = 60;
    const frameDuration = 1000 / fps;
    const totalFrames = totalTime / frameDuration;
    let currentFrame = 0;

    // Start animation using setInterval
    currentFrame = 0;
    const startAnimation = () => {
      currentFrame = 0;
      this.animationInterval = setInterval(() => {
        currentFrame++;

        // Calculate current progress
        const progress = currentFrame / totalFrames;
        this.currentAngle = Math.PI * 2 * progress;

        // Draw current frame
        this.drawArc(this.currentAngle);

        // Check if animation is complete
        if (currentFrame >= totalFrames) {
          clearInterval(this.animationInterval);
          this.animationInterval = undefined;
          if (!this.animationInterval) {
            startAnimation(); // Restart animation if loop is enabled
          }
        }
      }, frameDuration);
    }

    // Start initial animation
    startAnimation();
  }

  build() {
    Stack() {
      Column() {
        Canvas(this.contextVP)
          .width(this.spinSize)
          .height(this.spinSize)
          .onReady(() => {
            this.animatedArc()
          })
      }
    }
    .renderFit(RenderFit.CENTER)
    .width(this.spinSize)
    .height(this.spinSize)
  }
}
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
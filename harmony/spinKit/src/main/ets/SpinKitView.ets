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

import { RNComponentContext, RNViewBase } from '@rnoh/react-native-openharmony';
import { RNC } from "@rnoh/react-native-openharmony/generated"
import { SpinKit, SpinType } from '@pura/spinkit/Index';
import { CircleFlip } from './CircleFlip';
import { WordPress } from './WordPress';
import { FadingCircle } from './FadingCircle';
import { FadingCircleAlt } from './FadingCircleAlt';
import { Arc } from './Arc';
import { ArcAlt } from './ArcAlt';
import { NineCubeGrid } from './NineCubeGrid';

@Component
export struct SpinKitView {
  public static readonly NAME = RNC.SpinKitView.NAME;
  public ctx!: RNComponentContext;
  public tag: number = 0;
  @State private descriptorWrapper: RNC.SpinKitView.DescriptorWrapper = {} as RNC.SpinKitView.DescriptorWrapper;
  private cleanUpCallbacks: (() => void)[] = [];
  private scroller: Scroller = new Scroller();

  aboutToAppear() {
    this.onDescriptorWrapperChange(this.ctx.descriptorRegistry.findDescriptorWrapperByTag<RNC.SpinKitView.DescriptorWrapper>(this.tag)!);
    this.cleanUpCallbacks.push(this.ctx.descriptorRegistry.subscribeToDescriptorChanges(this.tag,
      (_descriptor, newDescriptorWrapper) => {
        this.onDescriptorWrapperChange(newDescriptorWrapper! as RNC.SpinKitView.DescriptorWrapper)
      }
    ))
  }

  private onDescriptorWrapperChange(descriptorWrapper: RNC.SpinKitView.DescriptorWrapper) {
    this.descriptorWrapper = descriptorWrapper;
  }

  aboutToDisappear() {
    this.cleanUpCallbacks.forEach(cb => cb());
  }

  build() {
    RNViewBase({ ctx: this.ctx, tag: this.tag }) {
      Column() {
        if (this.descriptorWrapper.props.type === 'Plane') {
          SpinKit({
            spinType: SpinType.spinA,
            spinSize: this.descriptorWrapper.props.size,
            spinColor: this.descriptorWrapper.props.color
          })
        } else if (this.descriptorWrapper.props.type === 'CircleFlip') {
          CircleFlip({
            spinSize: this.descriptorWrapper.props.size,
            spinColor: this.descriptorWrapper.props.color
          })
        } else if (this.descriptorWrapper.props.type === 'Bounce') {
          SpinKit({
            spinType: SpinType.spinB,
            spinSize: this.descriptorWrapper.props.size,
            spinColor: this.descriptorWrapper.props.color
          })
        } else if (this.descriptorWrapper.props.type === 'Wave') {
          SpinKit({
            spinType: SpinType.spinC,
            spinSize: this.descriptorWrapper.props.size,
            spinColor: this.descriptorWrapper.props.color
          })
        } else if (this.descriptorWrapper.props.type === 'WanderingCubes') {
          SpinKit({
            spinType: SpinType.spinD,
            spinSize: this.descriptorWrapper.props.size,
            spinColor: this.descriptorWrapper.props.color
          })
        } else if (this.descriptorWrapper.props.type === 'Pulse') {
          SpinKit({
            spinType: SpinType.spinE,
            spinSize: this.descriptorWrapper.props.size,
            spinColor: this.descriptorWrapper.props.color
          })
        } else if (this.descriptorWrapper.props.type === 'ChasingDots') {
          SpinKit({
            spinType: SpinType.spinF,
            spinSize: this.descriptorWrapper.props.size,
            spinColor: this.descriptorWrapper.props.color
          })
        } else if (this.descriptorWrapper.props.type === 'ThreeBounce') {
          SpinKit({
            spinType: SpinType.spinG,
            spinSize: this.descriptorWrapper.props.size,
            spinColor: this.descriptorWrapper.props.color
          })
        } else if (this.descriptorWrapper.props.type === 'Circle') {
          SpinKit({
            spinType: SpinType.spinM,
            spinSize: this.descriptorWrapper.props.size,
            spinColor: this.descriptorWrapper.props.color
          })
        } else if (this.descriptorWrapper.props.type === '9CubeGrid') {
          NineCubeGrid({
            spinSize: this.descriptorWrapper.props.size,
            spinColor: this.descriptorWrapper.props.color
          })
        } else if (this.descriptorWrapper.props.type === 'WordPress') {
          WordPress({
            spinSize: this.descriptorWrapper.props.size,
            spinColor: this.descriptorWrapper.props.color
          })
        } else if (this.descriptorWrapper.props.type === 'FadingCircle') {
          FadingCircle({
            spinSize: this.descriptorWrapper.props.size,
            spinColor: this.descriptorWrapper.props.color
          })
        } else if (this.descriptorWrapper.props.type === 'FadingCircleAlt') {
          FadingCircleAlt({
            spinSize: this.descriptorWrapper.props.size,
            spinColor: this.descriptorWrapper.props.color
          })
        } else if (this.descriptorWrapper.props.type === 'Arc') {
          Arc({
            spinSize: this.descriptorWrapper.props.size,
            spinColor: this.descriptorWrapper.props.color
          })
        } else if (this.descriptorWrapper.props.type === 'ArcAlt') {
          ArcAlt({
            spinSize: this.descriptorWrapper.props.size,
            spinColor: this.descriptorWrapper.props.color
          })
        }
      }

      this.ctx.wrappedRNChildrenBuilder.builder(this.ctx, this.tag)
    }
  }
}

import {
  RNPackage,
  DescriptorWrapperFactoryByDescriptorType,
  DescriptorWrapperFactoryByDescriptorTypeCtx
} from '@rnoh/react-native-openharmony/ts';
import { RNC } from "@rnoh/react-native-openharmony/generated/ts"

export class SpinKitPackage extends RNPackage {

  createDescriptorWrapperFactoryByDescriptorType(ctx: DescriptorWrapperFactoryByDescriptorTypeCtx): DescriptorWrapperFactoryByDescriptorType {
    return { 'SpinKitView': (ctx2) => new RNC.SpinKitView.DescriptorWrapper(ctx2.descriptor) }
  }
}

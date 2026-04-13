import {
  HostComponent, ViewProps
} from "react-native";
import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import type { Int32, WithDefault } from 'react-native/Libraries/Types/CodegenTypes';

export interface SpinnerProps extends ViewProps {
  color?: WithDefault<string, '#000000'>;
  size?: WithDefault<Int32, 37>;
  type?: WithDefault<'CircleFlip'
    | 'Bounce'
    | 'Wave'
    | 'WanderingCubes'
    | 'Pulse'
    | 'ChasingDots'
    | 'ThreeBounce'
    | 'Circle'
    | 'CubeGrid'
    | 'WordPress'
    | 'FadingCircle'
    | 'FadingCircleAlt'
    | 'Arc'
    | 'ArcAlt'
    | 'Plane', 'Plane'>;
};

export default codegenNativeComponent<SpinnerProps>("SpinKitView") as HostComponent<SpinnerProps>;
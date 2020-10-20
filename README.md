# Godot 3 2D CRT Shader

A 2D shader for Godot 3 simulating a CRT.

![A 2D shader for Godot 3 simulating a CRT - OFF](/examples/crt-off.png)
![A 2D shader for Godot 3 simulating a CRT - ON](/examples/crt-on.png)

## Usage

* Create a `CanvasLayer`.
* Add a `ColorRect` as a child node of the `CanvasLayer`.
* In the `ColorRect` properties:
  * Go to the **Material** section.
  * Click on the `[empty]` dropdown from **Material** and load `crt_material.tres`.

### Note
If for some reason, when loading the `crt_material.tres`, the `crt_shader.shader` is empty, just open it with any text editor, copy the code in the **Shader** editor and save it.

## Shader Parameters

### Screen size

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `screen_size` | `vec2` | `vec2(320.0, 180.0)` | The size of your project's `display/window/size`. |

### Show curvature

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `show_curvature` | `bool` | `true`  | Enables/disables the curvature effect. |

Works best in `window/stretch/mode="2d"`.

### Curvature X amount

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `curvature_x_amount` | `float` | `6.0` | Controls the curvature on the X axis. The lower the amount, the lower distortion. Range from `3.0` to `15.0` with `0.01` steps. |

### Curvature Y amount

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `curvature_y_amount` | `float` | `6.0` | Controls the curvature on the Y axis. The lower the amount, the lower distortion. Range from `3.0` to `15.0` with `0.01` steps. |

### Corner color
| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `corner_color` | `vec4` | `vec4(0.0, 0.0, 0.0, 1.0)` | The color of the blank space on the corners left by the curvature. |

### Show vignette

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `show_vignette` | `bool` | `true` | Enables/disables the vignette effect. |

### Vignette opacity

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vignette_opacity` | `float` | `0.2` | Controls the opacity of the vignette. Range from `0.0` to `1.0` with `0.01` steps. |

### Show horizontal scan lines

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `show_horizontal_scan_lines` | `bool` | `true` | Enables/disables the horizontal scan lines. |

### Horizontal scan lines amount

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `horizontal_scan_lines_amount` | `float` | `180.0` | Controls how many horizontal scan lines appear. Range from `0.0` to `180.0` with `0.1` steps. |

Setting it to your project's `windows/size/height` should work fine, but you can play with it to get the results best fitted to your liking.

Having fewer scan lines will make them larger, which makes it harder for the moire effect to appear.

### Horizontal scan lines opacity

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `horizontal_scan_lines_opacity` | `float` | `1.0` | Controls the opacity of the horizontal scan lines. `0.0` is complete opaque. Range from `0.0` to `1.0` with `0.01` steps. |

### Show vertical scan lines

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `show_vertical_scan_lines` | `bool` | `true` | Enables/disables the vertical scan lines. |

### Vertical scan lines amount

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vertical_scan_lines_amount` | `float` | `320.0` | Controls how many vertical scan lines appear.  Range from `0.0` to `320.0` with `0.1` steps. |

Setting it to your project's `windows/size/width` should work fine, but you can play with it to get the results best fitted to your liking.

Having fewer scan lines will make them larger, which makes it harder for the moire effect to appear.

### Vertical scan lines opacity

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vertical_scan_lines_opacity` | `float` | `1.0` | Controls the opacity of the vertical scan lines. `0.0` is complete opaque. Range from `0.0` to `1.0` with `0.01` steps. |

### Boost

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `boost` | `float` | `1.2` | Gives extra brightness to compensate the scanlines and the vignette. Range from `1.0` to `2.0` with `0.01` steps. |

### Aberration amount

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `aberration_amount` | `float` | `0.0` | Controls the amount of chromatic aberration. Range from `0.0` to `10.0` with `0.01` steps. |

## Changelog

See [CHANGELOG](/CHANGELOG.md).

## Authors

* Me 😛 [hiulit](https://github.com/hiulit).

## Credits

Thanks to:

* **knarkowicz** - For the orginal shader code, taken from https://www.shadertoy.com/view/XtlSD7.
* [CowThing](https://github.com/CowThing) - For helping **a lot** in bringing actual distortion and many other improvements to the shader with [#1](https://github.com/hiulit/Godot-3-2D-CRT-Shader/pull/1).
* [uheartbeast](https://twitter.com/uheartbeast) - For the amazing [chromatic aberration shader video tutorial](https://www.youtube.com/watch?v=-PJOHAsBcoI).
* [Miltage](https://github.com/Miltage) - For helping in fixing an issue with the scan lines opacity [#5](https://github.com/hiulit/Godot-3-2D-CRT-Shader/pull/5).
* [Tom (Let's GameDev)](https://twitter.com/letsgamedev) - For the amazing [CRT shader video tutorial](https://www.youtube.com/watch?v=Dn8joy4tP2Q), which I took the scan lines from.

## License

[MIT License](/LICENSE).
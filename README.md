# Godot 3 2D CRT Shader

A 2D shader for Godot 3 simulating a CRT.

![A 2D shader for Godot 3 simulating a CRT - OFF](/example-crt-off.png)
![A 2D shader for Godot 3 simulating a CRT- ON](/example-crt-on.png)

## Usage

* Create a `CanvasLayer`.
* Add a `ColorRect` as a child node of the `CanvasLayer`.
* In the `ColorRect` properties:
  * Go to the **Material** section.
  * Click on the `[empty]` **Material** and load `crt_material.tres`.

If, for for reason, when loading `crt_material.tres` the `crt.shader` **Shader** is empty, just open it with any text editor, copy the code in the **Shader** editor and save it.

## Shader Parameters

### Blend Color

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `blend_color` | `vec4` | `vec4(1.0, 1.0, 1.0, 1.0)` | White is complete transparent. Black is complete opaque. The in-between colors get blended with the canvas. |

### Boost

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `boost` | `float` | `1.0` | Gives extra brightness to compensate for the scanlines. Range from `1.0` to `1.5` with `0.05` steps. |

## Authors

* Me 😛 [hiulit](https://github.com/hiulit).

## Credits

Orginal code by **knarkowicz**. Taken from https://www.shadertoy.com/view/XtlSD7 .

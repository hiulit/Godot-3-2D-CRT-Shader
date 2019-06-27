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

## Authors

* Me 😛 [hiulit](https://github.com/hiulit).

## Credits

Orginal code by **knarkowicz**. Taken from https://www.shadertoy.com/view/XtlSD7 .

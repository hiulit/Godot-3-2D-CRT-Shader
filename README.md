# Godot 3 2D CRT Shader

A 2D shader for Godot 3 simulating a CRT.

![A 2D shader for Godot 3 simulating a CRT - OFF](/examples/crt-off.png)
![A 2D shader for Godot 3 simulating a CRT- ON](/examples/crt-on.png)

## Usage

* Create a `CanvasLayer`.
* Add a `ColorRect` as a child node of the `CanvasLayer`.
* In the `ColorRect` properties:
  * Go to the **Material** section.
  * Click on the `[empty]` **Material** and load `crt_material.tres`.

If for for reason, when loading the `crt_material.tres`, the `crt.shader` is empty, just open it with any text editor, copy the code in the **Shader** editor and save it.

## Shader Parameters

### Boost

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `boost` | `float` | `1.2` | Gives extra brightness to compensate for the grille, the scanlines and the vignette. Range from `1.0` to `2.0` with `0.01` steps. |

### Grille opacity

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `grille_opacity` | `float` | `0.85` | Controls the opacity of the grille. `0.0` is complete opaque. Range from `0.0` to `1.0` with `0.01` steps. |

### Scanlines opacity

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `scanlines_opacity` | `float` | `0.95` | Controls the opacity of the scanlines. `0.0` is complete opaque. Range from `0.0` to `1.0` with `0.01` steps. |

### Vignette opacity

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vignette_opacity` | `float` | `0.2` | Controls the opacity of the vignette. Range from `0.1` to `0.5` with `0.01` steps. |

### Scanlines speed

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `scanlines_speed` | `float` | `1.0` | Controls the speed of the scanlines. Range from `0.0` to `1.0` with `0.01` steps. |

### Show grille

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `show_grille` | `bool` | `true` | Enables/disables the grille. |

Only works in `window/stretch/mode="2d"`.

### Show scanlines

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `show_scanlines` | `bool` | `true` | Enable/disable the scanlines. |

### Show vignette

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `show_vignette` | `bool` | `true` | Enables/disables the vignette. |

### Show curvature

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `show_curvature` | `bool` | `true` | Enables/disables the curvature. |

### Screen size

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `screen_size` | `vec2` | `(320.0, 180.0)` | Controls how many grille lines and scanlines appear. Having fewer grille lines and scanlines will make them larger, which makes it harder for the moire effect to appear. |

Setting it to your project's `windows/size` should work fine, but you can play with it to get the results best fitted to your liking.

### Aberration amount

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `aberration_amount` | `float` | `0.0` | Controls the amount of chromatic aberration. Range from `0.0` to `10.0` with `1.0` steps. |

### Move aberration

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `move_aberration` | `bool` | `false` | Enables/disables the chromatic aberration movement. |

### Aberration speed

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `aberration_speed` | `float` | `1.0` | Controls the speed of the moving chromatic aberration (the greater the value the slower the movement). Range from `0.01` to `10.0` with `0.01` steps. |

## Changelog

See [CHANGELOG](/CHANGELOG.md).

## Authors

* Me 😛 [hiulit](https://github.com/hiulit).

## Credits

Thanks to:

* **knarkowicz** - For the orginal shader code, taken from https://www.shadertoy.com/view/XtlSD7.
* [CowThing](https://github.com/CowThing) - For helping **a lot** in bringing actual distortion and many other improvements to the shader with [#1](https://github.com/hiulit/Godot-3-2D-CRT-Shader/pull/1).
* [uheartbeast](https://twitter.com/uheartbeast) - For the amazing [chromatic aberration shader video tutorial](https://www.youtube.com/watch?v=-PJOHAsBcoI).

## License

[MIT License](/LICENSE).
# Changelog

## Unreleased

* Up to date.

## [2.0.0] - 2020-10-20

**NOTE**: This release contains breaking changes.

The parameters are basically the same but with new names. Check the [documentation](https://github.com/hiulit/Godot-3-2D-CRT-Shader/tree/master#shader-parameters).

### Added

* `curvature_x_amount` - Controls the curvature on the X axis.
* `curvature_y_amount` - Controls the curvature on the Y axis.

### Changed

* Every mention to **grille** is now referred as **vertical scan lines**.

### Deprecated

* ~~`scanlines_speed`~~
* ~~`move_aberration`~~
* ~~`aberration_speed`~~

## [1.3.1] - 2020-10-19

### Fixed

* The scanlines and grille are now non-destructive. This allows to lower the opacity of the scanlines and grille without resulting in a completely black screen. Thanks to [Miltage](https://github.com/Miltage) for helping with this issue [#5](https://github.com/hiulit/Godot-3-2D-CRT-Shader/pull/5).

## [1.3.0] - 2019-09-13

### Added

* New parameter: `aberration_amount` - To control the amount of aberration.
* New parameter: `move_aberration` - To control the movement state of the aberration.
* New parameter: `aberration_speed` - To control the speed of the moving aberration.

### Changed

* `boost` parameter now can go up to `2.0`.
* `vignette` now depends on the screen size.

## [1.2.0] - 2019-07-18

### Added

* Screen texture and scanlines are now affected by curvature.
* New parameter: `grille_opacity` - To control the opacity of the grille.
* New parameter: `scanlines_opacity` - To control the opacity of the scanlines.
* New parameter: `scanlines_speed` - To control the speed of the scanlines.
* New parameter: `screen_size` - To control how many grille lines and scanlines appear.

### Changed

* `boost` and `vignette_opacity` steps are now `0.01`.
* `vignette_opacity` default value is now `0.2`.

### Deprecated

* Parameter: `blend_color` - No longer needed.

## [1.1.0] - 2019-07-15

### Added

* More parameters to adjust the shader:
  * `vignette_opacity`
  * `show_grille`
  * `show_scanlines`
  * `show_vignette`
  * `show_curvature`

## [1.0.0] - 2019-06-27

* Released stable version.
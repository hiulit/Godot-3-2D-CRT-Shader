# Changelog

## Unreleased

* Up to date.

## [1.2.0] - 2019-07-18

## Added

* Screen texture and scanlines are now affected by curvature.
* New parameter: `grille_opacity` - To control the opacity of the grille.
* New parameter: `scanlines_opacity` - To control the opacity of the scanlines.
* New parameter: `scanlines_speed` - To control the speed of the scanlines.
* New parameter: `screen_size` - To control how many grille lines and scanlines appear.

## Changed

* `boost` and `vignette_opacity` steps are now `0.01`.
* `vignette_opacity` default value is now `0.2`.

## Deprecated

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
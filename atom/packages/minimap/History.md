1.6.0 / 2014-07-09
==================

* add a `Use Hardware Acceleration` option that allow to choose between `translate` or `translate3d` for the minimap scroll offset
* fix a weird rendering issue where many update of the minimap were done with various offset

1.5.2 / 2014-07-09
==================

* fix an unexpected offset on the right side of the editor contents

1.5.1 / 2014-07-09
==================

* fix with-minimap decoration removed on tab change when react editor is enabled
* fix pane styles with minimap and react editor enabled
* fix minimap line-height with react editor enabled
* fix error raised when closing the last tab in a pane

1.5.0 / 2014-07-07
==================

* add support for react editor mode

1.4.0 / 2014-06-28
==================

* fix error on line classlist access

1.3.0 / 2014-05-21
==================

* fix broken minimap when `useReactEditor` is enabled
* 🐎  remove forced hardware acceleration on minimap

1.2.0 / 2014-05-20
==================

* add a `Display Minimap On Left` setting allowing for the minimap to be placed on the left of the editor view
* add a line on the right edge of the minimap indicating how much of the buffer is displayed by the minimap. This line is only displayed if the minimap can scroll.
* add a `lineOverdraw` setting that allow to change the number of additional lines to render in the minimap. Bigger values will increase render time but will reduce the number of redraws during scrolling.

1.1.0 / 2014-05-16
==================

* removes obsolete minimap contextual menu

1.0.2 / 2014-05-15
==================

* fix inconsistent arguments passed to `eachMinimapView` callbacks for already existing minimaps

1.0.1 / 2014-05-12
==================

* fix with-minimap class removed from pane on tab close


1.0.0 / 2014-05-11
==================

* minimap views are now created for each editor and not for each pane
* add a `eachMinimapView` subscription method in `Minimap` class
* add a view aware minimap rendering, it speeds up rendering and updates for large files
* add delegation of `MinimapEditorView` methods in `MinimapView`, allowing to manipulate most of its API directory from a minimap view
* add a lines API on `MinimapEditorView` allowing to decorates lines with classes even when they are not rendered yet


0.10.0 / 2014-05-11
===================

* add Minimap.versionMatch method allowing plugins to test against minimap version

0.9.8 / 2014-05-08
==================

* add Customizing Style to Readme

0.9.7 / 2014-05-08
==================

* better rendering for ASCII characters, fix #69

0.9.6 / 2014-05-07
==================

* fix error on closing an image view pane
* add Travis CI

0.9.5 / 2014-05-04
==================

* add reference to the new highlight-selected plugin

0.9.4 / 2014-05-01
==================

* fix item move to other pane, both panes's minimap updates #65

0.9.3 / 2014-04-25
==================

* Properly stick to the editor line height

0.9.1 / 2014-04-13
==================

* fix minimap doesn't update on active view changes when auto-toggle is true, #59

0.9.0 / 2014-04-11
==================

* add minimap indicator
* split updateScrollX and updateScrollY

0.8.0 / 2014-04-10
==================

* minimap api
* minimap plugin manager

0.7.0 / 2014-04-05
==================

* use `prolix` mixin for debug
* add plugins list
* `find-and-replace` and `git-diff` now available!

0.6.0 / 2014-04-04
==================

* fix broken minimap activation on non editor view, #46
* move resizeend to main file

0.5.0 / 2014-04-03
==================

* drag-to-scroll
* using `ctrl-k ctrl-m` toggle the minimap without the logs
* using `ctrl-k ctrl-d` toggle the minimap with the logs

0.4.0 / 2014-04-02
==================

* update redacted font, fixed instead of regular
* expose an instance of a Minimap class
* refactor view to have the same structure ad editor view
* move resizeend.js to vendor dir
* store pane id as a local variable to minimize bloats
* fix scrolling when on Vim mode or in Find pane
* disalbed syncing scroll when `scroll-left-changed` of editor

0.3.0 / 2014-03-31
==================

* add `minimap-wrapper` container, wrapped `minimap-editor` and `minimap-overlayer`
* add `with-minimap` css class to pane, #16
* responsive support for minimap and tweaks css styles
* `minimap-overlayer` displayed by default, #25
* add test cases, #28
* refactor minimap views, #32
* feature minimap partial update, performance improvement #35
* subscribe `screen-lines-changed` of editor and syncing

0.2.2 / 2014-03-20
==================

* fix `@miniScrollView.data('top')` doesn't reset to 0 after switch with files

0.2.1 / 2014-03-20
==================

* supports window resize
* improve style

0.2.0 / 2014-03-19
==================

* supports to multi `paneViews`, by @abe33
* add simple `click-to-scroll`, no animation
* use css3 transform instead of left/top
* fix minimap obscured when tree view to toggled to right side of window, #9, by @Orangetronic
* fix not display empty line

0.1.4 / 2014-03-17
==================

* add Redacted font, improves styles, by @abe33
* refactors updateMinimapView
* add a config.js, defualts config
* add scrollLeft and scrollTop on minimap, sync to editor
* fix #10, js erors when opening image files

0.0.4 / 2014-03-16
==================

* add gray overlayer, toggle display over/leave
* support mousewheel, sync editor and minimap scrollTop


0.0.3 / 2014-03-14
==================

* fix #2, minimap is appearing on the right when opening settings tab
* fix #3, opening settings tab breaks when minimap is use

0.0.2 / 2014-03-13
==================

* add minimap-editor-view
* add monitor tab-bar and file-tree

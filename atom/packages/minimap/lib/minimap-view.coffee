{$, View, EditorView} = require 'atom'
Debug = require 'prolix'
Delegato = require 'delegato'

MinimapEditorView = require './minimap-editor-view'
MinimapIndicator = require './minimap-indicator'
CONFIGS = require './config'

module.exports =
class MinimapView extends View
  Debug('minimap').includeInto(this)
  Delegato.includeInto(this)

  @delegatesMethods 'getLineHeight', 'getLinesCount', 'getMinimapHeight', 'getMinimapScreenHeight', 'getMinimapHeightInLines', 'getFirstVisibleScreenRow', 'getLastVisibleScreenRow', 'addLineClass', 'removeLineClass', 'removeAllLineClasses', toProperty: 'miniEditorView'

  @content: ->
    @div class: 'minimap', =>
      @div outlet: 'miniScroller', class: "minimap-scroller"
      @div outlet: 'miniWrapper', class: "minimap-wrapper", =>
        @div outlet: 'miniUnderlayer', class: "minimap-underlayer"
        @subview 'miniEditorView', new MinimapEditorView()
        @div outlet: 'miniOverlayer', class: "minimap-overlayer", =>
          @div outlet: 'miniVisibleArea', class: "minimap-visible-area"

  configs: {}
  isClicked: false

  # VIEW CREATION/DESTRUCTION

  constructor: (@editorView) ->
    @editor = @editorView.getEditor()
    @paneView = @editorView.getPane()

    super

    @scaleX = 0.2
    @scaleY = @scaleX * 0.8
    @minimapScale = @scale(@scaleX, @scaleY)
    @miniScrollView = @miniEditorView.scrollView
    @transform @miniWrapper[0], @minimapScale
    # dragging's status
    @isPressed = false
    @offsetLeft = 0
    @offsetTop = 0
    @indicator = new MinimapIndicator()

    @scrollView = @editorView.scrollView
    @scrollViewLines = @scrollView.find('.lines')

    @subscribeToEditor()

    @miniEditorView.minimapView = this
    @miniEditorView.setEditorView(@editorView)

    @updateMinimapView()

  initialize: ->
    @on 'mousewheel', @onMouseWheel
    @on 'mousedown', @onMouseDown

    @on 'mousedown', '.minimap-visible-area', @onDragStart

    @subscribe @paneView.model.$activeItem, @onActiveItemChanged
    # Fixed item move to other pane.
    @subscribe @paneView.model, 'item-removed', (item) -> item.off? '.minimap'

    @subscribe @miniEditorView, 'minimap:updated', @updateMinimapView

    @subscribe $(window), 'resize:end', @onScrollViewResized

    themeProp = 'minimap.theme'
    @subscribe atom.config.observe themeProp, callNow: true, =>
      @configs.theme = atom.config.get(themeProp) ? CONFIGS.theme
      @updateTheme()

    @miniScrollVisible = atom.config.get('minimap.minimapScrollIndicator')
    @miniScroller.toggleClass 'visible', @miniScrollVisible
    atom.config.observe 'minimap.minimapScrollIndicator', =>
      @miniScrollVisible = atom.config.get('minimap.minimapScrollIndicator')
      @miniScroller.toggleClass 'visible', @miniScrollVisible

    atom.config.observe 'minimap.useHardwareAcceleration', =>
      @updateScroll() if @ScrollView?

  destroy: ->
    @off()
    @unsubscribe()

    @detachFromPaneView()
    @miniEditorView.destroy()
    @remove()

  # MINIMAP DISPLAY MANAGEMENT

  attachToPaneView: ->
    @paneView.addClass('with-minimap')
    @paneView.append(this)

  detachFromPaneView: ->
    @paneView.removeClass('with-minimap')
    @detach()


  minimapIsAttached: -> @paneView.find('.minimap').length is 1

  # EDITOR VIEW MANAGEMENT

  unsubscribeFromEditor: ->
    @unsubscribe @editor, '.minimap' if @editor?
    @unsubscribe @scrollView, '.minimap' if @scrollView?

  subscribeToEditor: ->
    @subscribe @editor, 'scroll-top-changed.minimap', @updateScrollY
    # Hacked scroll-left
    @subscribe @scrollView, 'scroll.minimap', @updateScrollX

  getEditorViewClientRect: -> @scrollView[0].getBoundingClientRect()

  getScrollViewClientRect: -> @scrollViewLines[0].getBoundingClientRect()

  getMinimapClientRect: -> @[0].getBoundingClientRect()

  # UPDATE METHODS

  # Update Styles
  updateTheme: -> @attr 'data-theme': @configs.theme

  updateMinimapEditorView: => @miniEditorView.update()

  updateMinimapView: =>
    return unless @editorView
    return unless @indicator

    # offset minimap
    @offset top: (@offsetTop = @editorView.offset().top)

    {width, height} = @getMinimapClientRect()
    editorViewRect = @getEditorViewClientRect()
    miniScrollViewRect = @miniEditorView.getClientRect()

    width /= @scaleX
    height /= @scaleY

    evw = editorViewRect.width
    evh = editorViewRect.height

    minimapVisibilityRatio = miniScrollViewRect.height / height

    @miniScroller.height(evh / minimapVisibilityRatio)
    @miniScroller.toggleClass 'visible', minimapVisibilityRatio > 1 and @miniScrollVisible

    @miniWrapper.css {width}

    # VisibleArea's size
    @miniVisibleArea.css
      width : @indicator.width  = width
      height: @indicator.height = evh

    msvw = miniScrollViewRect.width || 0
    msvh = miniScrollViewRect.height || 0

    # Minimap's size
    @indicator.setWrapperSize width, Math.min(height, msvh)

    # Minimap ScrollView's size
    @indicator.setScrollerSize msvw, msvh

    # Compute boundary
    @indicator.updateBoundary()

    return if @frameRequested

    @frameRequested = true
    webkitRequestAnimationFrame =>
      @updateScroll()
      @frameRequested = false

  updateScrollY: (top) =>
    # Need scroll-top value when in find pane or on Vim mode(`gg`, `shift+g`).
    # Or we can find a better solution.
    if top?
      overlayY = top
    else
      scrollViewOffset = @scrollView.offset().top
      overlayerOffset = @scrollView.find('.overlayer').offset().top
      overlayY = -overlayerOffset + scrollViewOffset

    @indicator.setY(overlayY)
    @updatePositions()

  updateScrollX: =>
    @indicator.setX(@scrollView[0].scrollLeft)
    @updatePositions()

  updateScroll: =>
    @updateScrollX()
    @updateScrollY()
    @trigger 'minimap:scroll'

  updatePositions: ->
    @transform @miniVisibleArea[0], @translate(@indicator.x, @indicator.y)
    @transform @miniWrapper[0], @minimapScale + @translate(@indicator.scroller.x, @indicator.scroller.y)
    @miniEditorView.scrollTop @indicator.scroller.y * -1

    @updateScrollerPosition()

  updateScrollerPosition: ->
    height = @miniScroller.height()
    totalHeight = @height()

    scrollRange = totalHeight - height

    @transform @miniScroller[0], @translate(0, @indicator.ratioY * scrollRange)

  # EVENT CALLBACKS

  onActiveItemChanged: (item) =>
    # Fix called twice when opening minimap!

    activeView = @paneView.viewForItem(item)
    if activeView is @editorView
      @attachToPaneView() if @parent().length is 0
      @updateMinimapEditorView()
      @updateMinimapView()
    else
      @detachFromPaneView() if @parent().length is 1
      @paneView.addClass('with-minimap') if activeView?.hasClass('editor')

  onMouseWheel: (e) =>
    return if @isClicked
    {wheelDeltaX, wheelDeltaY} = e.originalEvent
    if wheelDeltaX
      @editorView.scrollLeft(@editorView.scrollLeft() - wheelDeltaX)
    if wheelDeltaY
      @editorView.scrollTop(@editorView.scrollTop() - wheelDeltaY)

  onMouseDown: (e) =>
    @isClicked = true
    e.preventDefault()
    e.stopPropagation()
    # VisibleArea's center-y
    y = e.pageY - @offsetTop
    top = @indicator.computeFromCenterY(y / @scaleY)
    # @note: currently, no animation.
    @editorView.scrollTop(top)
    # Fix trigger `mousewheel` event.
    setTimeout =>
      @isClicked = false
    , 377

  onScrollViewResized: => @updateMinimapView()

  onDragStart: (e) =>
    # only supports for left-click
    return if e.which isnt 1
    @isPressed = true
    @on 'mousemove.visible-area', @onMove
    @on 'mouseup.visible-area', @onDragEnd

  onMove: (e) =>
    @onMouseDown e if @isPressed

  onDragEnd: (e) =>
    @isPressed = false
    @off '.visible-area'

  # OTHER PRIVATE METHODS

  scale: (x=1,y=1) -> "scale(#{x}, #{y}) "
  translate: (x=0,y=0) ->
    if atom.config.get 'minimap.useHardwareAcceleration'
      "translate3d(#{x}px, #{y}px, 0)"
    else
      "translate(#{x}px, #{y}px)"

  transform: (el, transform) ->
    el.style.webkitTransform = el.style.transform = transform

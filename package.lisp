(defpackage :garnet-utils
  (:use :common-lisp)
  (:nicknames :gu)
  (:export while
	   until
	   till
	   do2lists
	   dolist2
	   m
	   m1
	   string+
	   add-to-list
	   verify-binding
	   safe-functionp
	   shell-exec
	   directory-p
	   probe-directory
	   pi/2
	   pi3/2
	   2pi -2pi
	   short-pi))

(defpackage :kr-debug
  (:use :common-lisp))

(defpackage :kr
  (:use :common-lisp :kr-debug)
  (:export schema
	   create-instance
	   create-prototype
	   create-relation
	   create-schema
	   formula
	   o-formula
	   schema-p
	   relation-p
	   is-a-p
	   has-slot-p
	   formula-p
	   s-value
	   g-value
	   g-cached-value
	   g-local-value
	   gv
	   gvl
	   gv-local
	   get-value
	   get-local-value
	   dovalues
	   doslots
	   define-method
	   kr-send
	   call-prototype-method
	   apply-prototype-method
	   method-trace
	   with-constants-disabled
	   with-types-disabled
	   with-demons-disabled
	   with-demon-disabled
	   with-demon-enabled
	   change-formula
	   move-formula
	   recompute-formula
	   copy-formula
	   kr-path
	   mark-as-changed
	   mark-as-invalid
	   ps
	   call-on-ps-slots
	   name-for-schema
	   declare-constant
	   slot-constant-p
	   destroy-slot
	   destroy-schema
	   destroy-constraint
	   def-kr-type
	   g-type
	   s-type
	   check-slot-type
	   kr-boolean
	   get-slot-doc
	   set-slot-doc
	   get-type-documentation
	   set-type-documentation
	   get-type-definition
	   get-declarations
	   get-slot-declarations
	   g-formula-value
	   s-formula-value
	   self-old-value
	   ))

(defpackage :gem
  (:use :common-lisp :kr :kr-debug)
  (:export *exposure-event-mask*
	   *fixed-font-family*
	   *large-font-point-size*
	   *large-font-size*
	   *medium-font-point-size*
	   *medium-font-size*
	   *sans-serif-font-family*
	   *serif-font-family*
	   *small-font-point-size*
	   *small-font-size*
	   *very-large-font-point-size*
	   *very-large-font-size*
	   *black*
	   *color-screen-p*
	   *function-alist*
	   *read-write-colormap-cells-p*
	   *screen-height*
	   *screen-width*
	   *update-lock*
	   *white*
	   device-info
	   copy-display-info
	   default-font-from-file
	   display-info
	   display-info-display
	   display-info-filling-style-gc
	   display-info-line-style-gc
	   display-info-root-window
	   display-info-screen
	   init-device
	   make-display-info))

(defpackage :interactors
  (:use :common-lisp :kr)
  (:nicknames :inter)
  (:export *garnet-break-key* *left-button* *trans-from-file*
	   ;; for animation
	   start-animator Stop-Animator abort-animator animator-interactor
	   animator-wrap animator-bounce Reset-All-Timer-Processes
	   ;; entering and leaving main event loop
	   main-event-loop exit-main-event-loop *garnet-break-key*
	   ;; waiting for an interaction to complete
	   Interaction-Complete Wait-Interaction-Complete
	   ;;explicit control of interactors
	   Change-Active Start-Interactor Abort-Interactor Stop-Interactor
	   ;; Called by KR when :active or :window changes:
	   Notice-Interactor-Slot-Changed
	   ;; support for multiple priority levels
	   priority-level normal-priority-level high-priority-level
	   running-priority-level priority-level-list
	   ;; the next ones are for debugging
	   Reset-Inter-Levels Print-Inter-Levels Print-Inter-Windows
	   trace-inter untrace-inter *debug-next-inter* Do-All-Interactors
	   ;; interactor event structure (copy of X's event structure)
	   *Current-Event* *Garnet-Break-Key*
	   event-x event-y event-char event-code event-mousep
	   event-downp event-window event-timestamp make-event
	   ;; for controlling double clicks
	   *double-click-time*
	   ;; key translations for text-inter
	   Bind-Key Unbind-Key Unbind-All-Keys Set-Default-Key-Translations
	   ;;transcripting functions
	   Transcript-Events-To-File Close-Transcript
	   Transcript-Events-From-File
	   ;; useful utility functions
	   Clip-And-Map Beep Insert-Text-Into-String Warp-Pointer
	   Pop-Up-Win-And-Start-Interactor
	   ;; functions for dealing with selection for button and menu
	   Return-Final-Selection-Objs DeSelectObj SelectObj
	   ;; the various exported interactor types
	   interactor interactor-window button-interactor text-interactor
	   two-point-interactor move-grow-interactor menu-interactor
	   angle-interactor scroll-wheel-interactor
	   ;; Export these if debugging is enabled.
	   #+garnet-debug *int-debug* #+garnet-debug *int-trace*
	   ))


(defpackage :demo
  (:use :common-lisp :kr))


(defpackage :clx-truetype
  (:nicknames :xft)
  (:use :cl :kr)
  (:export
   :font
   :font-family
   :font-subfamily
   :font-size
   :font-underline
   :font-strikethrough
   :font-overline
   :font-background
   :font-foreground
   :font-overwrite-gcontext
   :cache-font-file
   :*font-dirs*
   :drawable-screen
   :font-ascent
   :font-descent
   :text-bounding-box
   :xmin
   :ymin
   :xmax
   :ymax
   :screen-default-dpi
   :screen-dpi
   :draw-text
   :draw-text-line
   :get-font-families
   :get-font-subfamilies
   :text-height
   :text-width
   :text-line-bounding-box
   :text-line-width
   :text-line-height
   :font-line-gap
   :baseline-to-baseline
   :font-antialias
   :font-lines-height
   :cache-fonts
   :font-equal)
  (:documentation "Package contains API for TrueType text rendering using CLX, XRender.
Glyphs information is obtained by ZPB-TTF. Font rasterization is made by CL-VECTORS."))

(defpackage :clx-truetype-test
  (:nicknames :xft-test)
  (:use :cl :xft)
  (:export show-window))

(defpackage :garnet-user
  (:use :common-lisp :kr :clx-truetype-test))

(defpackage :garnet-truetype
  (:nicknames :garnet-xft)
  (:use :cl :kr)
  (:export
   :font
   :font-family
   :font-subfamily
   :font-size
   :font-underline
   :font-strikethrough
   :font-overline
   :font-background
   :font-foreground
   :font-overwrite-gcontext
   :cache-font-file
   :*font-dirs*
   :drawable-screen
   :font-ascent
   :font-descent
   :text-bounding-box
   :xmin
   :ymin
   :xmax
   :ymax
   :screen-default-dpi
   :screen-dpi
   :draw-text
   :draw-text-line
   :get-font-families
   :get-font-subfamilies
   :text-height
   :text-width
   :text-line-bounding-box
   :text-line-width
   :text-line-height
   :font-line-gap
   :baseline-to-baseline
   :font-antialias
   :font-lines-height
   :cache-fonts
   :font-equal)
  (:documentation "Package contains API for TrueType text rendering
                   using CLX, XRender.  Glyphs information is obtained
                   by ZPB-TTF. Font rasterization is made by
                   CL-VECTORS."))

(defpackage :garnet-gadgets
  (:use :common-lisp :kr)
  (:nicknames :gg)
  (:export
   :mouseline-go
   :mouseline-stop))

(defpackage :test
  (:use :common-lisp))

(defpackage :GARNET-UTILS (:use :COMMON-LISP) (:nicknames :GU))
(defpackage :KR-DEBUG (:use :COMMON-LISP))

(defpackage :KR (:use :COMMON-LISP :KR-DEBUG))
(defpackage :OPAL (:use :COMMON-LISP :KR))

(defpackage :GARNET-DEBUG (:use :COMMON-LISP :KR :OPAL) (:nicknames :GD))
(defpackage :GILT (:use :COMMON-LISP :KR))
(defpackage :C32 (:use :COMMON-LISP :KR))
(defpackage :LAPIDARY (:use :COMMON-LISP :KR))


(defpackage :AGATE (:use :COMMON-LISP :KR))
(defpackage :DEMO-3D (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP))

(defpackage :XOMAX
  (:use :COMMON-LISP :KR)
  (:export DO-GO DO-STOP))

(defpackage :DEMO-MULTIWIN (:use :KR :COMMON-LISP) (:export DO-GO DO-STOP))
(defpackage :DEMO-MULTIFONT (:use :COMMON-LISP KR) (:export DO-GO DO-STOP))
(defpackage :DEMO-ANIMATOR (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP))
(defpackage :DEMO-ANGLE (:use :KR :COMMON-LISP) (:export DO-GO DO-STOP))
(defpackage :DEMO-OTHELLO (:use :KR :COMMON-LISP) (:nicknames :DOTH)
	    (:export DO-GO DO-STOP START-GAME STOP-GAME SET-SCORE))
(defpackage :DEMO-PIXMAP (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP))
(defpackage :DEMO-ARITH (:use :KR :COMMON-LISP) (:export DO-GO DO-STOP))
(defpackage :DEMO-SCHEMA-BROWSER (:use :COMMON-LISP :KR)
	    (:export DO-GO DO-STOP SCHEMA-BROWSER SCHEMA-BROWSER-WIN
		     SCHEMA-BROWSER-TOP-AGG))
(defpackage :DEMO-ARRAY (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP))
(defpackage :DEMO-SCROLLBAR (:use :COMMON-LISP :KR)
	    (:export DO-GO DO-STOP
		     MAC-obj MAC-Go MAC-Stop
		     Open-obj Open-Go Open-Stop
		     NEXT-obj NEXT-Go NEXT-Stop
		     Motif-obj Motif-Go Motif-Stop))
(defpackage :DEMO-CLOCK (:use :KR :COMMON-LISP) (:export DO-GO DO-STOP))
(defpackage :DEMO-SEQUENCE (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP))
(defpackage :DEMO-EDITOR (:use :KR :COMMON-LISP) (:export DO-GO DO-STOP))
(defpackage :DEMO-TEXT (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP))
(defpackage :DEMO-FILE-BROWSER (:use :COMMON-LISP :KR)
	    (:export DO-GO DO-STOP FILE-BROWSER FILE-BROWSER-WIN
		     FILE-BROWSER-TOP-AGG))
(defpackage :DEMO-TRUCK (:use :KR :COMMON-LISP) (:export DO-GO DO-STOP))
(defpackage :DEMO-GADGETS (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP))
(defpackage :DEMO-TWOP (:use :KR :COMMON-LISP) (:export DO-GO DO-STOP))
(defpackage :DEMO-GESTURE (:use :KR :COMMON-LISP) (:export DO-GO DO-STOP))
(defpackage :DEMO-UNISTROKES (:use :COMMON-LISP :KR :INTER) (:export DO-GO DO-STOP))
(defpackage :DEMO-GRAPH (:use :COMMON-LISP :KR)
	    (:export DO-GO DO-STOP SCHEMA-GRAPH DEMO-GRAPH-ERROR-GADGET ROOT-BOX
		     RELAYOUT DEMO-GRAPH-WIN))
(defpackage :DEMO-VIRTUAL-AGG (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP))
(defpackage :DEMO-GROW (:use :KR :COMMON-LISP) (:export DO-GO DO-STOP))
(defpackage :DEMO-XASPERATE (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP))
(defpackage :DEMO-LOGO (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP RE-ANIMATE))
(defpackage :DEMOS-CONTROLLER (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP MESSAGE))
(defpackage :DEMO-MANYOBJS (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP MOVE))
(defpackage :DEMO-MENU (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP))
(defpackage :GARNET-CALCULATOR (:use :COMMON-LISP :KR)
	    (:export START-CALC STOP-CALC DO-GO DO-STOP))
(defpackage :DEMO-MODE (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP))
(defpackage :GARNETDRAW (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP))
(defpackage :DEMO-MOTIF (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP))
(defpackage :MGE (:use :COMMON-LISP :KR)
	    (:export DO-GO DO-STOP
		     CREATE-PIECE DESTROY-PIECE DESTROY-ALL-PIECES
		     GO-INITIALIZE EDITOR-SHOW-WINDOW))
(defpackage :DEMO-MOVELINE (:use :KR :COMMON-LISP) (:export DO-GO DO-STOP))

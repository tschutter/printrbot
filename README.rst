printrbot
=========

All things needed to drive my Printrbot Plus V1.

Usage
-----
::

    sudo apt-get install python-serial python-wxgtk2.8 python-pyglet openscad
    git clone --recursive git@github.com:tschutter/printrbot.git
    cd printrbot
    git submodule init
    git submodule update
    wget -P /tmp http://dl.slic3r.org/linux/slic3r-linux-x86-1-0-1-stable.tar.gz
    tar xzf /tmp/slic3r-linux-*.tar.gz

Tools
-----

* `Slic3r`_ takes a 3D model and converts (slices) it into printer
  instructions (G-code) for a 3D printer.  It's main competitors are
  `Skeinforge`_, `Cura`_, and `Makerware`_.  A comparison of these
  tools can be found at `Skeinforge(RepG) vs Cura vs Makerware vs
  Slic3r et al`_.

* `OpenSCAD`_ "The Programmers Solid 3D CAD Modeller" is used for
  creating solid 3D CAD models.  OpenSCAD is not an interactive
  modeller. Instead it is a compiler that reads in a script file that
  describes the object and renders the 3D model from this script file.

Calibration
-----------

The Z-axis end stop should be adjusted so that you can slip two
thicknesses of index card between the print head and the print bed.

When adjusting the Z-axis end stop, you must press the "Z-home" button
instead of just using the Z-axis move buttons.  When using the move
buttons, the hardware will not lower print head below what it thinks
the Z = 0 position, which is set the last time you powered up the
printer or pressed "Z-Home".

Modifications
-------------

Nobody runs a stock Printrbot, and mine is no exception.

* Stiffened the X-axis with a piece of 1/2" aluminum U-channel 14" long.

* Added a 50mm cooling fan using a printed `Printbot LC 50mm Fan
  Mount`_ to prevent the extruder from melting previously printed
  layers.

* Covered the heated printer bed with a 9" by 9" piece of glass to
  prevent bed warping.

* Placed a 9" by 9" by 3/16" cork tile under the heated printer bed
  for thermal insulation.

* Replaced the extruder herringbone gears with `Spur Gears`.
  Herringbone gears are intended for high-speed applications.  Their
  use is not appropriate for the extruder and mine were slightly
  warped.

Slic3r Config
-------------

With each new version of Slic3r, the configuration file changes.  It
is easiest to export a new .ini file from Slic3r and modify it as
follows.

* ``filament_diameter = 2.95``

    Measured with a caliper at various points along the filament.

* ``first_layer_bed_temperature = 80``

    Current suggestion by the web for ABS.

* ``bed_temperature = 75``

    Current suggestion by the web for ABS.

* ``first_layer_temperature = 230``

    Current suggestion by the web for ABS.

* ``temperature = 230``

    Current suggestion by the web for ABS.

* ``first_layer_height = 0.25``

    Sounds about right.

* ``layer_height = 0.2``

    Sounds about right.

* ``start_gcode = DEFAULT + \nM92 X62.7\nM92 Y62.8\nM92 Z2387.0719\nM92 E536``

    Adjust axis_steps_per_unit for each axis and extruder.  Probably
    set in 2012 based upon the print of a 40mm cube.

* ``min_skirt_length = 4``

    Impose a minimum skirt length to ensure that the extruder is
    primed.  This compensates for the filament that oozes from the
    extruder when we are waiting for everything to come up to the
    proper temperature.  Note that the value is supposed to be in mm,
    but it is most certainly not.  The correct value here is 250 mm.

* ``max_fan_speed = 80``

    If the fan runs at 100% of the rated speed, it cools the part (or
    the print bed) so much that it tends to pop off of the print bed
    after a dozen or so layers.  Using a fan duct may improve this
    problem.

Links
-----

* `Printrun (pronterface and pronsole)
  <https://github.com/kliment/Printrun>`__

* `Using slic3r with pronterface
  <http://www.printrbottalk.com/wiki/index.php?title=Using_slic3r_with_pronterface>`__

* `Printrun @ RepRap wiki <http://reprap.org/wiki/Printrun>`__

.. _Slic3r: http://slic3r.org/
.. _Skeinforge: http://reprap.org/wiki/Skeinforge/
.. _Cura: http://software.ultimaker.com/
.. _Makerware: https://www.makerbot.com/makerware/
.. _Skeinforge(RepG) vs Cura vs Makerware vs Slic3r et al: https://groups.google.com/forum/#!topic/flashforge/D1VHlkvOLxg
.. _OpenSCAD: http://www.openscad.org/
.. _Printbot LC 50mm Fan Mount: http://www.thingiverse.com/thing:26775
.. _Spur Gears: http://www.thingiverse.com/thing:26243
.. _G-code: http://reprap.org/wiki/G-code

printrbot
=========

All things needed to drive my Printrbot Plus V1.

Usage
-----
::

    sudo apt-get install python-serial python-wxgtk2.8 python-pyglet
    git clone --recursive git@github.com:tschutter/printrbot.git
    cd printrbot
    git submodule init
    git submodule update
    wget -P /tmp http://dl.slic3r.org/linux/slic3r-linux-x86-1-0-1-stable.tar.gz
    tar xzf /tmp/slic3r-linux-*.tar.gz

Tools
-----

* `Slic3r`_ takes a 3D model and converts it (slices it) into printer
  instructions (G-code) for a 3D printer.  It's main competitors are
  `Skeinforge`_, `Cura`_, and `Makerware`_.  A comparison of these
  tools can be found at `Skeinforge(RepG) vs Cura vs Makerware vs
  Slic3r et al`_.

Modifications
-------------

Nobody runs a stock Printrbot, and mine is no exception.

* Stiffened the X-axis with a piece of 1/2" aluminum U-channel 14" long.

* Added a 2" cooling fan using a printed bracket.

* Covered the heated printer bed with a 9" by 9" piece of glass to
  prevent bed warping.

* Placed a 9" by 9" by 3/16" cork tile under the heated printer bed
  for thermal insulation.
 
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

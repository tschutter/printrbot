printrbot
=========

All things needed to drive my Printrbot+

Usage
-----
::

    sudo apt-get install python-serial python-wxgtk2.8 python-pyglet
    git clone --recursive git@github.com:tschutter/printrbot.git
    cd printrbot
    wget -P /tmp http://dl.slic3r.org/linux/slic3r-linux-x86-1-0-0-stable.tar.gz
    tar xzf /tmp/slic3r-linux-*.tar.gz

Tools
-----

* `Slic3r <http://slic3r.org/>` takes a 3D model and converts it
  (slices it) into printer instructions (G-code) for a 3D printer.
  It's main competitors are `Skeinforge
  <http://reprap.org/wiki/Skeinforge>`, `Cura
  <http://software.ultimaker.com/>`, and `Makerware
  <https://www.makerbot.com/makerware/>`.  A comparison of these tools
  can be found at `Skeinforge(RepG) vs Cura vs Makerware vs Slic3r et
  al
  <https://groups.google.com/forum/#!topic/flashforge/D1VHlkvOLxg>`.

Links
-----

* `Printrun (pronterface and pronsole)
  <https://github.com/kliment/Printrun>`__

* `Slic3r <http://slic3r.org/>`__

* `Using slic3r with pronterface
  <http://www.printrbottalk.com/wiki/index.php?title=Using_slic3r_with_pronterface>`__

* `Printrun @ RepRap wiki <http://reprap.org/wiki/Printrun>`__
